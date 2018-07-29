package amordemascotas

import com.amordemascotas.Role
import com.amordemascotas.User
import com.amordemascotas.UserRole
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class UserService {

    @Secured('permitAll')
    User createUser(String username, String password, String name, String email, Date fechaNacimiento, String sexo) {
        try {
            User user = new User(username, password, name, email, fechaNacimiento, sexo);
            user.save()
            Role role = Role.findByAuthority("ROLE_USER");
            UserRole.create(user, role).save()
            log.info("[CREATE NEW USER : USERNAME:${user.username} - ID:${user.id} - ROLE:${role.authority}]")

            return user;
        } catch (Exception e) {
            log.error(e.getMessage())

            throw e;
        }

    }

    boolean generateNewToken(String username, String email) {
        User user = User.findByUsernameOrEmail(username, email)
        String token = UUID.randomUUID().toString().split("-")[0];
        println "new token: "+token;
        user.token = token;
        user.save();

        if(user.hasErrors()){
            user.errors.allErrors.each {
                println it
            };

            return false;
        }

        return true;
    }

    boolean validToken(String token, String username) {
        def c = User.createCriteria()
        def results = c.list {
            and {
                eq("token", token)
            }
            and {
                or{
                    eq('username', username)
                    eq('email', username)
                }
            }
        }

        if(results){

            return true;
        }

        return false;
    }

    boolean changePassword(String username, String email, String password) {
        User user = getUserByUsernameOrEmail(username, email)

        user.password = password;
        user.save();

        if(user.hasErrors()){
            user.errors.allErrors.each {
                println it
            };

            return false;
        }

        return true;
    }

    User getUserByUsernameOrEmail(String username, String email) {
        return User.findByUsernameOrEmail(username, email)
    }
}

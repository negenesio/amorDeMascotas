package amordemascotas

import com.amordemascotas.Role
import com.amordemascotas.User
import com.amordemascotas.UserRole
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class UserService {

    @Secured('permitAll')
    boolean createUser(User user) {
        try {
            user.save()
            Role role = Role.findByAuthority("ROLE_USER");
            UserRole.create(user, role).save()
            log.info("[CREATE NEW USER : USERNAME:${user.username} - ID:${user.id} - ROLE:${role.authority}]")

            return true;
        } catch (Exception e) {
            log.error(e)

            throw e;
        }

    }
}

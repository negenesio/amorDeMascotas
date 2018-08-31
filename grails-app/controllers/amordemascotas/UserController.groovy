package amordemascotas

import com.amordemascotas.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.userdetails.UserDetailsService

class UserController {

    def userService
    def userEmailUserService

    @Secured('permitAll')
    def registerUserIndex() {

    }

    @Secured('permitAll')
    def createUser() {
        println params;
        User result = userService.createUser(params.username_register, params.password_register, params.name, params.email, Date.parse("yyyy-MM-dd", params.fecha_nacimiento), params.sexo);

        if(result){
            userEmailUserService.loadUserByUsername(result.username)

            return redirect(uri: "/home");
        } else {

            return redirect(uri: "/error");
        }
    }

    @Secured('permitAll')
    def isUsernameOrEmailExists() {

        println "isUsernameOrEmailExists: "+params;
        String username = params?.username;
        String email = params?.username;

        boolean recoveryPassword = params?.recovery_password
        User user = userService.getUserByUsernameOrEmail(username, email);

        if(recoveryPassword) {
            if(user) {
                if(userService.generateNewToken(username, email)) {

                    return render(["valid": true] as JSON);
                } else {

                    return false;
                }
            } else {

                return render(["valid": false] as JSON)
            }
        }

        if(!recoveryPassword && user){
            return render(["valid": false] as JSON);
        } else {
            return render(["valid": true] as JSON);
        }
    }

    @Secured('isAnonymous()')
    def recoveryPassword(){

    }

    @Secured('isAnonymous()')
    def recoveryPasswordValidToken(){
        println "recoveryPasswordValidToken: "+params
        String token = params.token;
        String username = params.username_valid_token;
        if(userService.validToken(token, username)) {

            return render('{"valid": true}');
        } else {

            return render('{"valid": false}');
        }

    }
    @Secured('isAnonymous()')
    def recoveryPasswordChange(){
        String password = params.password_change
        String username = params.username_password_change
        String email = params.username_password_change

        if(userService.changePassword(username, email, password)) {
            userEmailUserService.loadUserByUsername(username)

            return redirect(uri: "/home");
        } else {

            return redirect(uri: "/error");
        }
    }

}

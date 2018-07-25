package amordemascotas

import com.amordemascotas.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.userdetails.UserDetailsService

class UserController {

    def userService
    def userEmailUserService

    @Secured('permitAll')
    def createUser() {
        println params;
        User user = new User(params.username, params.password, params.name, params.email, Date.parse("yyyy-MM-dd", params.fecha_nacimiento));
        boolean result = userService.createUser(user);

        userEmailUserService.loadUserByUsername(user.username)

        if(result){

            return redirect(uri: "/home");
        } else {

            return render("ALGO FALLÓ");
        }
    }

    @Secured('permitAll')
    def isUsernameOrEmailExists() {

        String username = params?.username;
        String email = params?.email;

        if(User.findByUsernameOrEmail(username, email)){
            return render(["valid": false] as JSON);
        } else {
            return render(["valid": true] as JSON);
        }
    }
}

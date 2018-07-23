package amordemascotas

import com.amordemascotas.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder;



class SecuritySessionController {

    def springSecurityService

    @Secured('permitAll')
    def isLoginSuccess() {
        if(springSecurityService.isLoggedIn()) {
            User user = User.findById(springSecurityService.currentUserId)
            return render("true")
        }

        return render("false")
    }

}

package amordemascotas

import com.amordemascotas.Encuentros
import com.amordemascotas.Raza
import com.amordemascotas.User
import com.amordemascotas.Mascota
import grails.plugin.springsecurity.annotation.Secured

class AdministratorController {

    def springSecurityService
    AdministratorService administratorService

    @Secured('isAuthenticated()')
    def index() {
        User user = springSecurityService.getCurrentUser();
        int offset = 0;
        if(params.offset){
            offset = Integer.parseInt(params.offset);
        }

        [mascotas: Mascota.findAllByUser(user,[max:5, offset:offset, sort: 'id', order:'DESC']), mascotasCount: Mascota.findAllByUser(user).size()]
    }
}

package amordemascotas

import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    @Secured('isAuthenticated()')
    def registrarMascota() {
        return render(view:"registerMascotaIndex")
    }
}

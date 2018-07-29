package amordemascotas

import grails.plugin.springsecurity.annotation.Secured

class AdministratorController {

    @Secured('isAuthenticated()')
    def index() {
        return render(view: "index");
    }
}

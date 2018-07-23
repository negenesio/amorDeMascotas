package amordemascotas

import grails.plugin.springsecurity.annotation.Secured;

class TestController {

    @Secured('permitAll')
    def index() {
        return render("Hola a todo el mundo");
    }

    @Secured('ROLE_ADMIN')
    def admin() {
        return render("solo para admin");
    }
}

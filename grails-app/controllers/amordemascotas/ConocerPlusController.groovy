package amordemascotas

import grails.plugin.springsecurity.annotation.Secured

class ConocerPlusController {

    @Secured('permitAll')
    def conocerPlus() {
        redirect(mapping: "/index")
    }

    @Secured('permitAll')
    def index() {

    }

}

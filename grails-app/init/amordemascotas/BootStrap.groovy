package amordemascotas

import com.amordemascotas.Role
import com.amordemascotas.User
import com.amordemascotas.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        Date fechaNacimiento = Date.parse("yyyy-MM-dd", "1989-07-15")
        Date fechaNacimiento2 = Date.parse("yyyy-MM-dd", "1970-07-15")
        def testUser = new User('me', 'password', "nico", "genesio", fechaNacimiento).save()
        def adminUser = new User('admin', 'admin', 'administrator', 'administrator', fechaNacimiento2).save()

        UserRole.create testUser, userRole
        UserRole.create adminUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2
    }
    def destroy = {
    }
}

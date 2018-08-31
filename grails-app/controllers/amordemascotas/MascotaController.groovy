package amordemascotas

import com.amordemascotas.Mascota
import com.amordemascotas.Raza
import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    def mascotaService

    @Secured('isAuthenticated()')
    def registrarMascota() {
        return render(view:"registerMascotaIndex")
    }

    @Secured('isAuthenticated()')
    def crearMascota() {
        println "CREATE MASCOTA: "+params
        String name = params.mascota_name
        Date fechaNacimiento = Date.parse( 'yyyy', params.mascota_fecha_nacimiento);
        String sexo = params.mascota_sexo
        Raza raza = Raza.findById(params.mascota_raza.toLong());
        String descripcion = params.descripcion

        Mascota mascota = mascotaService.crearMascota(name, fechaNacimiento, sexo, raza, descripcion)
        if(mascota) {

            return render(true);
        } else {

            return render(false);
        }
    }
}

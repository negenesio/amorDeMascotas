package amordemascotas

import com.amordemascotas.Mascota
import com.amordemascotas.Raza
import com.amordemascotas.User
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class MascotaService {
    def springSecurityService;

    Mascota crearMascota(String name, Date fechaNacimiento, String sexo, Raza raza, String descripcion) {
        try {
            User user = springSecurityService.getCurrentUser()
            Mascota mascota = new Mascota(nombre: name, fechaNacimiento: fechaNacimiento, user: User.findById(user.id), sexo: sexo, raza: raza, descripcion: descripcion)
            mascota.save(flush: true, failOnError: true)
            if (mascota.hasErrors()) {
                mascota.errors.allErrors.each {
                    println it
                };
            }
            log.info("[ [USER: ${springSecurityService.currentUserId}] - CREATE NEW MASCOTA : NAME:${mascota.nombre} - ID:${mascota.id} - RAZA:${mascota.raza.descripcion}]")

            return mascota
        } catch(ValidationException duplicate) {
            return null;
        } catch(Exception e) {
            log.error(e.getMessage())

            throw e;
        }

    }
}

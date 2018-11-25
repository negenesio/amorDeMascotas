package amordemascotas

import com.amordemascotas.EstadisticasMascota
import com.amordemascotas.Imagenes
import com.amordemascotas.Mascota
import com.amordemascotas.Raza
import com.amordemascotas.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

class MascotaController {

    def mascotaService;
    def springSecurityService;
    def imagenesService;
    def grailsResourceLocator;
    EstadisticasMascotaService estadisticasMascotaService


    @Secured('isAuthenticated()')
    def registrarMascota() {

        return render(view:"registerMascotaIndex")
    }

    @Secured('isAuthenticated()')
    def crearMascota() {
        Map result = new HashMap()
        String name = params.mascota_name
        Date fechaNacimiento = Date.parse( 'yyyy', params.mascota_fecha_nacimiento);
        String sexo = params.mascota_sexo
        Raza raza = Raza.findById(params.mascota_raza.toLong());
        String descripcion = params.descripcion

        Mascota mascota = mascotaService.crearMascota(name, fechaNacimiento, sexo, raza, descripcion)
        if(mascota) {
            estadisticasMascotaService.createEstadisticas(mascota, mascota.user)
            return render(status:201, text:([success:true, mascotaId:mascota.id] as JSON).toString(),contentType: 'application/json')
        } else {
            result.success = false

            return render(result);
        }
    }

    @Secured('isAuthenticated()')
    def editarMascota() {
        User user = springSecurityService.getCurrentUser();
        Mascota mascota = Mascota.findByIdAndUser(params.mascotaId.toLong(), user);
        List<Imagenes> imagenesList = Imagenes.findAllByMascota(mascota);

        return render(view:"editarMascota", model: [mascota: mascota, imagenes: imagenesList])
    }

    @Secured('isAuthenticated()')
    def actualizarMascota() {
        println params

        def image = grailsResourceLocator.findResourceForURI('default.png').file.bytes
        Long mascotaId = params.mascotaUpdateId.toLong()
        Mascota mascota = Mascota.findById(mascotaId);
        mascota.nombre = params.mascota_name
        mascota.sexo = params.mascota_sexo
        mascota.fechaNacimiento = Date.parse( 'yyyy', params.mascota_fecha_nacimiento);
        mascota.raza = Raza.findById(params.mascota_raza);
        mascota.descripcion = params.descripcion
        mascota.fechaCreacion = new Date();

        List<Imagenes> imagenesList = Imagenes.findAllByMascota(mascota);

        if(params.images1.filename != "") {
            imagenesService.uploadImagen(1, true, mascotaId, params.images1, "images1", null)
        } else {
            if(imagenesList[0].nombre != "default" && params.image1Name != 'images1') {
                imagenesService.uploadImagen(1, true, mascotaId, null, "default", image)
            }
        }

        if(params.images2.filename != "") {
            imagenesService.uploadImagen(2, true, mascotaId, params.images2, "images2", null)
        } else {
            if(imagenesList[1].nombre != "default" && params.image2Name != 'images2') {
                imagenesService.uploadImagen(2, true, mascotaId, null, "default", image)
            }
        }

        try {
            mascota.save(flush: true, failOnError: true)
            if (mascota.hasErrors()) {
                mascota.errors.allErrors.each {
                    println it
                };
            }
            return redirect(controller: 'administrator', action: 'index')
        } catch (ValidationException duplicate) {
            return null;
        } catch (Exception e ){
            return e;
        }


    }

    @Secured('isAuthenticated()')
    def validarDuplicado() {
        println params
        User user = springSecurityService.getCurrentUser();
        Mascota mascota = Mascota.findByUserAndNombreAndSexoAndFechaNacimiento(user, params.nombre, params.sexo, Date.parse( 'yyyy', params.fecha_nacimiento))
        if(mascota && mascota.id != params.mascotaId.toLong()) {
            return render("duplicado")
        }

        return render("valido")
    }

    @Secured('isAuthenticated()')
    def borrarMascota() {
        println params
        User user = springSecurityService.getCurrentUser();
        Long id = params.mascotaId.toLong()
        Mascota mascota = Mascota.findByUserAndId(user, id);
        List<EstadisticasMascota> estadisticasMascota = EstadisticasMascota.findAllByMascota(mascota);
        if (estadisticasMascota) {
            estadisticasMascota.forEach { estadostica ->
                estadostica.delete(flush: true);
            }
            if (mascota) {
                List<Imagenes> imagenesList = Imagenes.findAllByMascota(mascota)
                imagenesList.each { imagen ->
                    imagen.delete(flush: true)
                    if (imagen.hasErrors()) {
                        imagen.errors.allErrors.each {
                        }
                        return render("false")
                    }
                }

                mascota.delete(flush: true)
                if (mascota.hasErrors()) {
                    mascota.errors.allErrors.each {
                    }
                    return render("false")
                }

                //return redirect(controller: 'administrator', action: 'index')
                return render("true")
            }
        }
    }
}

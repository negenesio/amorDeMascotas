package amordemascotas

import com.amordemascotas.Imagenes
import grails.plugin.springsecurity.annotation.Secured
import org.grails.core.io.ResourceLocator


class ImagenesController {

    ResourceLocator grailsResourceLocator
    ImagenesService imagenesService
    def index() { }

    @Secured('isAuthenticated()')
    def uploadImg() {
        def image = grailsResourceLocator.findResourceForURI('default.png').file.bytes
        Long mascotaId = params.mascotaCreateId.toLong()

        if(params.images1.filename != "") {
            imagenesService.uploadImagen(1, false, mascotaId, params.images1, "images1", null)
        } else {
            imagenesService.uploadImagen(1, false, mascotaId, null, "default", image)
        }

        if(params.images2.filename != "") {
            imagenesService.uploadImagen(2, false, mascotaId, params.images2, "images2", null)
        } else {
            imagenesService.uploadImagen(2, false, mascotaId, null, "default", image)
        }

        return redirect(uri: "/home");
    }

    @Secured('isAuthenticated()')
    def viewImage() {
        Imagenes imagen = Imagenes.get(params.id)
        byte[] image = imagen.imagen
        response.outputStream << image
    }
}

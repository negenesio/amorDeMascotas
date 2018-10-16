package amordemascotas

import com.amordemascotas.Imagenes
import com.amordemascotas.Mascota
import grails.gorm.transactions.Transactional

@Transactional
class ImagenesService {

    def serviceMethod() {
    }

    def uploadImagen(int orderImagen, Boolean update, Long mascotaId, def file, String name, def fileDefault = null) {
        Mascota mascota = Mascota.findById(mascotaId)
        ArrayList<Imagenes> imagenes = Imagenes.findAllByMascota(mascota)
        byte[] fileBytes
        String contentType
        Imagenes imagenUpdate = new Imagenes();
        if(update) {
            if(orderImagen == 1) {
                Imagenes image1 = imagenes[0];
                image1.nombre = name
                image1.mascota = mascota
                if(file) {
                    image1.imagen = file.bytes
                    image1.type = file.contentType
                } else {
                    image1.imagen = fileDefault
                    image1.type = "image/png"
                }
                imagenUpdate = image1;
            }

            if(orderImagen == 2) {
                Imagenes image2 = imagenes[1];
                image2.nombre = name
                image2.mascota = mascota
                if(file) {
                    image2.imagen = file.bytes
                    image2.type = file.contentType
                } else {
                    image2.imagen = fileDefault
                    image2.type = "image/png"
                }
                imagenUpdate = image2;
            }

            imagenUpdate.save(failOnError: true)
            if(imagenUpdate.hasErrors()){
                imagenUpdate.errors.allErrors.each {
                }

                return 'false'
            }

            return "true"
        } else {
            if(imagenes.size() < 2){
                if(file) {
                    fileBytes = file.bytes
                    contentType = file.contentType

                } else {
                    fileBytes = fileDefault
                    contentType = "image/png"
                }

                Imagenes imagen = new Imagenes(mascota: mascota, imagen: fileBytes, type: contentType, nombre: name)
                imagen.save(failOnError: true)
                if(imagen.hasErrors()){
                    imagen.errors.allErrors.each {
                    }

                    return 'false'
                }

                return "true"
            }
        }


        return "fail"
    }
}

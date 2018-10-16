package amordemascotas

import com.amordemascotas.Encuentros
import com.amordemascotas.Imagenes
import com.amordemascotas.Mascota
import com.amordemascotas.Raza
import com.amordemascotas.User
import grails.plugin.springsecurity.annotation.Secured

class EncuentroController {

    def springSecurityService;

    @Secured('isAuthenticated()')
    def encuentroIndex() {

        User user = springSecurityService.getCurrentUser();
        List<Encuentros> encuentrosList= Encuentros.findAllByUserOwnerAndStatus(user,'in_progress');
        if(encuentrosList.empty) {
            int offset = 0;
            if(params.offset){
                offset = Integer.parseInt(params.offset);
            }

            return [encuentros:encuentrosList, mascotas: Mascota.findAllByUser(user,[max:5, offset:offset, sort: 'id', order:'DESC']), mascotasCount: Mascota.findAllByUser(user).size()]
        } else {

            return render(view: "/encuentro/encuentroIndex", model:[encuentros:encuentrosList, mascotas:[]])
        }


    }

    @Secured('isAuthenticated()')
    def encuentroBusqueda() {
        User userOwner = springSecurityService.getCurrentUser();
        Mascota mascotaOwner = Mascota.findByIdAndUser(params.mascotaId.toLong(), userOwner);
        List<Imagenes> imagenesOwnerList = Imagenes.findAllByMascota(mascotaOwner);
        List<Encuentros> encuentrosOwnerList = Encuentros.findAllByUserOwnerAndMascotaOwnerAndStatusNotEqual(userOwner, mascotaOwner, 'in_progress')

        String sexoOwner = mascotaOwner.sexo
        String sexoFind = ""
        if(sexoOwner == 'macho') {
            sexoFind = 'hembra'
        } else {
            sexoFind = 'macho'
        }
        Raza razaProximo = mascotaOwner.raza;

        List<Encuentros> encuentrosOwnerAllList = Encuentros.findAllByUserOwnerAndMascotaOwnerAndStatusNotEqual(userOwner, mascotaOwner, 'in_progress')
        println "HOLA"+encuentrosOwnerAllList.mascotaFind.id;
        List<Mascota> mascotaFindList = Mascota.findAllByRazaAndSexoAndUserNotEqualAndIdNotInList(razaProximo,sexoFind, userOwner, encuentrosOwnerAllList.mascotaFind.id, [sort: 'id', order: 'DESC'])
        Mascota mascotaFind = null;
        if(mascotaFindList) {
            mascotaFind = mascotaFindList.get(new Random().nextInt(mascotaFindList.size()))
        }
         if(mascotaFind) {
             List<Imagenes> imagenesFindList = Imagenes.findAllByMascota(mascotaFind)
             Encuentros readyCreate = Encuentros.findByMascotaFindAndMascotaOwnerAndUserFindAndUserOwner(mascotaFind, mascotaOwner, mascotaOwner.user, mascotaOwner.user)
             if(!readyCreate) {
                 Encuentros encuentrosNew = new Encuentros(mascotaFind: mascotaFind, mascotaOwner: mascotaOwner, status: 'initial', userFind: mascotaFind.user, userOwner: userOwner)
                 encuentrosNew.save(failOnError:true);
                 println "- No existe el encuentro, vamos a crearlo: "+readyCreate.id
             } else {
                 println "- El encuentro ya existe, por lo que no hace falta crearlo: "+readyCreate.id
             }

             return [mascotaOwner: mascotaOwner, imagenesOwner: imagenesOwnerList, mascotaFind: mascotaFind, imagenesFind: imagenesFindList]
         }

        return [mascotaOwner: mascotaOwner, imagenesOwner: imagenesOwnerList]
    }

    /*def buscarProximo(Mascota mascota) {
        String sexo = mascota.sexo

        String sexoProximo = ""
        if(sexo == 'macho') {
            sexoProximo = 'hembra'
        } else {
            sexoProximo = 'macho'
        }
        Raza razaProximo = mascota.raza;
        User owner = springSecurityService.getCurrentUser();

        List<Mascota> mascotaList = Mascota.findAllByRazaAndSexoAndUserNotEqual(razaProximo,sexoProximo, owner, [sort: 'id', order: 'DESC'])
        List<Encuentros> encuentrosList = new ArrayList<>();
        mascotaList.each{ mascotaFind ->
            Encuentros encuentros = new Encuentros(status:'initial', mascotaOwner: mascota, mascotaFind: mascotaFind, userOwner: owner, userFind: mascotaFind.user)
            encuentros.save(failOnError:true);
            encuentrosList.add(encuentros);
        }

        [encuentros:encuentrosList[0]]
    }*/


}

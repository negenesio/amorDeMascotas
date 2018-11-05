package amordemascotas

import com.amordemascotas.Encuentros
import com.amordemascotas.HistoricosEncuentros
import com.amordemascotas.Imagenes
import com.amordemascotas.Mascota
import com.amordemascotas.Notificaciones
import com.amordemascotas.NotificacionesChats
import com.amordemascotas.Raza
import com.amordemascotas.User
import grails.plugin.springsecurity.annotation.Secured

class EncuentroController {

    def estadisticasMascotaService;
    def springSecurityService;

    @Secured('isAuthenticated()')
    def finalizar() {
        Encuentros encuentro = Encuentros.findById(params.encuentroId.toLong());
        Encuentros encuentroFind = Encuentros.findByMascotaOwnerAndMascotaFind(encuentro.mascotaFind, encuentro.mascotaOwner);

        encuentro.status = 'finished'
        encuentro.save flush:true, failOnError:true

        encuentroFind.status = 'finished'
        encuentroFind.save flush:true, failOnError:true

        HistoricosEncuentros historicosEncuentros = new HistoricosEncuentros()
        historicosEncuentros.userOwner = encuentro.userOwner
        historicosEncuentros.userFind = encuentro.userFind
        historicosEncuentros.mascotaOwner = encuentro.mascotaOwner
        historicosEncuentros.mascotaFind = encuentro.mascotaFind
        historicosEncuentros.save flush:true, failOnError:true
    }

    @Secured('isAuthenticated()')
    def obtenerHistoricos(){
        User user = springSecurityService.getCurrentUser();
        int offsetHistorico = 0;
        if(params.offset){
            offsetHistorico = Integer.parseInt(params.offsetHistorico);
        }
        List<HistoricosEncuentros> historicosEncuentrosList = HistoricosEncuentros.findAllByUserOwnerOrUserFind(user,user, [max:5, offset:offsetHistorico, sort: 'id', order:'DESC'])
        [historicosEncuentros:historicosEncuentrosList, historicosEncuentrosCount: HistoricosEncuentros.findAllByUserOwnerOrUserFind(user,user).size()]
    }

    @Secured('isAuthenticated()')
    def cargarHistoricos() {
        Encuentros encuentro = Encuentros.findById(params.encuentroId.toLong())
        HistoricosEncuentros historicosEncuentros = new HistoricosEncuentros()
        historicosEncuentros.mascotaOwner = encuentro.mascotaOwner
        historicosEncuentros.mascotaFind = encuentro.mascotaFind
        historicosEncuentros.userOwner = encuentro.userOwner
        historicosEncuentros.userFind = encuentro.userFind

        historicosEncuentros.save flush:true, failOnError:true
    }

    @Secured('isAuthenticated()')
    def chat() {
        println params
        Encuentros encuentro = Encuentros.findById(params.encuentro.toLong())
        if(params.chat){
            NotificacionesChats notificacionesChats = NotificacionesChats.findById(params.chat.toLong());
            notificacionesChats.contador = 0;
            notificacionesChats.save flush:true, failOnError:true
        }
        return render(view: "_chat", model:[encuentro:encuentro])
    }

    @Secured('isAuthenticated()')
    def encuentroIndex() {
        User user = springSecurityService.getCurrentUser();

        List<Encuentros> encuentrosList= Encuentros.findAllByUserOwnerAndStatus(user,'matched');
        int offset = 0;
        if(params.offset){
            offset = Integer.parseInt(params.offset);
        }
        List<Mascota> mascotas = Mascota.findAllByUser(user,[max:5, offset:offset, sort: 'id', order:'DESC']);
        return [encuentros:encuentrosList, mascotas: mascotas, mascotasCount: Mascota.findAllByUser(user).size()]
    }

    @Secured('isAuthenticated()')
    def encuentroMatchedIndex() {
        int offset = 0;
        if(params.offset){
            offset = Integer.parseInt(params.offset);
        }
        User user = springSecurityService.getCurrentUser();
        Notificaciones notificaciones = Notificaciones.findByUser(user);
        if(notificaciones) {
            notificaciones.contador = 0;
            notificaciones.save flush:true, failOnError:true
        }
        List<Encuentros> encuentrosList = Encuentros.findAllByUserOwnerAndStatus(user,'matched',[max:5, offset:offset, sort: 'id', order:'DESC']);

        List encuentrosAndChats = new ArrayList()
        List<NotificacionesChats> listChats = new ArrayList<>();
        encuentrosList.forEach { encuentro ->
            Map chatYencuentro = new HashMap();
            chatYencuentro.encuentro = encuentro
            chatYencuentro.chat = NotificacionesChats.findByEncuentro(encuentro)
            encuentrosAndChats.add(chatYencuentro)
        }

        if(encuentrosList.isEmpty()){
            return redirect(actionName: "encuentroIndex")
        }


        return [encuentros:encuentrosAndChats, encuentrosCount: Encuentros.findAllByUserOwnerAndStatus(user,'matched').size()]
    }

    @Secured('isAuthenticated()')
    def encuentroBusqueda() {
        User userOwner = springSecurityService.getCurrentUser();
        Mascota mascotaOwner = Mascota.findByIdAndUser(params.mascotaId.toLong(), userOwner);
        List<Imagenes> imagenesOwnerList = Imagenes.findAllByMascota(mascotaOwner);

        return [mascotaOwner: mascotaOwner, imagenesOwner: imagenesOwnerList]
    }

    @Secured('isAuthenticated()')
    def encuentroBusquedaAjax() {
        boolean resultMatched = false;
        Encuentros encuentroReciente = null
        if(params.encuentroNotLike) {
            try{
                encuentroReciente = Encuentros.findById(params.encuentroNotLike.toLong());
                encuentroReciente.status = "not_like";
                encuentroReciente.save flush:true, failOnError:true
                estadisticasMascotaService.notLike(encuentroReciente)
                println "Encuentro actulizado a not_like: "+encuentroReciente.id
            } catch (Exception e) {
                println "ALGO SALIO MAL :(. "+e
            }
        }

        if(params.encuentroLike) {
            try{
                encuentroReciente = Encuentros.findById(params.encuentroLike.toLong());
                encuentroReciente.status = "like";
                encuentroReciente.save flush:true, failOnError:true
                Mascota mascotaOwner = encuentroReciente.getMascotaOwner()
                Mascota mascotaFind = encuentroReciente.getMascotaFind()
                resultMatched = existeMatch(mascotaOwner, mascotaFind, encuentroReciente);
                if(!resultMatched) {
                    println "Encuentro actulizado a like: "+encuentroReciente.id
                }
                estadisticasMascotaService.like(encuentroReciente)
            } catch (Exception e) {
                println "ALGO SALIO MAL :(. "+e
            }

        }
        Map owner = obtenerOwner(params.mascotaId.toLong());
        String sexoFind = obtenerSexoFind(owner.mascota.sexo);
        Raza razaProximo = owner.mascota.raza;

        List<Encuentros> encuentrosOwnerList = obtenerListaByStatus(owner.user, owner.mascota)
        println "Cantidad de Encuentros ya realizados para la mascota seleccionada: "+encuentrosOwnerList.size()
        List<Encuentros> encuentrosOwnerInitial = obtenerListaByStatus(owner.user, owner.mascota, false, 'initial');
        println "Cantidad de Encuentros initial: "+encuentrosOwnerInitial.size();
        List<Encuentros> encuentrosOwnerNotLike = obtenerListaByStatus(owner.user, owner.mascota, false, 'not_like');
        println "Cantidad de Encuentros not_like: "+encuentrosOwnerNotLike.size();
        List<Encuentros> encuentrosOwnerLike = obtenerListaByStatus(owner.user, owner.mascota, false, 'like');
        println "Cantidad de Encuentros like: "+encuentrosOwnerLike.size();
        List<Encuentros> encuentrosOwnerMatched = obtenerListaByStatus(owner.user, owner.mascota, false, 'matched');
        println "Cantidad de Encuentros matched: "+encuentrosOwnerMatched.size();
        List<Encuentros> encuentrosOwnerFinished = obtenerListaByStatus(owner.user, owner.mascota, false, 'finished');
        println "Cantidad de Encuentros finished: "+encuentrosOwnerFinished.size();
        List<Long> mascotaIdNotIncluid = new ArrayList<>();
        mascotaIdNotIncluid.addAll(encuentrosOwnerInitial.mascotaFind.id)
        mascotaIdNotIncluid.addAll(encuentrosOwnerNotLike.mascotaFind.id)
        mascotaIdNotIncluid.addAll(encuentrosOwnerLike.mascotaFind.id)
        mascotaIdNotIncluid.addAll(encuentrosOwnerMatched.mascotaFind.id)
        mascotaIdNotIncluid.addAll(encuentrosOwnerFinished.mascotaFind.id)
        List<Mascota> mascotaFindList = new ArrayList<>()
        if(mascotaIdNotIncluid.size() != 0) {
            mascotaFindList = Mascota.findAllByRazaAndSexoAndUserNotEqualAndIdNotInList(razaProximo, sexoFind, owner.user, mascotaIdNotIncluid, [sort: 'id', order: 'DESC'])
        } else {
            mascotaFindList = Mascota.findAllByRazaAndSexoAndUserNotEqual(razaProximo, sexoFind, owner.user, [sort: 'id', order: 'DESC'])
        }

        println "Cantidad de Mascotas que nunca tuvieron un Encuentro: "+mascotaFindList.size();
        Mascota mascotaFind = null;
        Mascota mascotaFindRepit= null;

        if(mascotaFindList) {
            mascotaFind = mascotaFindList.get(new Random().nextInt(mascotaFindList.size()))
        }

        if(!mascotaFind) {

            mascotaFindRepit = getMascotaFindRepit(razaProximo, sexoFind, owner, encuentrosOwnerInitial, encuentrosOwnerFinished)
        }

        if(mascotaFind) {
            List<Imagenes> imagenesFindList = Imagenes.findAllByMascota(mascotaFind)
            Encuentros encuentrosNew = new Encuentros(mascotaFind: mascotaFind, mascotaOwner: owner.mascota, status: 'initial', userFind: mascotaFind.user, userOwner: owner.user)
            encuentrosNew.save flush:true, failOnError:true
            estadisticasMascotaService.initial(encuentrosNew)
            println "- No existe el encuentro, vamos a crearlo: "+encuentrosNew.id
            return render(view: "_encuentrosFind", model:[encuentrosReciente: encuentrosNew, mascotaOwner: owner.mascota, imagenesOwner: owner.imagenes, mascotaFind: mascotaFind, imagenesFind: imagenesFindList, isMatched: resultMatched])
        }

        if(mascotaFindRepit) {
            List<Imagenes> imagenesFindRepitList = Imagenes.findAllByMascota(mascotaFindRepit)
            Encuentros encuentrosExiste = Encuentros.findByMascotaFindAndMascotaOwnerAndUserFindAndUserOwner(mascotaFindRepit, owner.mascota, mascotaFindRepit.user, owner.user)
            if(encuentrosExiste.status == "initial") {
                println "- El encuentro ya existe, por lo que no hace falta crearlo: "+encuentrosExiste.id

                return render(view: "_encuentrosFind", model:[encuentrosReciente: encuentrosExiste, mascotaOwner: owner.mascota, imagenesOwner: owner.imagenes, mascotaFind: mascotaFindRepit, imagenesFind: imagenesFindRepitList, isMatched: resultMatched])
            }

            if(encuentrosExiste.status == "not_like" || encuentrosExiste.status == "finished") {
                encuentrosExiste.status = "initial"
                encuentrosExiste.save flush:true, failOnError:true
                estadisticasMascotaService.initial(encuentrosExiste)
                println "Actulizamos el encuentro que ya existia a initial: "+encuentrosExiste.id

                return render(view: "_encuentrosFind", model:[encuentrosReciente: encuentrosExiste, mascotaOwner: owner.mascota, imagenesOwner: owner.imagenes, mascotaFind: mascotaFindRepit, imagenesFind: imagenesFindRepitList, isMatched: resultMatched])
            }

        }
        return render(view: "_encuentrosFind", model:[encuentrosTotal: encuentrosOwnerList, mascotaOwner: owner.mascota, imagenesOwner: owner.imagenes, encuentrosReciente: [id:"null"], isMatched: resultMatched])
    }

    private Map obtenerOwner(Long mascotaId){
        Map result = new HashMap();
        User userOwner = springSecurityService.getCurrentUser();
        Mascota mascotaOwner = Mascota.findByIdAndUser(mascotaId, userOwner);
        List<Imagenes> imagenesOwnerList = Imagenes.findAllByMascota(mascotaOwner);

        result.put("user", userOwner);
        result.put("mascota", mascotaOwner);
        result.put("imagenes", imagenesOwnerList);

        return result;
    }

    private String obtenerSexoFind(String owner) {
        String result = "";
        if(owner == "macho") {
            result = "hembra"
        } else {
            result = "macho"
        }

        return result;
    }

    private List<Encuentros> obtenerListaByStatus(User ownerUser, Mascota ownerMascota, Boolean dateCalculate = false, String status = null) {
        List<Encuentros> result = null;
        Date dateOld = new Date()-300;
        Date now = new Date();
        Date dateNotLike = new Date()-2;
        Date dateFinished = new Date()-15;
        if(status == null){
            result = Encuentros.findAllByUserOwnerAndMascotaOwner(ownerUser, ownerMascota);
            return result;
        }

        if(status == "not_like" && dateCalculate) {
            result = Encuentros.findAllByUserOwnerAndMascotaOwnerAndStatusAndFechaModificacionBetween(ownerUser, ownerMascota, status, dateOld, dateNotLike);
            return result;
        }

        if(status == "finished" && dateCalculate) {
            result = Encuentros.findAllByUserOwnerAndMascotaOwnerAndStatusAndFechaModificacionBetween(ownerUser, ownerMascota, status, dateOld, dateFinished);
            return result;
        }

        result = Encuentros.findAllByUserOwnerAndMascotaOwnerAndStatus(ownerUser, ownerMascota, status);
        return result;
    }


    private Mascota getMascotaFindRepit(Raza razaProximo, String sexoFind, Map owner, List<Encuentros> encuentrosOwnerInitial, List<Encuentros> encuentrosOwnerFinished) {
        Mascota result = null;
        List<Mascota> mascotaFindInitialList = new ArrayList<>();
        if(!encuentrosOwnerInitial.isEmpty()) {
            mascotaFindInitialList = Mascota.findAllByRazaAndSexoAndUserNotEqualAndIdInList(razaProximo, sexoFind, owner.user, encuentrosOwnerInitial.mascotaFind.id, [sort: 'id', order: 'DESC'])
            println "Como todavia no se encontraron mascotas, vamos a mostrar nuevamente los initial: "+mascotaFindInitialList.size();
        }
        if(!mascotaFindInitialList.isEmpty()) {
            result = mascotaFindInitialList.get(new Random().nextInt(mascotaFindInitialList.size()))
        } else {
            List<Mascota> mascotaFindNotLikeList = obtenerListaByStatus(owner.user, owner.mascota, true, 'not_like')
            println "Como todavia no se encontraron mascotas, vamos a mostrar nuevamente los not_like: "+mascotaFindNotLikeList.size();

            if(!mascotaFindNotLikeList.isEmpty()) {
                result = mascotaFindNotLikeList.get(new Random().nextInt(mascotaFindNotLikeList.size()))
            } else {
                List<Mascota> mascotaFindFinishedList = new ArrayList<>();
                if(!encuentrosOwnerFinished.isEmpty()) {
                    mascotaFindFinishedList = Mascota.findAllByRazaAndSexoAndUserNotEqualAndIdInList(razaProximo, sexoFind, owner.user, encuentrosOwnerFinished.mascotaFind.id, [sort: 'id', order: 'DESC'])
                    println "Como todavia no se encontraron mascotas, vamos a mostrar nuevamente los finished: "+mascotaFindFinishedList.size();
                }

                if(!mascotaFindFinishedList.isEmpty()) {
                    result = mascotaFindFinishedList.get(new Random().nextInt(mascotaFindFinishedList.size()))
                }
            }
            println "No quedan mas mascotas por buscar... Prueba suerte a la brevedad."
        }

        return result;
    }

    private boolean existeMatch(Mascota mascotaOwner, Mascota mascotaFind, Encuentros encuentroReciente) {
        Encuentros encuentrosMatchedFind = Encuentros.findByMascotaOwnerAndMascotaFindAndStatus(mascotaFind, mascotaOwner, "like")
        if(encuentrosMatchedFind != null) {
            encuentrosMatchedFind.status = 'matched'
            encuentrosMatchedFind.save flush:true, failOnError:true

            encuentroReciente.status = 'matched'
            encuentroReciente.save flush:true, failOnError:true
            estadisticasMascotaService.matched(encuentroReciente)

            Notificaciones notificacionesOwner = Notificaciones.findByUser(mascotaOwner.user);
            if(notificacionesOwner){
                println "El Usuario Owner Ya tuvo alguna vez notificaciones, por lo que vamos a sumar el contador."
                notificacionesOwner.contador = notificacionesOwner.contador +1
                notificacionesOwner.save flush:true, failOnError:true
            } else {
                println "El Usuario owner nunca tuvo notificaciones, vamos a iniciar el contador en 1."
                notificacionesOwner = new Notificaciones()
                notificacionesOwner.user = mascotaOwner.user
                notificacionesOwner.contador = 1
                notificacionesOwner.save flush:true, failOnError:true
            }

            Notificaciones notificacionesFind = Notificaciones.findByUser(mascotaFind.user);
            if(notificacionesFind){
                println "El Usuario Find Ya tuvo alguna vez notificaciones, por lo que vamos a sumar el contador."
                notificacionesFind.contador = notificacionesFind.contador +1
                notificacionesFind.save flush:true, failOnError:true
            } else {
                println "El Usuario Find nunca tuvo notificaciones, vamos a iniciar el contador en 1."
                notificacionesFind = new Notificaciones()
                notificacionesFind.user = mascotaFind.user
                notificacionesFind.contador = 1
                notificacionesFind.save flush:true, failOnError:true
            }

            println "Matched exitoso! "+mascotaOwner.nombre+" - "+mascotaFind.nombre
            return true;
        } else {
            println "No se encontro matched aun! "+mascotaOwner.nombre+" - "+mascotaFind.nombre
        }

        return false;
    }
}

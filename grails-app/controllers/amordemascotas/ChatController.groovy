package amordemascotas

import com.amordemascotas.ChatMessage
import com.amordemascotas.Encuentros
import com.amordemascotas.NotificacionesChats
import com.amordemascotas.User
import grails.plugin.springsecurity.annotation.Secured

class ChatController {

    def springSecurityService


    @Secured('isAuthenticated()')
    def retrieveLatestMessages() {
        User user = springSecurityService.getCurrentUser()
        Encuentros encuentro = Encuentros.findById(params.encuentro.toLong())
        Encuentros encuentroFind = Encuentros.findByMascotaOwnerAndMascotaFindAndStatus(encuentro.mascotaFind, encuentro.mascotaOwner, "matched")
        def messages = ChatMessage.findAllByEncuentroInList([encuentro, encuentroFind] , [order: 'desc', max:15, sort: 'id']);
        [messages:messages.reverse()]

    }

    @Secured('isAuthenticated()')
    def submitMessage() {
        try {
            User user = springSecurityService.getCurrentUser()

            Encuentros encuentro = Encuentros.findById(params.encuentro.toLong());
            ChatMessage chatMessage = new ChatMessage();
            chatMessage.user = user;
            chatMessage.encuentro =  encuentro
            chatMessage.message = params.message;
            chatMessage.nickname = user.name;
            chatMessage.save flush:true, failOnError:true


            Encuentros encuentroFind = Encuentros.findByMascotaFindAndMascotaOwnerAndStatus(encuentro.mascotaOwner, encuentro.mascotaFind, 'matched')
            NotificacionesChats notificacionesChats = NotificacionesChats.findByEncuentro(encuentroFind)
            if(notificacionesChats) {
                notificacionesChats.contador = notificacionesChats.contador+1
                notificacionesChats.save flush:true, failOnError:true
            } else {
                notificacionesChats = new NotificacionesChats()
                notificacionesChats.encuentro = encuentroFind
                notificacionesChats.contador = 1
                notificacionesChats.save flush:true, failOnError:true

            }

            return render (view: "_script")
        } catch(Exception e) {
            throw e;
        }

    }

    def index() {

    }
}

package amordemascotas

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/mascota/registrar"(controller: "mascota", action: "registrarMascota")
        "/"(controller: "conocerPlus", action: "conocerPlus")
        "/index"(controller: "conocerPlus", action: "index")
        "/registration"(view:"/user/registerUserIndex")
        "/conocer-plus"(controller: "conocerPlus", action: "conocerPlus")
        "/login"(view:"/login/auth")
        "/encuentro/chat"(controller: "administrator", action: "chat")
        "/encuentro/chat/historicos"(controller: "administrator", action: "chatHistoricos")
        "/encuentro/chat/enviar-mensaje"(controller: "chat", action: "submitMessage")
        "/encuentro/chat/obtener-mensaje"(controller: "chat", action: "retrieveLatestMessages")
        "/encuentro/chat/obtener-mensaje-historicos"(controller: "chat", action: "retrieveLatestMessagesFinished")
        "/encuentro/finalizar"(controller: "encuentro", action: "finalizar")
        "/encuentro/historicos"(controller: "encuentro", action: "obtenerHistoricos")
        "/recovery-password"(view:"/user/recoveryPassword")
        "/home"(controller: "administrator", action: "index")
        "/recovery-password-token/$username/$token" (controller: "user", action: "recuperarToken")
        "/encuentro/index"(controller: "encuentro", action: "encuentroIndex")
        "/encuentro/concretados"(controller: "encuentro", action: "encuentroMatchedIndex")
        "/encuentro/busqueda/$mascotaId"(controller: "encuentro", action: "encuentroBusqueda")
        "/estadisticas/mascotas"(controller: "estadisticasMascota", action: "estadisticasIndex")
        "/estadisticas/admin/mascotas"(controller: "estadisticasMascota", action: "estadisticasAdminMascotas")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

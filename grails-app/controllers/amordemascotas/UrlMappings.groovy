package amordemascotas

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "conocerPlus", action: "conocerPlus")
        "/registration"(view:"/user/registerUserIndex")
        "/conocer-plus"(controller: "conocerPlus", action: "conocerPlus")
        "/login"(view:"/login/auth")
        "/recovery-password"(view:"/user/recoveryPassword")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

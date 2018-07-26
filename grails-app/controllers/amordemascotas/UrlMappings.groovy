package amordemascotas

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/user/registerUserIndex")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

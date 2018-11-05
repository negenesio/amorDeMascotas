package amordemascotas

import com.amordemascotas.EstadisticasMascota
import com.amordemascotas.Imagenes
import com.amordemascotas.Mascota
import com.amordemascotas.Raza
import com.amordemascotas.Role
import com.amordemascotas.User
import com.amordemascotas.UserRole

class BootStrap {

    def springSecurityService
    def grailsResourceLocator

    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def user1 = new User('user1', 'user1', "user 1", "user.1@gmail.com", Date.parse("yyyy-MM-dd", "1989-07-15"), 'masculino').save()
        def user2 = new User('user2', 'user2', "user 2", "user.2@gmail.com", Date.parse("yyyy-MM-dd", "1989-07-15"), 'masculino').save()
        def user3 = new User('user3', 'user3', "user 3", "user.3@gmail.com", Date.parse("yyyy-MM-dd", "1989-07-15"), 'masculino').save()
        def adminUser = new User('admin', 'admin', 'admin administrator', "admin@amordemascotas.com", Date.parse("yyyy-MM-dd", "1970-07-15"), 'masculino').save()
        UserRole.create user1, userRole
        UserRole.create user2, userRole
        UserRole.create user3, userRole
        UserRole.create adminUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        def razas = ["Mestizo", "Affenpinscher", "Airedale Terrier", "Akita","Akita americano","Alaskan Husky","Alaskan Malamute",
                     "American Foxhound", "American pit bull terrier", "American staffordshire terrier", "Ariegeois",
                     "Artois", "Australian silky terrier", "Australian terrier", "Austrian Black & Tan Hound",
                     "Azawakh", "Balkan Hound", "Basenji", "Basset Alpino", "Basset Artesiano Normando",
                     "Basset Azul de Gascuña", "Basset de Artois", "Basset de Westphalie", "Basset Hound",
                     "Basset Leonado de Bretaña", "Bavarian Mountain Scenthound", "Beagle", "Beagle Harrier",
                     "Beauceron", "Bedlington Terrier", "Bichon Boloñes", "Bichón Frisé", "Bichón Habanero", "Billy",
                     "Black and Tan Coonhound", "Bloodhound","Bobtail", "Boerboel", "Border Collie", "Border Terrier",
                     "Borzoi", "Bosnian Hound", "Boston terrier", "Bouvier des Flandres", "Boxer",
                     "Boyero de Appenzell", "Boyero de Australia","Boyero de Entlebuch", "Boyero de Montaña Bernes",
                     "Braco Alemán de pelo corto", "Braco Alemán de pelo duro", "Braco de Ariege", "Braco de Auvernia",
                     "Braco de Bourbonnais", "Braco de Saint Germain", "Braco Dupuy", "Braco Francés", "Braco Italiano",
                     "Broholmer", "Buhund Noruego", "Bull terrier", "Bulldog", "Bulldog americano", "Bulldog Francés",
                     "Bullmastiff", "Ca de Bestiar", "Cairn terrier", "Cane Corso",
                     "Cane da Pastore Maremmano-Abruzzese", "Caniche", "Caniche Toy","Cao da Serra de Estrela",
                     "Cao de Castro Laboreiro", "Cao de Fila de Sao Miguel", "Cao de Serra de Aires",
                     "Cardigan Welsh Corgi", "Cavalier King Charles Spaniel", "Cesky Fousek", "Ceský teriér",
                     "Chesapeake Bay Retriever", "Chihuahua", "Chin", "Chow Chow", "Cirneco del Etna",
                     "Clumber Spaniel", "Cocker Spaniel Americano", "Cocker Spaniel Inglés", "Collie Barbudo",
                     "Collie de Pelo Corto","Collie de Pelo Largo","Cotón de Tuléar", "Curly Coated Retriever",
                     "Dálmata", "Dandie dinmont terrier", "Deerhound", "Dobermann","Dogo Argentino","Dogo de Burdeos",
                     "Dogo del Tibet","Drentse Partridge Dog","Drever","Dunker","Elkhound Noruego","Elkhound Sueco",
                     "English Foxhound","English Springer Spaniel","English toy terrier","Epagneul Picard","Eurasier",
                     "Fila Brasileiro", "Finnish Lapphound", "Flat Coated Retriever", "Fox terrier de pelo de alambre",
                     "Fox terrier de pelo liso","Foxhound Inglés","Frisian Pointer","Galgo Español","Galgo húngaro",
                     "Galgo Italiano","Galgo Polaco","Glen of Imaal Terrier", "Golden Retriever", "Gordon Setter",
                     "Gos d'Atura Catalá","Gran Basset Griffon Vendeano","Gran Boyero Suizo","Gran Danés",
                     "Gran Gascón Saintongeois","Gran Griffon Vendeano","Gran Munsterlander","Gran Perro Japonés",
                     "Grand Anglo Francais Tricoleur","Grand Bleu de Gascogne","Greyhound","Griffon Bleu de Gascogne",
                     "Griffon de pelo duro","Griffon leonado de Bretaña","Griffon Nivernais","Grifon Belga",
                     "Grifón de Bruselas","Haldenstoever","Harrier","Hokkaido","Hovawart","Husky Siberiano",
                     "Ioujnorousskaia Ovtcharka","Irish Glen of Imaal terrier","Irish soft coated wheaten terrier",
                     "Irish terrier","Irish Water Spaniel","Irish Wolfhound","Jack Russell terrier","Jindo Coreano",
                     "Kai","Keeshond","Kelpie Australiano Australian Kelpie)","Kerry blue terrier",
                     "King Charles Spaniel","Kishu","Komondor", "Kooiker","Kromfohrländer","Kuvasz",
                     "Labrador Retriever","Lagotto Romagnolo","Laika de Siberia Occidental","Laika de Siberia Oriental",
                     "Laika Ruso Europeo","Lakeland terrier","Landseer","Lapphund Sueco","Lebrel Afgano","Lebrel Arabe",
                     "Leonberger","Lhasa Apso","Lowchen","Lundehund Noruego","Malamute de Alaska","Maltés",
                     "Manchester terrier","Mastiff","Mastín de los Pirineos","Mastín Español","Mastín Napolitano",
                     "Mudi","Norfolk terrier","Norwich terrier","Nova Scotia duck tolling retriever","Ovejero alemán",
                     "Otterhound","Papillón","Parson Russell terrier","Pastor Alemán","Pastor Australiano",
                     "Pastor Belga","Pastor Belga Groenendael","Pastor Belga Laekenois","Pastor Belga Malinois",
                     "Pastor Belga Tervueren","Pastor Bergamasco","Pastor Blanco Suizo","Pastor Croata",
                     "Pastor de Anatolia","Pastor de Asia Central","Pastor de Brie","Pastor de Istria",
                     "Pastor de Laponia","Pastor de los Pirineos","Pastor de Shetland","Pastor del Atlas",
                     "Pastor del Cáucaso","Pastor Holandés","Pastor Islandés","Pastor Picard","Pastor Vasco","Pekinés",
                     "Pembroke Welsh Corgi","Pequeño Munsterlander","Perdiguero de Burgos","Perdiguero Portugués",
                     "Perro Crestado Chino","Perro de Agua Americano","Perro de Agua Español","Perro de Agua Francés",
                     "Perro de Agua Frisón", "Perro de Agua Portugués", "Perro de Canaan","Perro de Groenlandia",
                     "Perro de los Visigodos","Perro de Montaña de los Pirineos","Perro de Osos de Carelia",
                     "Perro de Presa Español","Perro de Presa Mallorquín","Perro del Faraón","Perro Esquimal Americano",
                     "Perro Esquimal Canadiense","Perro Lobo Checoslovaco","Perro sin pelo de Perú",
                     "Petit Basset Griffon Vendeen","Petit Blue de Gascogne","Petit Brabancon","Pinscher",
                     "Pinscher austríaco de pelo corto","Pinscher Miniatura","Pit bull terrier americano",
                     "Podenco Andaluz","Podenco Canario","Podenco Ibicenco","Podenco Portugués","Pointer","Poitevin",
                     "Polish Lowland Sheepdog","Polish Tatra Mountain Dog","Pomerania","Porcelana","Presa Canario",
                     "Pug","Puli","Pumi","Rafeiro do Alentejo","Ratonero Bodeguero Andaluz",
                     "Retriever de Nueva Escocia","Rhodesian Ridgeback","Ridgeback de Tailandia", "Rottweiler",
                     "Saarloos Wolfdog","Sabueso de Hamilton", "Sabueso de Hannover","Sabueso de Hygen",
                     "Sabueso de Istria","Sabueso de Posavaz","Sabueso de Schiller","Sabueso de Smaland",
                     "Sabueso de Transilvania","Sabueso del Tirol","Sabueso Español","Sabueso Estirio de pelo duro",
                     "Sabueso Finlandés","Sabueso Francés blanco y negro","Sabueso Francés tricolor","Sabueso Griego",
                     "Sabueso Polaco","Sabueso Serbio","Sabueso Suizo","Sabueso Yugoslavo de Montaña",
                     "Sabueso Yugoslavo tricolor","Saluki","Samoyedo","San Bernardo","Sarplaninac","Schapendoes",
                     "Schipperke","Schnauzer estándar","Schnauzer gigante","Schnauzer miniatura","Scottish terrier",
                     "Sealyham terrier","Segugio Italiano","Seppala Siberiano","Setter Inglés","Setter Irlandés",
                     "Setter Irlandés rojo y blanco","Shar Pei","Shiba Inu","Shih Tzu","Shikoku","Skye terrier",
                     "Slovensky Cuvac", "Slovensky Kopov","Smoushond Holandés", "Spaniel Alemán",
                     "Spaniel Azul de Picardía","Spaniel Bretón","Spaniel de Campo","Spaniel de Pont Audemer",
                     "Spaniel Francés","Spaniel Tibetano","Spinone Italiano","Spítz Alemán","Spitz de Norbotten",
                     "Spitz Finlandés","Spitz Japonés","Staffordshire bull terrier","Staffordshire terrier americano",
                     "Sussex Spaniel","Teckel","Terranova","Terrier australiano","Terrier brasilero","Terrier cazador alemán",
                     "Terrier checo","Terrier galés","Terrier irlandés","Terrier japonés","Terrier negro ruso",
                     "Terrier tibetano","Tosa","Viejo Pastor Inglés","Viejo Pointer Danés","Vizsla","Volpino Italiano",
                     "Weimaraner","Welsh springer spaniel","Welsh terrier","West highland white terrier","Whippet",
                     "Wirehaired solvakian pointer","Xoloitzcuintle","Yorkshire terrier"]
        razas.each {
            new Raza(descripcion: it).save(failOnError: true)
        }

        Mascota mascota1 = new Mascota(nombre: "kero", fechaNacimiento: Date.parse("YYYY", "2010"), user: user1, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Kero es un macho alpha")
        mascota1.save(failOnError: true)
        Mascota mascota2 = new Mascota(nombre: "pepa", fechaNacimiento: Date.parse("YYYY", "2011"), user: user1, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Pepa es muy adorable")
        mascota2.save(failOnError: true)

        Mascota mascota3 = new Mascota(nombre: "Thor", fechaNacimiento: Date.parse("YYYY", "2005"), user: user2, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Thor es muy adorable")
        mascota3.save(failOnError: true)
        Mascota mascota4 = new Mascota(nombre: "Negrito", fechaNacimiento: Date.parse("YYYY", "2005"), user: user2, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Negrito es muy adorable")
        mascota4.save(failOnError: true)
        Mascota mascota5 = new Mascota(nombre: "Roco", fechaNacimiento: Date.parse("YYYY", "2002"), user: user2, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Roco es muy adorable")
        mascota5.save(failOnError: true)

        Mascota mascota6 = new Mascota(nombre: "Emma", fechaNacimiento: Date.parse("YYYY", "2005"), user: user2, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Emma es muy adorable")
        mascota6.save(failOnError: true)
        Mascota mascota7 = new Mascota(nombre: "Bebe", fechaNacimiento: Date.parse("YYYY", "2005"), user: user2, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Bebe es muy adorable")
        mascota7.save(failOnError: true)
        Mascota mascota8 = new Mascota(nombre: "Barbie", fechaNacimiento: Date.parse("YYYY", "2002"), user: user2, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Barbie es muy adorable")
        mascota8.save(failOnError: true)

        Mascota mascota9 = new Mascota(nombre: "Balbo", fechaNacimiento: Date.parse("YYYY", "2014"), user: user3, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "balbo es muy adorable")
        mascota9.save(failOnError: true)
        Mascota mascota10 = new Mascota(nombre: "Mini", fechaNacimiento: Date.parse("YYYY", "2005"), user: user3, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Mini es muy adorable")
        mascota10.save(failOnError: true)

        Mascota mascota11 = new Mascota(nombre: "Peque", fechaNacimiento: Date.parse("YYYY", "2005"), user: adminUser, sexo: 'macho', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Peque es muy adorable")
        mascota11.save(failOnError: true)
        Mascota mascota12 = new Mascota(nombre: "Catia", fechaNacimiento: Date.parse("YYYY", "2014"), user: adminUser, sexo: 'hembra', raza: Raza.findByDescripcion("Schnauzer miniatura"), descripcion: "Catia es muy adorable")
        mascota12.save(failOnError: true)

        createImageValidParams(mascota1, grailsResourceLocator.findResourceForURI('schnauzermini01.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini02.jpg').file.bytes);
        createImageValidParams(mascota2, grailsResourceLocator.findResourceForURI('schnauzermini03.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini04.jpg').file.bytes);
        createImageValidParams(mascota3, grailsResourceLocator.findResourceForURI('schnauzermini05.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini06.jpg').file.bytes);
        createImageValidParams(mascota6, grailsResourceLocator.findResourceForURI('schnauzermini07.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini08.jpg').file.bytes);
        createImageValidParams(mascota7, grailsResourceLocator.findResourceForURI('schnauzermini09.jpg').file.bytes,grailsResourceLocator.findResourceForURI('schnauzermini10.jpg').file.bytes);
        createImageValidParams(mascota8, grailsResourceLocator.findResourceForURI('schnauzermini11.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini12.jpg').file.bytes);
        createImageValidParams(mascota4, grailsResourceLocator.findResourceForURI('schnauzermini13.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini14.jpg').file.bytes);
        createImageValidParams(mascota5, grailsResourceLocator.findResourceForURI('schnauzermini15.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini16.jpg').file.bytes);
        createImageValidParams(mascota9, grailsResourceLocator.findResourceForURI('schnauzermini17.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini18.jpg').file.bytes);
        createImageValidParams(mascota10, grailsResourceLocator.findResourceForURI('schnauzermini19.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini20.jpg').file.bytes);
        createImageValidParams(mascota11, grailsResourceLocator.findResourceForURI('schnauzermini21.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini03.jpg').file.bytes);
        createImageValidParams(mascota12, grailsResourceLocator.findResourceForURI('schnauzermini01.jpg').file.bytes, grailsResourceLocator.findResourceForURI('schnauzermini02.jpg').file.bytes);

        new EstadisticasMascota(mascota: mascota1, user: user1).save()
        new EstadisticasMascota(mascota: mascota2, user: user1).save()
        new EstadisticasMascota(mascota: mascota3, user: user2).save()
        new EstadisticasMascota(mascota: mascota4, user: user2).save()
        new EstadisticasMascota(mascota: mascota5, user: user2).save()
        new EstadisticasMascota(mascota: mascota6, user: user2).save()
        new EstadisticasMascota(mascota: mascota7, user: user2).save()
        new EstadisticasMascota(mascota: mascota8, user: user2).save()
        new EstadisticasMascota(mascota: mascota9, user: user3).save()
        new EstadisticasMascota(mascota: mascota10, user: user3).save()
        new EstadisticasMascota(mascota: mascota11, user: adminUser).save()
        new EstadisticasMascota(mascota: mascota12, user: adminUser).save()

        assert User.count() == 4
        assert Role.count() == 2
        assert UserRole.count() == 4
        assert Mascota.count() == 12
        assert Imagenes.count() == 24
        assert Raza.count() == 349
    }
    def destroy = {
    }

    def createImageValid(Mascota mascota) {
        List<Imagenes> imagenesList = [new Imagenes(nombre: "images1", imagen: grailsResourceLocator.findResourceForURI('imagen1.png').file.bytes), new Imagenes(nombre: "images2", imagen: grailsResourceLocator.findResourceForURI('imagen2.png').file.bytes)]
        imagenesList.each {
            it.type = "image/png"
            it.mascota = mascota
            it.save(failOnError: true)
        }
    }

    def createImageValidParams(Mascota mascota, byte[] imagen1,  byte[] imagen2) {
        List<Imagenes> imagenesList = [new Imagenes(nombre: "images1", imagen: imagen1), new Imagenes(nombre: "images2", imagen: imagen2)]
        imagenesList.each {
            it.type = "image/jpg"
            it.mascota = mascota
            it.save(failOnError: true)
        }
    }

    def createImageValidAndDefault(Mascota mascota) {
        List<Imagenes> imagenesList = [new Imagenes(nombre: "images1", imagen: grailsResourceLocator.findResourceForURI('imagen1.png').file.bytes), new Imagenes(nombre: "default", imagen: grailsResourceLocator.findResourceForURI('default.png').file.bytes)]
        imagenesList.each {
            it.type = "image/png"
            it.mascota = mascota
            it.save(failOnError: true)
        }
    }
}

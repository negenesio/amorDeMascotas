package amordemascotas

import com.amordemascotas.Encuentros
import com.amordemascotas.EstadisticasMascota
import com.amordemascotas.Mascota
import com.amordemascotas.User
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
class EstadisticasMascotaService {

    @Secured('permitAll')
    def void createEstadisticas(Mascota mascota, User user) {
        EstadisticasMascota estadisticas = new EstadisticasMascota()
        estadisticas.user = user
        estadisticas.mascota = mascota
        estadisticas.save  flush:true, failOnError:true

        println "Las estadisticasMascota se inicializaron en 0 correctamente"
    }

    @Secured('permitAll')
    def notLike(Encuentros encuentros) {
        EstadisticasMascota owner = EstadisticasMascota.findByMascota(encuentros.mascotaOwner)
        EstadisticasMascota find = EstadisticasMascota.findByMascota(encuentros.mascotaFind)
        owner.notLikeCount = owner.notLikeCount+1
        find.findNotLikeCount = find.findNotLikeCount+1

        owner.save flush:true, failOnError:true
        find.save flush:true, failOnError:true
    }

    @Secured('permitAll')
    def like(Encuentros encuentros) {
        EstadisticasMascota owner = EstadisticasMascota.findByMascota(encuentros.mascotaOwner)
        EstadisticasMascota find = EstadisticasMascota.findByMascota(encuentros.mascotaFind)
        owner.likeCount = owner.likeCount+1
        find.findLikeCount = find.findLikeCount+1

        owner.save flush:true, failOnError:true
        find.save flush:true, failOnError:true
    }

    @Secured('permitAll')
    def initial(Encuentros encuentros) {
        EstadisticasMascota owner = EstadisticasMascota.findByMascota(encuentros.mascotaOwner)
        EstadisticasMascota find = EstadisticasMascota.findByMascota(encuentros.mascotaFind)
        owner.initialCount = owner.initialCount+1
        find.findInitialCount = find.findInitialCount+1

        owner.save flush:true, failOnError:true
        find.save flush:true, failOnError:true
    }

    @Secured('permitAll')
    def matched(Encuentros encuentros) {
        EstadisticasMascota owner = EstadisticasMascota.findByMascota(encuentros.mascotaOwner)
        EstadisticasMascota find = EstadisticasMascota.findByMascota(encuentros.mascotaFind)
        owner.matchedCount = owner.matchedCount+1
        find.matchedCount = find.matchedCount+1

        owner.save flush:true, failOnError:true
        find.save flush:true, failOnError:true
    }
}

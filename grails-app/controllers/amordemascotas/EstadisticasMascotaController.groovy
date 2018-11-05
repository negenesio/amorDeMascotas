package amordemascotas

import com.amordemascotas.EstadisticasMascota
import com.amordemascotas.User
import grails.plugin.springsecurity.annotation.Secured

class EstadisticasMascotaController {

    def springSecurityService;

    @Secured('isAuthenticated()')
    def estadisticasIndex() {
        User user = springSecurityService.getCurrentUser();
        List<EstadisticasMascota> estadisticasMascota = EstadisticasMascota.findAllByUser(user);

        [estadisticas:estadisticasMascota]
    }

}

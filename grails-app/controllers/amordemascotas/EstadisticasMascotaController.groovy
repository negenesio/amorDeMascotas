package amordemascotas

import com.amordemascotas.EstadisticasMascota
import com.amordemascotas.Mascota
import com.amordemascotas.User
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class EstadisticasMascotaController {

    def springSecurityService;

    @Secured('isAuthenticated()')
    def estadisticasAdminMascotas() {
        List<EstadisticasMascota> estadisticasMascota = EstadisticasMascota.findAll()
        List graficosAcumulados = new ArrayList();
        Map graficoMascotaRaza = graficoAcumuladoPorRazaBuild(estadisticasMascota);
        Map graficoMascotaPorSexo = graficoAcumuladoPorSexoBuild(estadisticasMascota);
        Map graficoFindAndNotFindTotal = graficoFindAndNotFindTotalBuild(estadisticasMascota);
        Map graficoAcumuladoMascotaEncuentrosTotal = graficoAcumuladoMascotaEncuentrosBuild(estadisticasMascota);

        if (graficoMascotaRaza.data.sum() != 0) {
            graficosAcumulados.add(graficoMascotaRaza)
        }
        if (graficoMascotaPorSexo.data.sum() != 0) {
            graficosAcumulados.add(graficoMascotaPorSexo)
        }

        if (graficoFindAndNotFindTotal.data.sum() != 0) {
            graficosAcumulados.add(graficoFindAndNotFindTotal)
        }

        List graficoEncuentrosFechaData = graficoAcumuladoFechaMesEncuentrosDataBuild();

        return [graficoEncuentrosTotal: graficoAcumuladoMascotaEncuentrosTotal, graficosAcumulados: graficosAcumulados, estadisticas: estadisticasMascota, graficoEncuentrosFechaMesData: graficoEncuentrosFechaData];
    }

    @Secured('isAuthenticated()')
    def estadisticasIndex() {
        User user = springSecurityService.getCurrentUser();
        List<EstadisticasMascota> estadisticasMascota = EstadisticasMascota.findAllByUser(user);

        List graficos = new ArrayList();
        estadisticasMascota.forEach { estadistica ->
            List graficoPorMascotas = graficoPorMascota(estadistica.mascota, estadistica.user);
            if(graficoPorMascotas) {
                graficos.add(graficoPorMascotas);
            }
        }

        Map graficoMascotaRaza = graficoAcumuladoPorRazaBuild(estadisticasMascota);
        Map graficoLikeAndNotLikeTotal = graficoAcumuladoLikeAndNotLikeBuild(estadisticasMascota);
        Map graficoFindLikeAndFindNotLikeTotal = graficoAcumuladoFindLikeAndFindNotLikeBuild(estadisticasMascota);
        Map graficoAcumuladoMascotaEncuentros = graficoAcumuladoMascotaEncuentrosBuild(estadisticasMascota);

        List graficosAcumulados = new ArrayList();
        if (graficoLikeAndNotLikeTotal.data.sum() != 0) {
            graficosAcumulados.add(graficoLikeAndNotLikeTotal)
        }

        if (graficoFindLikeAndFindNotLikeTotal.data.sum() != 0) {
            graficosAcumulados.add(graficoFindLikeAndFindNotLikeTotal)
        }

        if (graficoMascotaRaza.data.sum() != 0) {
            graficosAcumulados.add(graficoMascotaRaza);
        }

        if (graficoAcumuladoMascotaEncuentros.data.sum() != 0) {
            graficosAcumulados.add(graficoAcumuladoMascotaEncuentros);
        }


        [estadisticas: estadisticasMascota, graficos: graficos, graficosAcumulados: graficosAcumulados]
    }

    private List graficoAcumuladoFechaMesEncuentrosDataBuild() {
        int year = new Date()[Calendar.YEAR]
        List<EstadisticasMascota> estadisticasMascotaEnero = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 01, 1])
        List<EstadisticasMascota> estadisticasMascotaFebrero = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 02, 1])
        List<EstadisticasMascota> estadisticasMascotaMarzo = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 03, 1])
        List<EstadisticasMascota> estadisticasMascotaAbril = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 04, 1])
        List<EstadisticasMascota> estadisticasMascotaMayo = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 05, 1])
        List<EstadisticasMascota> estadisticasMascotaJunio = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 06, 1])
        List<EstadisticasMascota> estadisticasMascotaJulio = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 07, 1])
        List<EstadisticasMascota> estadisticasMascotaAgosto = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 8, 1])
        List<EstadisticasMascota> estadisticasMascotaSeptiembre = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 9, 1])
        List<EstadisticasMascota> estadisticasMascotaOctubre = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 10, 1])
        List<EstadisticasMascota> estadisticasMascotaNoviembre = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 11, 1])
        List<EstadisticasMascota> estadisticasMascotaDiciembre = EstadisticasMascota.findAll("from EstadisticasMascota as e where year(e.creacion) = ? and month(e.creacion) = ? and e.matchedCount >= ?", [year, 12, 1])

        return [estadisticasMascotaEnero.size(),
         estadisticasMascotaFebrero.size(),
         estadisticasMascotaMarzo.size(),
         estadisticasMascotaAbril.size(),
         estadisticasMascotaMayo.size(),
         estadisticasMascotaJunio.size(),
         estadisticasMascotaJulio.size(),
         estadisticasMascotaAgosto.size(),
         estadisticasMascotaSeptiembre.size(),
         estadisticasMascotaOctubre.size(),
         estadisticasMascotaNoviembre.size(),
         estadisticasMascotaDiciembre.size()
        ]
    }

    private Map graficoAcumuladoMascotaEncuentrosBuild(List<EstadisticasMascota> estadisticasMascota) {
        List data = new ArrayList();
        List label = new ArrayList();
        estadisticasMascota = estadisticasMascota.sort { a, b -> b.matchedCount <=> a.matchedCount }
        estadisticasMascota.forEach { estadistica ->
            if(estadistica.matchedCount != 0) {
                data.add(estadistica.matchedCount);
                label.add(estadistica.mascota.nombre);
            }
        }

        def labelAux = label as JSON;
        return ["nombre": "Encuentros_Concretados_por_Mascotas", "data": data, "label": labelAux]
    }

    private Map graficoAcumuladoPorRazaBuild(List<EstadisticasMascota> estadisticasMascota) {
        List graficoLabelMascotaRaza = estadisticasMascota.mascota.raza.descripcion.toList().unique();
        List dataMascotaRaza = new ArrayList();
        Map dataGraficoRazas = new HashMap()
        graficoLabelMascotaRaza.forEach { raza ->
            estadisticasMascota.forEach { estadistica ->
                if (estadistica.mascota.raza.descripcion == raza) {
                    if (dataGraficoRazas.get(raza)) {
                        int aux = dataGraficoRazas.get(raza)
                        dataGraficoRazas.put(raza, aux + 1);
                    } else {
                        dataGraficoRazas.put(raza, 1);
                    }
                }
            }
            dataMascotaRaza.add(dataGraficoRazas.get(raza))
        }

        def graficoLabelMascotaRazaAux = graficoLabelMascotaRaza as JSON;

        return ["nombre": "Mascotas_Cargadas_Por_Raza", "data": dataMascotaRaza, "label": graficoLabelMascotaRazaAux];
    }

    private Map graficoFindAndNotFindTotalBuild(List<EstadisticasMascota> estadisticasMascota) {
        return ["nombre":"Total_Envios_y_Recibidos",
                "label": labelTotalFindAndNotFindBuild(),
                "data": [estadisticasMascota.findLikeCount.sum()+estadisticasMascota.likeCount.sum(), estadisticasMascota.findNotLikeCount.sum()+estadisticasMascota.notLikeCount.sum()]];
    }

    private Map graficoAcumuladoPorSexoBuild(List<EstadisticasMascota> estadisticasMascota) {
        List graficoLabelMascotaSexo = estadisticasMascota.mascota.sexo.toList().unique();
        List dataMascotaSexo = new ArrayList();
        Map dataGraficoSexo = new HashMap()
        graficoLabelMascotaSexo.forEach { sexo ->
            estadisticasMascota.forEach { estadistica ->
                if (estadistica.mascota.sexo == sexo) {
                    if (dataGraficoSexo.get(sexo)) {
                        int aux = dataGraficoSexo.get(sexo)
                        dataGraficoSexo.put(sexo, aux + 1);
                    } else {
                        dataGraficoSexo.put(sexo, 1);
                    }
                }
            }
            dataMascotaSexo.add(dataGraficoSexo.get(sexo))
        }

        def graficoLabelMascotaSexoAux = graficoLabelMascotaSexo as JSON;

        return ["nombre": "Mascotas_Cargadas_Por_Sexo", "data": dataMascotaSexo, "label": graficoLabelMascotaSexoAux];
    }

    private Map graficoAcumuladoLikeAndNotLikeBuild(List<EstadisticasMascota> estadisticasMascota) {
        return ["nombre": "Total_Envios_Realizados",
                "label": labelTotalEnviadosBuild(),
                "data": [estadisticasMascota.likeCount.sum(), estadisticasMascota.notLikeCount.sum()]]
    }

    private Map graficoAcumuladoFindLikeAndFindNotLikeBuild(List<EstadisticasMascota> estadisticasMascota) {
        return ["nombre":"Total_Envios_Recibidos",
                "label": labelTotalRecibidosBuild(),
                "data": [estadisticasMascota.findLikeCount.sum(), estadisticasMascota.findNotLikeCount.sum()]];
    }

    private JSON labelTotalEnviadosBuild() {
        return ["Total Me Gusta Enviados", "Total No Me Gusta Enviados"] as JSON;
    }

    private JSON labelTotalFindAndNotFindBuild() {
        return ["Total Me Gusta", "Total No Me Gusta"] as JSON;
    }


    private JSON labelTotalRecibidosBuild() {
        return ["Total Me Gusta Recibidos", "Total No Me Gusta Recibidos"] as JSON;
    }

    private JSON labelEnviadosBuild() {
        return ["Me Gusta Enviados", "No Me Gusta Enviados"] as JSON;
    }

    private JSON labelRecibidosBuild() {
        return ["Me Gusta Recibidos", "No Me Gusta Recibidos"] as JSON;
    }

    private Map graficoEnviadosBuild(EstadisticasMascota estadisticasMascota) {
        return ["label": labelEnviadosBuild(),
                "data": [estadisticasMascota.likeCount, estadisticasMascota.notLikeCount],
                "nombre":estadisticasMascota.mascota.nombre + "_Envios_Realizados",
                "mascota":estadisticasMascota.mascota.nombre]
    }

    private Map graficoRecibidosBuild(EstadisticasMascota estadisticasMascota) {
        return ["label": labelRecibidosBuild(),
                "data": [estadisticasMascota.findLikeCount, estadisticasMascota.findNotLikeCount],
                "nombre":estadisticasMascota.mascota.nombre + "_Envios_Recibidos",
                "mascota":estadisticasMascota.mascota.nombre]
    }


    private List graficoPorMascota(Mascota mascota, User user) {
        List<EstadisticasMascota> estadisticas = EstadisticasMascota.findAllByUserAndMascota(user, mascota);

        List graficos = new ArrayList();
        estadisticas.forEach { estadistica ->

            Map graficoEnviados = graficoEnviadosBuild(estadistica);
            Map graficoRecibidos = graficoRecibidosBuild(estadistica);

            if (graficoEnviados.data.sum() != 0) {
                graficos.add(graficoEnviados);
            }

            if (graficoRecibidos.data.sum() != 0) {
                graficos.add(graficoRecibidos);
            }
        }

        return graficos;
    }


}

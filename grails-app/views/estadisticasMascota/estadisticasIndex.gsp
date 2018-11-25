<%@ page import="com.amordemascotas.User" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="bootstrap_confirm.js"/>
    <asset:javascript src="Chart.js"/>
    <asset:javascript src="chartjs-plugin-datalabels.js"/>

    <style>
    a.step.nextLink.prevLink{
        color: black !important;
    }
    .step {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .nextLink {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .prevLink {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .currentStep {
        padding: 10px;
        background-color: #b3b3b3;
        color: white;
        border: 1px solid black;
    }

    .step.gap {
        display: none;
    }

    .step:hover:not(.active) {
        background-color: #ddd;
    }
    .col-center {
        margin: 0 auto;
        float: none !important;
    }

    div.hero {
        background: url('/assets/encuentro001.jpg');
        background-size: cover;
        width: 600px;
        height: 300px;
    }

    .table td th {
        text-align: center;
    }

    .cancel{
        color:white;
    }

    .confirm{
        color:white;
    }
    th {
        font-size: 15px;
        border-bottom-width: 2px;
        padding-bottom: 12px;
        padding-right: 5px;
        padding-left: 5px;
        padding-top: 5px;
        width: auto;
    }

    td {
        text-align: center;
    }

    #chart {
        height: 400px;
        width: 400px;
    }
    canvas {
        background-color: rgba(47, 152, 208, 0.1);

    }
    .divContenedor:hover {
        background: #9dc1d336;
    }
    </style>
</head>
<body>

<div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: auto;display: block; justify-content: center; align-items: center">
    <center>
        <div class="hero text-block-label" style="margin-top:5px">
            <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
                <p>¡Aqui tienes las estadisticas de cada una de tus mascotas!</p>
                <p>Para ver una mascota detallada, presiona sobre: <i class="fas fa-chart-pie fa-2x"></i></p>
            </label>
        </div>
    </center>
    <div id="div_con_mascota" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: auto;display: block; justify-content: center; align-items: center;height: auto;">
        <table class="table table-striped">
            <thead>
            <tr>
                <th><i class="fa fa-paw fa-2x"></i></th>
                <th>Nombre Mascotas</th>
                <th>Me Gusta</th>
                <th>No Me Gusta</th>
                <th>Encuentros Concretados</th>
                <th>Me Gusta Recibidos</th>
                <th>No Me Gusta Recibidos</th>
                <th>Estadisticas</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${estadisticas}" var="estadistica" status="counterTest">
                <tr>
                    <td scope="row"></td>
                    <td>${estadistica.mascota.nombre}</td>
                    <td>${estadistica.likeCount}</td>
                    <td>${estadistica.notLikeCount}</td>
                    <td>${estadistica.matchedCount}</td>
                    <td>${estadistica.findLikeCount}</td>
                    <td>${estadistica.findNotLikeCount}</td>
                    <td><i id="icon-${counterTest}" class="fas fa-chart-pie" style="color:red" onclick="activeDesactive(id);showMePie('divContenedor${counterTest}');"></i></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

<g:if test="${graficos}">
    <g:each in="${graficos}" var="graficoMascotasDiferencial" status="counter1">
        <div id="divContenedor${counter1}" class="divContenedor">
            <center>
                <h3>Graficos de ${graficoMascotasDiferencial.nombre.first().split("_")[0]}</h3>
                <ul class="inline" style="width: 100%;">
                    <g:each in="${graficoMascotasDiferencial}" var="graficoMascotas">
                        <li class="inline" style="width: 35%;">
                            <canvas class="canvasGraficos" id="${graficoMascotas.nombre}"></canvas>
                            <input type="hidden" id="jsonLabel${graficoMascotas.nombre}" data-json="${graficoMascotas.label}"/>
                            <script>
                                var ctx${graficoMascotas.nombre} = $("#${graficoMascotas.nombre}");
                                Chart.defaults.global.defaultFontFamily = "Lato";
                                Chart.defaults.global.defaultFontSize = 18;
                                // Global Options:
                                var label${graficoMascotas.nombre} = $("#jsonLabel${graficoMascotas.nombre}").attr("data-json");
                                var data${graficoMascotas.nombre} = {
                                    labels: jQuery.parseJSON(label${graficoMascotas.nombre}),
                                    datasets: [
                                        {
                                            fill: true,
                                            backgroundColor: [
                                                "#"+((1<<24)*Math.random()|0).toString(16),
                                                "#"+((1<<24)*Math.random()|0).toString(16)
                                            ],
                                            data: [${graficoMascotas.data.join(",")}],
                                            // Notice the borderColor
                                            borderColor: "white",
                                            borderWidth: [2,2]
                                        }
                                    ]
                                };

                                var options${graficoMascotas.nombre} = {
                                    title: {
                                        display: true,
                                        text: '${graficoMascotas.nombre.replace("_", " ")}',
                                        position: 'top'
                                    },
                                    rotation: -0.7 * Math.PI,
                                    legend: {
                                        display: true,
                                        position: "left",
                                        labels: {
                                            fontSize: 15,
                                        }
                                    },
                                    plugins: {
                                        datalabels: {
                                            formatter: (value, ctx) => {
                                            let datasets = ctx.chart.data.datasets;
                                if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
                                    let sum = datasets[0].data.reduce((a, b) => a + b, 0);
                                    let percentage = Math.round((value / sum) * 100) + '%';
                                    return percentage;
                                } else {
                                    return percentage;
                                }
                                },
                                color: '#fff',
                                }
                                }
                                };

                                var myBarChart${graficoMascotas.nombre} = new Chart(ctx${graficoMascotas.nombre}, {
                                    type: 'pie',
                                    data: data${graficoMascotas.nombre},
                                    options: options${graficoMascotas.nombre}
                                });
                            </script>
                        </li>
                    </g:each>
                <hr id="hr${counter1}" class="canvasGraficos">
                </ul>
            </center>
        </div>
    </g:each>
</g:if>
<hr>

<center>
    <h3>Graficos Estadisticos Generales <i id="icon-${counterTest}" class="fas fa-chart-pie" style="color:green" onclick="activeDesactive(id); showPieAcumulado('divContenedorAcumulado')"></i></h3>
</center>
<div id="divContenedorAcumulado" class="divContenedorAcumulado" style="display: block">
    <center>
        <ul class="inline" style="width: 100%;">
            <g:each in="${graficosAcumulados}" var="graficoAcumulado" status="counterAcumulado">
                <li class="inline" style="width: 35%;">
                    <canvas id="${graficoAcumulado.nombre}"></canvas>
                    <input type="hidden" id="jsonLabel${graficoAcumulado.nombre}" data-json="${graficoAcumulado.label}"/>
                    <script>
                        var ctx${counterAcumulado} = $("#${graficoAcumulado.nombre}");
                        Chart.defaults.global.defaultFontFamily = "Lato";
                        Chart.defaults.global.defaultFontSize = 18;
                        Chart.defaults.global.plugins.datalabels.anchor = 'center';
                        Chart.defaults.global.plugins.datalabels.align = 'center';
                        Chart.defaults.global.plugins.datalabels.color = 'black';
                        // Global Options:
                        var label${counterAcumulado} = $("#jsonLabel${graficoAcumulado.nombre}").attr("data-json");
                        var data${counterAcumulado} = {
                            labels: jQuery.parseJSON(label${counterAcumulado}),
                            datasets: [
                                {
                                    fill: true,
                                    backgroundColor: [
                                        "#"+((1<<24)*Math.random()|0).toString(16),
                                        "#"+((1<<24)*Math.random()|0).toString(16)],
                                    data: [${graficoAcumulado.data.join(",")}],
                                    // Notice the borderColor
                                    borderColor: 'white',
                                    borderWidth: [2,2]
                                }
                            ]
                        };

                        var options${counterAcumulado} = {
                            title: {
                                display: true,
                                text: '${graficoAcumulado.nombre.replace("_", " ")}',
                                position: 'top',
                                fontSize: 15
                            },
                            rotation: -0.7 * Math.PI,
                            legend: {
                                display: true,
                                position: "left",
                                labels: {
                                    fontSize: 15,
                                }
                            },
                            plugins: {
                                datalabels: {
                                    formatter: (value, ctx) => {
                                    let datasets = ctx.chart.data.datasets;
                        if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
                            let sum = datasets[0].data.reduce((a, b) => a + b, 0);
                            let percentage = Math.round((value / sum) * 100) + '%';
                            return percentage;
                        } else {
                            return percentage;
                        }
                        },
                        color: '#fff',
                        }
                        }
                        };

                        var myBarChart${counterAcumulado} = new Chart(ctx${counterAcumulado}, {
                            type: 'pie',
                            data: data${counterAcumulado},
                            options: options${counterAcumulado},

                        });
                    </script>
                </li>
            </g:each>
            <hr>
        </ul>
    </center>
</div>

<script>

    function activeDesactive(id) {
        if($("#"+id).css( "color").toString() == "rgb(255, 0, 0)") {
            $("#"+id).css( "color", "rgb(0, 128, 0)" );
            return
        }

        if($("#"+id).css( "color").toString() == "rgb(0, 128, 0)") {
            $("#"+id).css( "color", "rgb(255, 0, 0)" );
            return
        }
    }
    function hideAllCanvas() {
        $( ".divContenedor" ).each(function( index ) {
            $(this).hide();
        });
    }

    function showPieAcumulado(nombre) {
        if($( "#"+nombre ).css("display") == "block") {
            $("#"+nombre).hide();
        } else {
            $("#"+nombre).show();
            document.querySelector('#'+nombre).scrollIntoView();
        }
    }
    function showMePie(nombre) {
        if($( "#"+nombre ).css("display") == "block") {
            $("#"+nombre).hide();
        } else {
            $("#"+nombre).show();
            document.querySelector('#'+nombre).scrollIntoView();
        }
    }
    hideAllCanvas();

</script>
</body>
</html>
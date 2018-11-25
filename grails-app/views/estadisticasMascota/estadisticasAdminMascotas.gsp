<%@ page import="com.amordemascotas.User; com.amordemascotas.Mascota" %>
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

    th {
        font-size: 12px;
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
                <p>¡Aqui tienes las estadisticas generales de todas las Mascotas!</p>
            </label>
        </div>
    </center>
</div>
<div id="div_con_mascota" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: auto;display: block; justify-content: center; align-items: center;height: auto;">
    <table class="table table-striped">
        <thead>
        <tr>
            <th><i class="fa fa-paw fa-2x"></i></th>
            <th>Total de Me Gusta</th>
            <th>Total no Me Gusta</th>
            <th>Total Encuentros</th>
            <th>Total de Mascotas Creadas</th>
            <th>Total Usuarios Creados</th>
            <th>Total de Busquedas Realizadas</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td scope="row"></td>
                <td>${estadisticas.findLikeCount.sum()}</td>
                <td>${estadisticas.findNotLikeCount.sum()}</td>
                <td>${estadisticas.matchedCount.sum()}</td>
                <td>${Mascota.findAll().size()}</td>
                <td>${User.findAll().size()}</td>
                <td>${estadisticas.findLikeCount.sum()+estadisticas.findNotLikeCount.sum()}</td>
            </tr>
        </tbody>
    </table>
</div>
<center><div>
    <ul class="inline" style="width: 100%;">
        <li class="inline" style="width: 35%;">
            <canvas id="myChart" width="500" height="400"></canvas>
        </li>
        <li class="inline" style="width: 35%;">
            <canvas id="myChartTest" width="500" height="400"></canvas>
        </li>
    </ul>
</div></center>
<br>
<input type="hidden" id="graficoEncuentrosTotalData" data-json="${graficoEncuentrosTotal.data}" label-json="${graficoEncuentrosTotal.label}">
<div id="divContenedorAcumulado" class="divContenedorAcumulado" style="display: block">
    <center>
        <ul class="inline" style="width: 100%;">
            <g:each in="${graficosAcumulados}" var="graficoAcumulado" status="counterAcumulado">
                <li class="inline" style="width: 35%;">
                    <canvas id="${graficoAcumulado.nombre}"></canvas>
                    <input type="hidden" id="jsonLabel${graficoAcumulado.nombre}" data-json="${graficoAcumulado.label}"/>
                    <script>
                        /**/
                        var ctx${counterAcumulado} = $("#${graficoAcumulado.nombre}");
                        Chart.defaults.global.defaultFontFamily = "Lato";
                        Chart.defaults.global.defaultFontSize = 18;
                        Chart.defaults.global.plugins.datalabels.anchor = 'center';
                        Chart.defaults.global.plugins.datalabels.align = 'center';
                        Chart.defaults.global.plugins.datalabels.color = 'black';
                        // Global Options:
                        var label${counterAcumulado} = $("#jsonLabel${graficoAcumulado.nombre}").attr("data-json");
                        var labelColor = [];
                        for (var i = 0; i < jQuery.parseJSON(label${counterAcumulado}).length; i++) {
                            labelColor.push("#"+((1<<24)*Math.random()|0).toString(16));
                        }

                        var data${counterAcumulado} = {
                            labels: jQuery.parseJSON(label${counterAcumulado}),
                            datasets: [
                                {
                                    fill: true,
                                    backgroundColor: labelColor,
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

<center><div style="width:50%;">
    <canvas id="canvasLine"></canvas>
</div></center>

<script>

    /*TEST*/
    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(231,233,237)'
    };

    var line1 = ${graficoEncuentrosFechaMesData};
    var MONTHS = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    var config = {
        type: 'line',
        data: {
            labels: MONTHS,
            datasets: [{
                label: "Encuentros por Meses",
                backgroundColor: window.chartColors.red,
                borderColor: window.chartColors.red,
                data: line1,
                fill: true
            }]
        },
        options: {
            responsive: true,
            title:{
                display:true,
                text:'Cantidad de Encuentros 2018'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Meses'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Cantidades'
                    },
                }]
            }
        }
    };

    var ctxLine = document.getElementById("canvasLine").getContext("2d");
    var myLine = new Chart(ctxLine, config);

    /*TEST*/
    var ctxBar = document.getElementById("myChart");
    var myChart = new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: ["Me Gustan", "No Me Gustan", "Encuentros", "Mascotas", "Usuarios", "Busquedas"],
            datasets: [{
                label: '# Totales',
                data: [${estadisticas.findLikeCount.sum()},
        ${estadisticas.findNotLikeCount.sum()},
        ${estadisticas.matchedCount.sum()},
        ${Mascota.findAll().size()},
        ${User.findAll().size()},
        ${estadisticas.findLikeCount.sum()+estadisticas.findNotLikeCount.sum()}],
        // Notice the borderColor
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: false,
            scales: {
                xAxes: [{
                    ticks: {
                        maxRotation: 90,
                        minRotation: 60,
                        fontSize: 12
                    },
                }],
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    },
                }]
            }
        }
    });

</script>
<g:if test="${graficoEncuentrosTotal}">
<script>
    /*TEST*/
    var labelgraficoEncuentrosTotal = $("#graficoEncuentrosTotalData").attr("label-json");
    var datagraficoEncuentrosTotal = $("#graficoEncuentrosTotalData").attr("data-json");
    var ctxBarTest = document.getElementById("myChartTest");
    var myChartTest = new Chart(ctxBarTest, {
        type: 'bar',
        data: {
            labels:  jQuery.parseJSON(labelgraficoEncuentrosTotal),
            datasets: [{
                label: '# Cantidad de Encuentros',
                data: jQuery.parseJSON(datagraficoEncuentrosTotal),
                // Notice the borderColor
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: false,
            scales: {
                xAxes: [{
                    ticks: {
                        maxRotation: 90,
                        minRotation: 60,
                        fontSize: 12,
                        min: 1, // Chang
                    },
                }],
                yAxes: [{
                    ticks: {
                        min: 0, // Chang
                        beginAtZero: true
                    },
                }]
            }
        }
    });
</script>
</g:if>
</body>
</html>
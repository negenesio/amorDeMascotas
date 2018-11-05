<%@ page import="com.amordemascotas.User" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="bootstrap_confirm.js"/>
    <asset:javascript src="Chart.js"/>

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

    #chart {
        height: 400px;
        width: 400px;
    }
    </style>
</head>
<body>

<div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: auto;display: block; justify-content: center; align-items: center">
    <center>
        <div class="hero text-block-label" style="margin-top:5px">
            <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
                    <p>¡Aqui tienes las estadisticas de cada una de tus mascotas!</p>
            </label>
        </div>
    </center>
    <div id="div_con_mascota" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: auto;display: block; justify-content: center; align-items: center;height: 415px;">
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
            </tr>
            </thead>
            <tbody>
            <g:each in="${estadisticas}" var="estadistica" status="counter">
                <tr>
                    <td scope="row"></td>
                    <td>${estadistica.mascota.nombre}</td>
                    <td>${estadistica.likeCount}</td>
                    <td>${estadistica.notLikeCount}</td>
                    <td>${estadistica.matchedCount}</td>
                    <td>${estadistica.findLikeCount}</td>
                    <td>${estadistica.findNotLikeCount}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</div>
</div>
<!--
THe post that goes with this pen:
https://codepen.io/k3no/post/learning-by-example-getting-started-with-chart-js
-->
<div class="container">
    <br />
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <!--       Chart.js Canvas Tag -->
            <canvas id="mascotasCreadas"></canvas>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

<div class="container">
    <br />
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <!--       Chart.js Canvas Tag -->
            <canvas id="barChart"></canvas>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

<script>
    var ctxMascotasCreadas = $("#mascotasCreadas");
    var mascotasCreadas = new Chart(ctxMascotasCreadas, {
        type: 'line',
        data: {
            labels: [new Date("2015-3-15 13:3").toLocaleString(), new Date("2015-3-25 13:2").toLocaleString(), new Date("2015-4-25 14:12").toLocaleString()],
            datasets: [{
                label: 'Demo',
                data: [{
                    t: new Date("2015-3-15 13:3"),
                    y: 12
                },
                    {
                        t: new Date("2015-3-25 13:2"),
                        y: 21
                    },
                    {
                        t: new Date("2015-4-25 14:12"),
                        y: 32
                    }
                ],
                backgroundColor: [
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
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        }
    });

    var ctx = $("#barChart");
    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 18;
    // Global Options:
    var data = {
        labels: ["Me Gusta", "No Me Gusta", "Encuentros Concretados", "Me Gusta Recibidos", "No Me Gusta Recibidos"],
        datasets: [
            {
                fill: true,
                backgroundColor: [
                    'green',
                    'red',
                    'black',
                    'orange',
                    'pink',
                    'blue',
                    'gray',
                    'white'],
                data: [${estadisticas.last().likeCount}, ${estadisticas.last().notLikeCount}, ${estadisticas.last().matchedCount}, ${estadisticas.last().matchedCount}, ${estadisticas.last().findLikeCount}, ${estadisticas.last().findNotLikeCount}],
// Notice the borderColor
                borderColor:	['black', 'black'],
                borderWidth: [2,2]
            }
        ]
    };

    // Notice the rotation from the documentation.

    var options = {
        title: {
            display: true,
            text: 'Estadisticas para ${estadisticas.last().mascota.nombre}',
            position: 'top'
        },
        rotation: -0.7 * Math.PI,
    };


    // Chart declaration:
    var myBarChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options
    });

    // Fun Fact: I've lost exactly 3 of my favorite T-shirts and 2 hoodies this way :|

</script>
</body>
</html>


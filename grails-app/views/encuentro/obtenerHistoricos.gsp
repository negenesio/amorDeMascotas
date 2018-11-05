<%@ page import="com.amordemascotas.User" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="bootstrap_confirm.js"/>
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
    </style>
</head>
<body>

<div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center">
    <center>
        <div class="hero text-block-label" style="margin-top:5px">
            <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
            <g:if test="${historicosEncuentros.isEmpty()}">
                <p>¡Todavia no Tienes un ENCUENTRO Finalizado!</p>
            </g:if>
            <g:else>
                <p>¡Aqui puedes recordar, con quien estableciste contacto!</p>
            </g:else>
            </label>
        </div>
    </center>
        <div id="div_con_mascota" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center;height: 415px;">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th><i class="fa fa-paw fa-2x"></i></th>
                    <th>Nombre Mascotas</th>
                    <th>Fecha Finalizacion</th>
                    <th>Dueñ@</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${historicosEncuentros}" var="historicos" status="counter">
                        <tr>
                            <td scope="row"></td>
                            <td>${historicos.mascotaOwner.nombre} <i class="fas fa-heart" style="color: indianred"></i> ${historicos.mascotaFind.nombre} </td>
                            <td>${historicos.fechaCreacion.format("dd/mm/YYYY")}</td>
                            <g:set var="userCurrent" value="${User.findByUsername(sec.username())}"/>
                            <g:if test="${historicos.userOwner.username != userCurrent.username}">
                                <td>${historicos.userOwner.name}</td>
                            </g:if>
                            <g:else>
                                <td>${historicos.userFind.name}</td>
                            </g:else>
                        </tr>
                </g:each>
                </tbody>
            </table>
            <center><div class="paginateButtons" style="margin-top: 30px;">
                <g:paginate total="${historicosEncuentrosCount}" max="5"/>

            </div></center>
    </div>

</div>
</div>
</body>
</html>


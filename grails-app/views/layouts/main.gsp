<!doctype html>
<%@ page import="com.amordemascotas.HistoricosEncuentros; com.amordemascotas.NotificacionesChats; com.amordemascotas.Notificaciones; com.amordemascotas.Encuentros; com.amordemascotas.User" contentType="text/html;charset=UTF-8" %>

<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Amor de Mascotas"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="bootstrapvalidator.min.css"/>
    <asset:stylesheet src="bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker.css"/>
    <asset:stylesheet src="fontawesome-free-5.2.0-web/css/all.min.css"/>
    <asset:stylesheet src="bootstrap-selectpicker.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="notificationcircle.css"/>

    <asset:javascript src="jquery.js"/>
    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="moment.min.js"/>
    <asset:javascript src="bootstrapvalidator.min.js"/>
    <asset:javascript src="bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"/>
    <asset:javascript src="bootstrap-selectpicker.js"/>

    <g:layoutHead/>

    <style>
        b {
            font-size: 17px;
        }
    </style>

</head>
<body>

<g:set var="userCurrent" value="${User.findByUsername(sec.username())}"/>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 80px; align-items: baseline;font-size: 18px;">
       <a href="/conocer-plus" style="color: gray"><div>
            <i style="color:black" class="fa fa-paw fa-2x pull-left" aria-hidden="true"></i>
            <label style="font-size: 20px">Amor de</label>
           <label style="color: black; font-size: 25px"> Mascotas | </label></div></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

        <sec:ifLoggedIn>
            <ul class="navbar-nav mr-auto dots">
             <li class="nav-item ${request.getRequestURL().toString().contains('/home') ? 'active' : ''}">
                <a style="padding-left: 10px" class="nav-link" href="/home"><b>Principal</b></a>
            </li>
            <li class="nav-item ${request.getRequestURL().toString().contains('/mascota/registrar') ? 'active' : ''}">
                <a style="padding-left: 10px" class="nav-link" href="/mascota/registrar"><b>Crear Mascota</b></a>
            </li>
            <g:if test="${request.getRequestURL().toString().contains('/mascota/editarMascota')}">
                <li class="nav-item ${request.getRequestURL().toString().contains('/mascota/editarMascota') ? 'active' : ''}">
                    <a style="padding-left: 10px" class="nav-link" href="#"><b>Editar Mascota</b></a>
                </li>
            </g:if>

            <li class="nav-item ${request.getRequestURL().toString().contains('/encuentro/index') ? 'active' : ''}">
                <a style="padding-left: 10px" class="nav-link" href="/encuentro/index">
                    <b>Buscar Encuentros</b>
                </a>
            </li>
                <g:set var="contador" value="${Notificaciones.findByUser(userCurrent)?.contador}"/>
                <g:set var="listMatched" value="${Encuentros.findAllByUserOwnerAndStatus(userCurrent,'matched')}"/>
                <g:if test="${listMatched.size() != 0}">
                    <g:set var="contadorAux" value="${NotificacionesChats.findAllByEncuentroInList(listMatched).contador.sum()}"/>
                    <g:if test="${Encuentros.findAllByUserOwnerAndStatus(userCurrent,'matched')}">
                        <li class="nav-item ${request.getRequestURL().toString().contains('/encuentro/concretados') ? 'active' : ''}">
                            <a style="padding-left: 10px" class="nav-link" href="/encuentro/concretados">
                                <b>Encuentros</b>
                                <g:if test="${contador && contador != 0 && contadorAux && contadorAux != 0}">
                                    <span class="glyphicon glyphicon-envelope">
                                        <mark class="big swing">${contador}</mark>
                                    </span>
                                    <span class="glyphicon glyphicon-envelope">
                                        <mark class="big swing green">${contadorAux}</mark>
                                    </span>
                                </g:if>
                                <g:else>
                                    <g:if test="${contador && contador != 0}">
                                        <span class="glyphicon glyphicon-envelope">
                                            <mark class="big swing">${contador}</mark>
                                        </span>
                                    </g:if>
                                    <g:else>
                                        <g:if test="${contadorAux && contadorAux != 0}">
                                            <span class="glyphicon glyphicon-envelope">
                                                <mark class="big swing green">${contadorAux}</mark>
                                            </span>
                                        </g:if>
                                    </g:else>
                                </g:else>
                            </a>
                        </li>
                    </g:if>
                </g:if>
                <g:if test="${HistoricosEncuentros.findByUserOwnerOrUserFind(userCurrent, userCurrent)}">
                    <li class="nav-item ${request.getRequestURL().toString().contains('/encuentro/historicos') ? 'active' : ''}">
                        <a style="padding-left: 10px" class="nav-link" href="/encuentro/historicos">
                            <b>Historicos</b>
                        </a>
                    </li>
                </g:if>
                <sec:ifNotGranted roles='ROLE_ADMIN'>
                <li class="nav-item ${request.getRequestURL().toString().contains('/estadisticas/mascotas') ? 'active' : ''}">
                    <a style="padding-left: 10px" class="nav-link" href="/estadisticas/mascotas">
                        <b>Estadisticas</b>
                    </a>
                </li>
                </sec:ifNotGranted>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <li class="nav-item ${request.getRequestURL().toString().contains('/estadisticas/admin/mascotas') ? 'active' : ''}">
                        <a style="padding-left: 10px" class="nav-link" href="/estadisticas/admin/mascotas">
                            <font style="font-size: 15px;color: gold"><b>Admin Estadisticas</b></font>
                        </a>
                    </li>
                </sec:ifAnyGranted>
            </ul>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <div style="padding-right: 50px" class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                        <li class="nav-item ${request.getRequestURL().toString().contains('/registration') ? 'active' : ''}">
                            <a style="padding-left: 10px" class="nav-link " href="/registration"><b>Registrarse</b></a>
                        </li>
                        <li class="nav-item ${request.getRequestURL().toString().contains('/login') ? 'active' : ''}">
                            <a style="padding-left: 10px" class="nav-link" href="/login"><b>Iniciar Sesion</b></a>
                        </li>
                        <li class="nav-item ${request.getRequestURL().toString().contains('/recovery-password') ? 'active' : ''}">
                            <a style="padding-left: 10px" class="nav-link" href="/recovery-password"><b>Recuperar Contraseña</b></a>
                        </li>

                    <li class="nav-item ${request.getRequestURL().toString().contains('/conocer-plus') ? 'active' : ''} ${request.getRequestURL().toString().contains('/index') ? 'active' : ''} ">
                        <a style="padding-left: 10px" class="nav-link" href="/conocer-plus"><b>Conocer +</b>
                        </a>
                        </li>
                </ul>
            </div>
        </sec:ifNotLoggedIn>
    <g:if test="${request.getRequestURL().toString().contains('/login')}">

    </g:if>
    <g:else>
    <sec:ifNotLoggedIn>
            <form class="form-inline" action="/login/authenticate" method="POST">
                <div class="form-group" style="justify-content: flex-end;align-items: flex-end;">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Usuario/E-mail" style="margin-left: 5px; width: 25%">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" style="margin-left: 5px; width: 25%">
                    <input type="submit" class="btn btn-info" value="Iniciar Sesion" style="margin-left: 5px;">
                </div>
            </form>
    </sec:ifNotLoggedIn>
    </g:else>
        <sec:ifLoggedIn>
            <ul class="navbar-nav mr-auto">
            </ul>
            <p class="navbar-text navbar-right">Bienvenido: <sec:username/> | <a href="/logoff" class="navbar-link">Desconectarse</a></p>
        </sec:ifLoggedIn>
</nav>
<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message  default="Loading&hellip;"/>
</div>
</body>
</html>
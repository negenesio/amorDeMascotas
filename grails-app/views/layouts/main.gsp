<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="popper.min.js"/>
    <asset:stylesheet src="fontawesome-free-5.1.1-web/css/all.min.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="moment.min.js"/>
    <asset:javascript src="bootstrapvalidator.min.js"/>
    <asset:stylesheet src="bootstrapvalidator.min.css"/>

    <g:layoutHead/>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
       <a href="/conocer-plus" style="color: gray"><div>
            <i style="color:black" class="fa fa-paw fa-2x pull-left" aria-hidden="true"></i>
            <label style="font-size: 20px">Amor de</label>
           <label style="color: black; font-size: 25px"> Mascotas | </label></div></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <sec:ifNotLoggedIn>
            <div style="padding-right: 50px" class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                        <li class="nav-item ${request.getRequestURL().toString().equals('http://localhost:8080/registration') ? 'active' : ''}">
                            <a style="padding-left: 15px" class="nav-link " href="/registration">Registrarse<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item ${request.getRequestURL().toString().contains('http://localhost:8080/login') ? 'active' : ''}">
                            <a style="padding-left: 15px" class="nav-link" href="/login">Iniciar Sesion</a>
                        </li>
                        <li class="nav-item ${request.getRequestURL().toString().equals('http://localhost:8080/recovery-password') ? 'active' : ''}">
                            <a style="padding-left: 15px" class="nav-link" href="/recovery-password">Recuperar Contraseña</a>
                        </li>

                    <li class="nav-item ${request.getRequestURL().toString().equals('http://localhost:8080/conocer-plus') ? 'active' : ''} ${request.getRequestURL().toString().equals('http://localhost:8080/') ? 'active' : ''} ">
                        <a style="padding-left: 15px" class="nav-link" href="/conocer-plus">Conocer + <span class="sr-only">(current)</span></a>
                        </li>
                </ul>
            </div>
        </sec:ifNotLoggedIn>
    <g:if test="${request.getRequestURL().toString().contains('http://localhost:8080/login')}">

    </g:if>
    <g:else>
    <sec:ifNotLoggedIn>
        <g:if test="${request.getRequestURL().toString() != 'http://localhost:8080/conocer-plus' && request.getRequestURL().toString() != 'http://localhost:8080/'}">
            <form class="form-inline" action="/login/authenticate" method="POST">
                <div class="form-group" style="justify-content: flex-end;align-items: flex-end;">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Usuario/E-mail" style="margin-left: 5px; width: 25%">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" style="margin-left: 5px; width: 25%">
                    <input type="submit" class="btn btn-info" value="Iniciar Sesion" style="margin-left: 5px;">
                </div>
            </form>
        </g:if>
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
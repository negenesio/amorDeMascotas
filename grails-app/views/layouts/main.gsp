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
       <a href="#" style="color: gray"><div>
            <i style="color:black" class="fa fa-paw fa-2x pull-left" aria-hidden="true"></i>
            <label style="font-size: 20px">Amor de</label>
           <label style="color: black; font-size: 25px"> Mascotas | </label></div></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <div style="padding-right: 50px" class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a style="padding-left: 15px" class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
            <g:if test="${request.getRequestURL().toString().contains("/login/auth")}">
            </g:if>
            <g:else>
                <sec:ifNotLoggedIn>
                    <g:link controller='login' action='auth'>Iniciar Sesion</g:link>
                </sec:ifNotLoggedIn>
            </g:else>
            <sec:ifLoggedIn>
                <p class="navbar-text navbar-right">Bienvenido: <sec:username/> | <a href="/logoff" class="navbar-link">Desconectarse</a></p>
            </sec:ifLoggedIn>
        </div>
</nav>
<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

</body>
</html>
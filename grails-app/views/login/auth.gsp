<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <title>Welcome to Grails</title>
</head>
<body>

%{--<sec:ifNotLoggedIn>
    <g:link controller='login' action='auth'>Login</g:link>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <a href="/logoff">Logout</a>
</sec:ifLoggedIn>

<sec:ifAnyGranted roles='ROLE_ADMIN'>
   ERES ADMIN
</sec:ifAnyGranted>--}%
<div class="container">

    <div class="row" id="pwd-container">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <section class="login-form">
                <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" role="login" autocomplete="off">
                    <div class="align-self-start mr-3" style="display: flex; justify-content: center; align-items: center"><p class="text-center">
                        <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                        <label style="font-size: 20px">Amor de</label>
                        <label style="color: black; font-size: 25px"> Mascotas</label>
                    </p></div>
                    %{--<label for="username"><g:message code='springSecurity.login.username.label'/>:</label>--}%
                    <input type="text" placeholder="Ingrese Usuario" class="text_ form-control input-lg" name="${usernameParameter ?: 'username'}" id="username"/>
                    %{--<label for="password"><g:message code='springSecurity.login.password.label'/>:</label>--}%
                    <input type="password" placeholder="Ingrese Contraseña" class="text_ form-control input-lg" name="${passwordParameter ?: 'password'}" id="password"/>
                    %{--<button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Sign in</button>--}%
                    <g:if test='${flash.message}'>
                        <p class="text-danger">${flash.message}</p>
                    </g:if>
                    <input type="submit" name="go" class="btn btn-lg btn-primary btn-block" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
                    <div>
                        <a href="#">Create account</a> or <a href="#">reset password</a>
                    </div>
                </form>
                <div class="form-links">
                    <a href="#">www.website.com</a>
                </div>
            </section>
        </div>
        <div class="col-md-4"></div>

    </div>

</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>

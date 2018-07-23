<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    %{--<asset:javascript src="login.js"/>--}%
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
<div class="container" name="div_index" id="div_index" style="display: none">

    <div class="row" id="pwd-container">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <section class="login-form">
                <g:if test='${flash.message}'>
                    <div class="login_message">${flash.message}</div>
                </g:if>
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" role="login" autocomplete="off">
                        <img src="http://i.imgur.com/RcmcLv4.png" class="img-responsive" alt="" />
                        %{--<label for="username"><g:message code='springSecurity.login.username.label'/>:</label>--}%
                        <input type="text" placeholder="Ingrese Usuario" class="text_ form-control input-lg" name="${usernameParameter ?: 'username'}" id="username"/>
                        %{--<label for="password"><g:message code='springSecurity.login.password.label'/>:</label>--}%
                        <input type="password" placeholder="Ingrese Contraseña" class="text_ form-control input-lg" name="${passwordParameter ?: 'password'}" id="password"/>
                        %{--<button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Sign in</button>--}%
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
    $( document ).ready(function(){
        var URL="${createLink(controller:'securitySession',action:'isLoginSuccess')}"
        $.ajax({
            url: URL,
            success: function(resp) {
                if(resp == "true") {
                    window.location.href = "/home";
                } else {
                    $("#div_index").show();
                }
            }
        });
    });

    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>

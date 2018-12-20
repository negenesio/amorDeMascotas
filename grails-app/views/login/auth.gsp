<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
    <asset:javascript src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"/>
    <title>Welcome to Grails</title>
</head>
<body>

<div id="div_index" name="div_index" class="container align-self-start login-form" style="display: block; justify-content: center; align-items: center">
    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="login_form" role="login" autocomplete="off">
        <fieldset style="display: flex; justify-content: center; align-items: center">

            <!-- Form Name -->
            <legend style="display: block">
                <i style="color:black" class="fa fa-paw fa-4x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <!-- Text input Usuario-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-user fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="username" id="username" placeholder="Ingrese Usuario / E-Mail" class="form-control col-md-6" type="text">
                </div>
            </div>

            <!-- Text input Contraseña-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-lock fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="password" id="password" placeholder="Ingrese Contraseña" class="form-control col-md-6" type="password">
                </div>
            </div>

            <!-- Button input -->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">

                            </span>
                        </center>
                    </label>
                    <input type="submit" class="btn btn-info btn-block form-control col-md-3" type="submit" value="Iniciar Sesion"/> <a href="/registration" class="link_home"> Registrarse</a>
                    <g:if test="${params.login_error}">
                        <label id="error-label" style="margin-left: 140px; margin-top: 15px;color: red;">Contraseña o Usuario incorrecto...</label>
                    </g:if>
                    <label style="margin-left: 140px; margin-top: 15px"><a href="/recovery-password">¿Has olvidado los datos de la cuenta?</a></label>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<script>
    $("#error").hide();
    (function() {
        document.forms['login_form'].elements['${'username'}'].focus();
    })();
</script>

</body>
</html>

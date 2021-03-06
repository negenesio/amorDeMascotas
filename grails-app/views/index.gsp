<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <title>Amor de Mascotas</title>
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
</sec:ifAnyGranted>

data: function(validator) {
    return {
        username: validator.getFieldElements('username').val()
    };
}
--}%

<div id="div_index" name="div_index" class="container align-self-start login-form" style="display: none; justify-content: center; align-items: center">
    <form class="well form-horizontal" action="${createLink(controller:'user', action:'createUser')}" method="post"  id="registration_form">
        <fieldset style="display: flex; justify-content: center; align-items: center">

            <!-- Form Name -->
            <legend>
                <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <!-- Text input Usuario-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-users fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="username" id="username" placeholder="Ingrese usuario" class="form-control col-md-6" type="text">
                </div>
            </div>

            <!-- Text input Nombre y Apellido-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-id-card fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="name" id="name" placeholder="Ingrese Nombre y Apellido" class="form-control col-md-6" type="text">
                </div>
            </div>

            <!-- Text input Fecha Nacimiento-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-birthday-cake fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input type="date" name="fecha_nacimiento" class="form-control col-md-6" id="fecha_nacimiento" required>
                </div>
            </div>

            <!-- Text input Correo Electronico-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-at fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="email" id="email" placeholder="Ingrese Correo Electronico" class="form-control col-md-6" type="text">
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

            <!-- Text input Confirmar Contraseña-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-lock fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="confirm_password" id="confirm_password" placeholder="Confirmar Contraseña" class="form-control col-md-6" type="password">
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
                    <input type="submit" class="btn btn-info btn-block form-control col-md-6" type="submit" value="Registrarse"/>
                </div>
            </div>

        </fieldset>
    </form>
</div>
<script>
    $(document).ready(function() {
        var URL = "${createLink(controller:'securitySession',action:'isLoginSuccess')}"
        var URLfindUser = "${createLink(controller:'user', action:'isUsernameOrEmailExists')}"
        $.ajax({
            url: URL,
            success: function (resp) {
                if (resp == "true") {
                    window.location.href = "/home";
                } else {
                    $("#div_index").show();
                    $("#username").focus();
                }
            }
        });

        $('#registration_form').bootstrapValidator({
            feedbackIcons: {
                valid: 'fas fa-check',
                invalid: 'fa fa-times',
                validating: 'fa fa-clock'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese un usuario valido.'
                        },
                        stringLength: {
                            min: 4,
                            message: 'El usuario debe contener al menos 4 letras.'
                        },
                        remote: {
                            type: 'GET',
                            url: URLfindUser,
                            message: 'El Usuario ya se encuentra registrado.'
                        }
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese Nombre y Apellido.'
                        },
                        stringLength: {
                            min: 4,
                            message: 'El Nombre y Apellido debe contener al menos 4 letras.'
                        }
                    }
                },
                fecha_nacimiento: {
                    validators: {
                        date: {
                            format: 'YYYY-MM-DD',
                            message: 'Ingrese una fecha valida.'
                        },
                        notEmpty: {
                            message: 'Ingrese su fecha de cumpleaños.'
                        },
                        callback: {
                            message: 'Ingrese una fecha de cumpleaños real.',
                            callback: function(value, validator) {
                                var m = moment(value, 'YYYY-MM-DD', true);
                                if (!m.isValid()) {
                                    return false;
                                }
                                return m.isAfter(new Date('1900-01-01'), "YYYY-MM-DD", true) && m.isBefore(moment(new Date(moment().year()+'-12-30'), "YYYY-MM-DD", true));
                            }
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese un E-mail.'
                        },
                        emailAddress: {
                            message: 'Ingrese un E-mail valido.'
                        },
                        remote: {
                            type: 'GET',
                            url: URLfindUser,
                            message: 'El Email ya se encuentra registrado.'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese su contraseña.'
                        },
                        stringLength: {
                            min: 4,
                            message: 'La contraseña debe contener al menos 4 caracteres.'
                        },
                        identical: {
                            field: 'confirm_password',
                            message:'Las contraseñas no coinciden.'
                        }
                    }
                },
                confirm_password: {
                    validators: {
                        identical: {
                            field: 'password',
                            message:'Las contraseñas no coinciden.'
                        },
                        notEmpty: {
                            message: 'Ingrese confirmacion de contraseña.'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>
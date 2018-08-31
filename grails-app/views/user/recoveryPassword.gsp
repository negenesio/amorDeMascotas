<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <title>Welcome to Grails</title>

</head>
<body>

<div id="div_recovery_password_user" name="div_recovery_password_user" class="container align-self-start login-form" style="display: block; justify-content: center; align-items: center">
    <i id="tooltip_recovery_password_user" name="tooltip_recovery_password_user" style="margin-left: 510px; margin-top: 10px;" class="fa fa-info-circle fa-2x fa-pull-left col-md-6" data-toggle="tooltip" data-placement="left" title="¡Ingresa tu usuario o E-Mail, para recibir un codigo de verificacion!"></i>
    <form action="${createLink(controller: 'user', action: 'recoveryPasswordGenerateToken')}" method="POST" id="recovery_password_form" role="login" autocomplete="off">
        <fieldset style="display: flex; justify-content: center; align-items: center">

            <!-- Form Name -->
            <legend>
                <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <legend style="margin-bottom: 0px;">
                <label style="font-size: 15px; margin-left: 80px; font-weight: bold;">Recuperacion de Contraseña</label>
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
                    <input  name="username_recovery" id="username_recovery" placeholder="Ingrese Usuario / E-Mail" class="form-control col-md-6" type="text">
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
                    <input type="submit" id="submit_form" name="submit_form" class="btn btn-info btn-block form-control col-md-5" type="submit" value="Continuar" style="margin-left: 25px;"/>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<div id="div_recovery_password_token" name="div_recovery_password_token" class="container align-self-start login-form" style="display: none; justify-content: center; align-items: center">
    <i id="tooltip_recovery_password_token" name="tooltip_recovery_password_token" style="margin-left: 520px; margin-top: 15px" class="fa fa-info-circle fa-2x" data-toggle="tooltip" data-placement="right" title="¡Hemos enviado el codigo a tu E-Mail!"></i>
    <form action="${createLink(controller: 'user', action: 'recoveryPasswordValidToken')}" method="POST" id="recovery_password_token_form" role="login" autocomplete="off">
        <fieldset style="display: flex; justify-content: center; align-items: center">

            <!-- Form Name -->
            <legend>
                <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <legend style="margin-bottom: 0px;">
                <label style="font-size: 15px; margin-left: 80px; font-weight: bold;">Validacion Codigo de Seguridad </label>
            </legend>
            <!-- Text input token-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-shield-alt fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="token" id="token" placeholder="Ingrese el codigo de seguridad." class="form-control col-md-6" type="text">
                </div>
            </div>

            <!-- Button input -->
            <div class="form-group" style="margin-top: 0px">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">

                            </span>
                        </center>
                    </label>
                    <input type="submit" id="submit_token_form" name="submit_token_form" class="btn btn-info btn-block form-control col-md-5" type="submit" value="Continuar" style="margin-left: 25px;"/>
                    <input type="hidden" name="username_valid_token" id="username_valid_token" class="form-control" required/>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<div id="div_recovery_password_change" name="div_recovery_password_change" class="container align-self-start login-form" style="display: none; justify-content: center; align-items: center">
    <i id="tooltip_recovery_password_change" name="tooltip_recovery_password_change" style="margin-left: 520px; margin-top: 15px" class="fa fa-info-circle fa-2x" data-toggle="tooltip" data-placement="right" title="¡Todo Listo, ya puedes elegir una contraseña nueva!"></i>
    <form action="${createLink(controller: 'user', action: 'recoveryPasswordChange')}" method="POST" id="recovery_password_change_form" role="login" autocomplete="off">
        <fieldset style="display: flex; justify-content: center; align-items: center">

            <!-- Form Name -->
            <legend>
                <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <legend style="margin-bottom: 0px;">
                <label style="font-size: 15px; margin-left: 80px; font-weight: bold;">Validacion Codigo de Seguridad </label>
            </legend>

            <!-- Text input Username-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-user fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="username_change" id="username_change" placeholder="Usuario / E-Mail." class="form-control col-md-6" type="text" readonly>
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
                    <input  name="password_change" id="password_change" placeholder="Ingrese Nueva Contraseña." class="form-control col-md-6" type="password">
                </div>
            </div>

            <!-- Text input Confirmar contraseña-->
            <div class="form-group">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">
                                <i class="fa fa-lock fa-2x"></i>
                            </span>
                        </center>
                    </label>
                    <input  name="confirm_password_change" id="confirm_password_change" placeholder="Confirmar Nueva Contraseña." class="form-control col-md-6" type="password">
                </div>
            </div>

            <!-- Button input -->
            <div class="form-group" style="margin-top: 0px">
                <div class="input-group">
                    <label class="col-md-3 control-label">
                        <center>
                            <span class="input-group-addon">

                            </span>
                        </center>
                    </label>
                    <input type="submit" id="submit_change_form" name="submit_change_form" class="btn btn-info btn-block form-control col-md-5" type="submit" value="Continuar" style="margin-left: 25px;"/>
                    <input type="hidden" name="username_password_change" id="username_password_change" class="form-control"/>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<script>
    $(document).ready(function() {
        $('#username_recovery').focus();
        var URLfindUser = "${createLink(controller:'user', action:'isUsernameOrEmailExists')}";
        $('#recovery_password_form').bootstrapValidator({
            live: 'disabled',
            feedbackIcons: {
                valid: 'fas fa-check',
                invalid: 'fa fa-times',
                validating: 'fa fa-clock'
            },
            fields: {
                username_recovery: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese su Usuario o Email.'
                        },
                        remote: {
                            type: 'GET',
                            url: URLfindUser,
                            data: function(validator) {
                                return {
                                    username: validator.getFieldElements('username_recovery').val(),
                                    recovery_password: 'true'
                                };
                            },
                            message: 'El usuario/e-mail no existe.',
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {
                $("#div_recovery_password_user").hide();
                $("#div_recovery_password_token").show();
                $("#tooltip_recovery_password_token").tooltip('show');
                $('#tooltip_recovery_password_user').tooltip('hide');
                $('#username_valid_token').val($('#username_recovery').val());
                $('#username_password_change').val($('#username_recovery').val());
                $('#username_change').val($('#username_recovery').val());
                $('#token').focus();
                //validator.defaultSubmit();
            }
        });

        var URLValidToken = "${createLink(controller: 'user', action: 'recoveryPasswordValidToken')}";
        $('#recovery_password_token_form').bootstrapValidator({
            live: 'disabled',
            excluded: [':disabled'],
            feedbackIcons: {
                invalid: 'fa fa-times',
                validating: 'fa fa-clock'
            },
            fields: {
                token: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese el codigo de seguridad.'
                        },
                        remote: {
                            type: 'GET',
                            url: URLValidToken,
                            data: function(validator) {
                                return {
                                    username_valid_token: validator.getFieldElements('username_valid_token').val()
                                };
                            },
                            message: 'El codigo ingresado es incorrecto.',
                        }
                    }
                }
            },
            message: '',
            submitHandler: function(validator, form, submitButton) {
                $("#div_recovery_password_token").hide();
                $("#tooltip_recovery_password_token").hide();
                $("#tooltip_recovery_password_change").tooltip('show');
                $("#div_recovery_password_change").show();
                $('#password_change').focus();
                //validator.defaultSubmit();
            }
        });

        $('#recovery_password_change_form').bootstrapValidator({
            live: 'disabled',
            valid: 'fas fa-check',
            excluded: [':disabled'],
            feedbackIcons: {
                invalid: 'fa fa-times',
                validating: 'fa fa-clock'
            },
            fields: {
                password_change: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese su contraseña.'
                        },
                        stringLength: {
                            min: 4,
                            message: 'La contraseña debe contener al menos 4 caracteres.'
                        },
                        identical: {
                            field: 'confirm_password_change',
                            message:'Las contraseñas no coinciden.'
                        }
                    }
                },
                confirm_password_change: {
                    validators: {
                        identical: {
                            field: 'password_change',
                            message:'Las contraseñas no coinciden.'
                        },
                        notEmpty: {
                            message: 'Ingrese confirmacion de contraseña.'
                        }
                    }
                }
            }
        });

        $(function () {
            $('#tooltip_recovery_password_user').tooltip('show');
        })
    });

</script>

</body>
</html>
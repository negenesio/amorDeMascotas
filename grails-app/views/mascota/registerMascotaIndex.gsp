<!doctype html>
<%@ page import="com.amordemascotas.Raza" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
<style>
    small.help-block {
        margin-right: 70px;
    }

    #mascota_registration_form > div:nth-child(1) > div > div:nth-child(5) > div > i {
        margin-right: 115px;
    }
    .dropdown.bootstrap-select.form-control {
        background-color: #00000000;
    }

    .btn.dropdown-toggle.bs-placeholder.btn-light {
        width: 270px;
    }

    #mascota_registration_form > div:nth-child(1) > div > div:nth-child(5) > div > div > button {
        width: 270px;
    }

    .datepicker table tr td span.active,
    .datepicker table tr td span.active:hover,
    .datepicker table tr td span.active.disabled,
    .datepicker table tr td span.active.disabled:hover {
        background-color: #006dcc;
        background-image: -moz-linear-gradient(to bottom, #08c, #00a1b9);
        background-image: -ms-linear-gradient(to bottom, #08c, #00a1b9);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#08c), to(#00a1b9));
        background-image: -webkit-linear-gradient(to bottom, #08c, #00a1b9);
        background-image: -o-linear-gradient(to bottom, #08c, #00a1b9);
        background-image: linear-gradient(to bottom, #08c, #00a1b9);
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#08c', endColorstr='#0044cc', GradientType=0);
        border-color: #0044cc #008BA3 #00a1b9;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        color: #fff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
    }

    #mascota_registration_form > div > div:nth-child(5) > div > div

    .datepicker .datepicker-switch {
        width: 200px;
    }

    .datepicker table tr td span {
        display: block;
        width: 50px;
        height: 54px;
        line-height: 54px;
        float: left;
        margin: 1%;
        cursor: pointer;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
    }

    #registration_form > div > div:nth-child(5) > div > div {
        width: 275px;
    }

    .dropdown-header {
        display: none;
    }
</style>


<title>Amor de Mascotas</title>
</head>

<style>
/* Hide all steps by default: */
.tab {
    display: none;
}

button:hover {
    opacity: 0.8;
}

/* Make circles that indicate the steps of the form: */
.step {
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: #bbbbbb;
    border: none;
    border-radius: 50%;
    display: inline-block;
    opacity: 0.5;
}

/* Mark the steps that are finished and valid: */
.step.finish {
    background-color: #4CAF50;
}
</style>
<body>

<form action="${createLink(controller:'mascota', action:'crearMascota')}" id="mascota_registration_form" name="mascota_registration_form">
    <div class="tab">
            <div class="mx-auto" style="width: 500px; background-color: #f8f9fa; margin-top: 20px">
                <!-- Form Name -->
                <legend>
                    <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                    <label style="font-size: 20px">Amor de</label>
                    <label style="color: black; font-size: 25px"> Mascotas</label>
                </legend>

                <!-- Text input Mascota Nombre-->
                <div class="form-group">
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                            <center>
                                <span class="input-group-addon">
                                    <i class="fa fa-bone fa-2x"></i>
                                </span>
                            </center>
                        </label>
                        <input  name="mascota_name" id="mascota_name" placeholder="Nombre de Mascota" class="form-control col-md-6" type="text" required>
                    </div>
                </div>

                <!-- Text input Mascota Fecha Nacimiento-->
                <div class="form-group">
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                            <center>
                                <span class="input-group-addon">
                                    <i class="fa fa-birthday-cake fa-2x"></i>
                                </span>
                            </center>
                        </label>
                        <span class="input-group-text" id="open-datepicker"><i class="fa fa-calendar"></i></span>
                        <input class="form-control col-md-5" id="mascota_fecha_nacimiento" name="mascota_fecha_nacimiento" placeholder="Año Nacimiento" autocomplete="off" type="text" required>
                    </div>
                </div>

                <!-- Text input Mascpta Sexo-->
                <div class="form-group">
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                            <center>
                                <span class="input-group-addon">
                                    <i class="fa fa-venus-mars fa-2x"></i>
                                </span>
                            </center>
                        </label>
                        <div class="maxl">
                            <label class="radio inline">
                                <input type="radio" name="mascota_sexo" value="hembra" id="sexo_hembra" checked>
                                <span>Hembra </span>
                            </label>
                            <label class="radio inline">
                                <input type="radio" name="mascota_sexo" id="sexo_macho" value="macho">
                                <span>Macho </span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Text input Mascota Fecha Nacimiento-->
                <div class="form-group">
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                            <center>
                                <span class="input-group-addon">
                                    <i class="fa fa-paw fa-2x"></i>
                                </span>
                            </center>
                        </label>
                        <select id="mascota_raza" name="mascota_raza" data-live-search="true" data-live-search-style="startsWith" class="form-control selectpicker" data-size="10" data_width="auto" required>
                            <option value="" selected disabled>-- Seleccione la Raza --</option>
                            <g:each in="${com.amordemascotas.Raza.list()}">
                                <g:if test="${it.descripcion != 'Mestizo'}">
                                    <option value="${it?.id}">${it?.descripcion}</option>
                                </g:if>
                                <g:else>
                                    <optgroup label="">
                                        <option value="${it?.id}">${it?.descripcion}</option>
                                    </optgroup>
                                </g:else>
                            </g:each>
                        </select>
                    </div>
                </div>

                <!-- Text input Mascota Descripcion-->
                <div class="form-group" style="height: 150px">
                    <label id="charNum" style="margin-left: 140px;font-size: 10px;color: grey;"> Descripcion: 140</label>
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                            <center>
                                <span class="input-group-addon">
                                    <i class="fa fa-eye fa-2x"></i>
                                </span>
                            </center>
                        </label>
                        <textarea style="height: 120px; width: 270px; flex: none" placeholder="Ingrese una descripcion de su mascota." name="descripcion" maxlength="140" class="form-control" id="exampleTextarea" rows="3" onkeyup="countChar(this)" name="descripcion"></textarea>
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
                        <input type="submit" id="send_create_mascota" name="send_create_mascota" style="margin-top: 30px" class="btn btn-info btn-block form-control col-md-6" value="Continuar"/>
                    </div>
                </div>
            </div>
    </div>
</form>
<script>
    $(document).ready(function() {
        var mascotaCrearLink = "${createLink(controller:'mascota', action:'crearMascota')}";
        $('#mascota_registration_form').bootstrapValidator({
            live: 'disabled',
            excluded: ':disabled',
            feedbackIcons: {
                valid: 'fas',
                invalid: 'fa fa-times',
                validating: 'fa fa-clock'
            },
            fields: {
                mascota_name: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese el nombre de su mascota.'
                        }
                    }
                },
                mascota_fecha_nacimiento: {
                    validators: {
                        notEmpty: {
                            message: 'Debe ingresar un año valido.'
                        }
                    }
                },
                mascota_raza: {
                    validators: {
                        notEmpty: {
                            message: 'Seleccione una raza.'
                        }
                    }
                }
            },
            submitHandler: function(validator, form, submitButton) {
                $.ajax({
                    url: mascotaCrearLink,
                    data: $('#mascota_registration_form').serialize(),
                    success: function (resp) {
                        if (resp == "true") {
                            console.log("success");
                        } else {
                            $("#div_index").show();
                            $("#username_register").focus();
                            console.log("fail");
                        }
                    }
                });
            }
        });

        $('#open-datepicker').click(function(){
            $("#mascota_fecha_nacimiento").datepicker('show');
        });

        $("#mascota_fecha_nacimiento").datepicker({
            minViewMode: 2,
            format: 'yyyy',
            endDate: new Date(),
            title: 'Seleccione un Año',
        });
    });

    function countChar(val) {
        var len = val.value.length-1;
        if (len >= 140) {
            val.value = val.value.substring(0, 140);
        } else {
            $('#charNum').text(" Descripcion: "+(140 - len-1));
        }
    };
</script>
</body>
</html>
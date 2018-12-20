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

    #mascota_registration_form > div > div > div:nth-child(7) > div > div > button {
        width: 65%;
    }
    #mascota_registration_form > div > div > div:nth-child(7) > div > div {
        max-width: 412px;
    }
    #mascota_registration_form > div > div > div:nth-child(7) > div > i {
        margin-left: -142px;
    }

    #image_preview {
        width: 400px;
        height: 250px;
    }

    .img-responsive{
        width: 200px;
        height: 150px;
    }

    .imageOutput{
        margin-top: 2em;
        margin-right: 5%;
        border: solid #19aebb 2px;
        border-radius: 20px;
        position: relative;
        right: 1em;
        width:190px;
        height: 150px;
    }

    .uploaded_image{
        margin-top: 2em;
        margin-right: 3%;
        border: solid #19aebb 3px;
        border-style: dotted;
        border-radius: 20px;
        position: relative;
        right: 1em;
        width:170px !important;
        height: 150px;
        padding: 0em !important;

    }
    .imageUpload{
        padding: 3.2em !important;
        margin-top: 2em !important;
        padding-top: 0.5em !important;
    }
    .ImageOnPreview{

        border-radius: 18px;
        width:171px !important;
        height: 150px;
        padding: 0em !important;
        margin: 0em !important;



    }
    #imageUploadSection{
        position: fixed;
        left: 50%;
        transform: translateX(-50%);
    }
    .photoText{
        margin-top: -2em !important;
    }
    .fileUpload{visibility: hidden;}
    </style>

<title>Amor de Mascotas</title>

</head>
<body>

<form action="${createLink(controller:'mascota', action:'crearMascota')}" id="mascota_registration_form" name="mascota_registration_form">
    <div class="tab">
            <div class="mx-auto" style="width: 500px; background-color: #f8f9fa; margin-top: 20px">
                <!-- Form Name -->
                <legend style="display: block">
                    <i style="color:black" class="fa fa-paw fa-4x pull-left" aria-hidden="true"></i>
                    <label style="font-size: 20px">Amor de</label>
                    <label style="color: black; font-size: 25px"> Mascotas</label>
                </legend>
                <center><div id="duplicado" name="duplicado" style="color: red; display: none"> La mascota ya existe, prueba cargando una diferente.</div></center>
                <p></p>
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
                            <option value="0" selected disabled>-- Seleccione la Raza --</option>
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

<div id="img_div" style="display: none">
<form action="${createLink(controller:'imagenes', action:'uploadImg')}" method="POST" enctype="multipart/form-data" id="form_img_upload" name="form_img_upload">
    <input type="file" name="images1" id="images1" class="fileUpload" enctype="multipart/form-data" />
    <input type="file" name="images2" id="images2" class="fileUpload" enctype="multipart/form-data" />
    <div id="target">

    </div>
    <div class="tab">
        <div class="mx-auto" style="width: 500px; background-color: #f8f9fa; margin-top: 20px">
            <legend style="display: block">
                <i style="color:black" class="fa fa-paw fa-4x pull-left" aria-hidden="true"></i>
                <label style="font-size: 20px">Amor de</label>
                <label style="color: black; font-size: 25px"> Mascotas</label>
            </legend>

            <center><div id="titleImagen" name="titleImagen" style="display: block"> Ya casi lo tienes, solo faltan las imagenes.</div></center>

            <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 200px" >
                <div class="form-group" style="height: 150px">
                    <div class="input-group">
                        <img  src="/assets/default.png"  alt="add a photo" id="img1" name="img1" class="imageUpload" >
                    </div>
                </div>
            </div>
            <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 200px" >
                <div class="form-group" style="height: 150px">
                    <div class="input-group">
                        <img  src="/assets/default.png"  alt="add a photo" id="img2" name="img2" class="imageUpload" >
                    </div>
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
                    <input type="hidden" id="mascotaCreateId" name="mascotaCreateId" value=""/>
                    <input type="submit" id="send_img" name="send_img" style="margin-top: 30px;margin-left: -17px;" class="btn btn-info btn-block form-control col-md-6" value="Omitir por Ahora"/>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
%{--<g:each in="${imagenes}" var="imagen">
        <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="150px" height="150px"/>

</g:each>--}%
<script>
    $(document).ready(function() {
        $("#img1").click(function() {
            $("input[name='images1']").click();
        });

        $("#img2").click(function() {
            $("input[name='images2']").click();
        });

        $("input[name='images1']").on('change', function(event) {
            var files = event.target.files;
            var image = files[0]
            var reader = new FileReader();
            reader.onload = function(file) {
                var img = new Image();
                img.src = file.target.result;
                $("#img1").attr('src', file.target.result);
                $("#img1").addClass( "ImageOnPreview" );
                $("#img1").delay(150).show();

                isEmptyFiles();
            }
            if($("#images1").val() != "") {
                reader.readAsDataURL(image);
            } else {
                $("#img1").removeClass( "ImageOnPreview" );
                $("#img1").prop("src", "/assets/default.png");
            }
        });

        $("input[name='images2']").on('change', function(event) {
            var files = event.target.files;
            var image = files[0]
            var reader = new FileReader();
            reader.onload = function(file) {
                var img = new Image();
                img.src = file.target.result;
                $("#img2").attr('src', file.target.result);
                $("#img2").addClass( "ImageOnPreview" );
                $("#img2").delay(150).show();
                isEmptyFiles();
            }

            if($("#images2").val() != "") {
                reader.readAsDataURL(image);
            } else {
                $("#img2").removeClass( "ImageOnPreview" );
                $("#img2").prop("src", "/assets/default.png");
            }

        });

        function isEmptyFiles(){
            if($("images1").val() == "" && $("images2").val() == "") {
                $("#send_img").val("Omitir por Ahora");
            } else {
                $("#send_img").val("Subir Imagenes");
            }
        }

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
                        if (resp.success) {
                            $('#mascotaCreateId').val(resp.mascotaId);
                            $('#duplicado').hide();
                            $('#upload_images').show();
                            $('#mascota_registration_form').hide();
                            $('#img_div').show();
                        } else {
                            document.getElementById("mascota_registration_form").reset();
                            $("#mascota_raza").val("0").change();
                            $('#mascota_name').focus();
                            $('#duplicado').show();
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
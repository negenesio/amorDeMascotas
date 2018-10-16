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

    #mascota_update_form > div:nth-child(1) > div > div:nth-child(5) > div > i {
        margin-right: 115px;
    }
    .dropdown.bootstrap-select.form-control {
        background-color: #00000000;
    }

    .btn.dropdown-toggle.bs-placeholder.btn-light {
        width: 270px;
    }

    #mascota_update_form > div:nth-child(1) > div > div:nth-child(5) > div > div > button {
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

    #mascota_update_form > div > div:nth-child(5) > div > div

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

    #mascota_update_form > div > div > div:nth-child(7) > div > div > button {
        width: 65%;
    }
    #mascota_update_form > div > div > div:nth-child(7) > div > div {
        max-width: 412px;
    }
    #mascota_update_form > div > div > div:nth-child(7) > div > i {
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

<form action="${createLink(controller:'mascota', action:'actualizarMascota')}" id="mascota_update_form" name="mascota_update_form" method="POST" enctype="multipart/form-data">
    <input type="file" name="images1" id="images1" class="fileUpload" enctype="multipart/form-data" />
    <input type="file" name="images2" id="images2" class="fileUpload" enctype="multipart/form-data" />
    <input type="hidden" name="mascotaUpdateId" value="${mascota.id}"/>
    <div class="tab">
            <div class="mx-auto" style="width: 500px; background-color: #f8f9fa; margin-top: 20px">
                <!-- Form Name -->
                <legend>
                    <i style="color:black" class="fa fa-paw fa-5x pull-left" aria-hidden="true"></i>
                    <label style="font-size: 20px">Amor de</label>
                    <label style="color: black; font-size: 25px"> Mascotas</label>
                </legend>
                <center><div id="duplicado" name="duplicado" style="color: red; display: none"> La mascota que intentas actulizar ya existe, revisa los datos.</div></center>
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
                        <input  name="mascota_name" id="mascota_name" placeholder="Nombre de Mascota" class="form-control col-md-6" type="text" value="${mascota.nombre}" required>
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
                        <input class="form-control col-md-5" id="mascota_fecha_nacimiento" name="mascota_fecha_nacimiento" placeholder="Año Nacimiento" autocomplete="off" type="text" value="${mascota.fechaNacimiento.format("YYYY")}" required>
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
                        <textarea style="height: 120px; width: 270px; flex: none" placeholder="Ingrese una descripcion de su mascota." name="descripcion" id="descripcion" maxlength="140" class="form-control" id="exampleTextarea" rows="3" onkeyup="countChar(this)" name="descripcion"></textarea>
                    </div>
                </div>

                <center><div id="titleImagen" name="titleImagen" style="font-size: 20px;color: black;"> Tambien puedes actulizar las imagenes.</div></center>
                <g:if test="${imagenes[0].nombre == 'default'}">
                    <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 180px" >
                        <div class="form-group" style="height: 150px">
                            <div class="input-group">
                                <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenes[0].id])}"  alt="add a photo" id="img1" name="img1" class="imageUpload">
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 180px" >
                        <div class="form-group" style="height: 150px">
                            <div class="input-group">
                                <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenes[0].id])}"  alt="add a photo" id="img1" name="img1" class="ImageOnPreview">
                            </div>
                        </div>
                    </div>
                </g:else>
                <g:if test="${imagenes[1].nombre == 'default'}">
                    <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 180px" >
                        <div class="form-group" style="height: 150px">
                            <div class="input-group">
                                <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenes[1].id])}"  alt="add a photo" id="img2" name="img2" class="imageUpload">
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="uploaded_image col s11  m10 l3 "  style="margin-left: 180px" >
                        <div class="form-group" style="height: 150px">
                            <div class="input-group">
                                <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenes[1].id])}"  alt="add a photo" id="img2" name="img2" class="ImageOnPreview">
                            </div>
                        </div>
                    </div>
                </g:else>
                <!-- Button input -->
                <div class="form-group" style="margin-top: -40px;">
                    <div class="input-group">
                        <label class="col-md-3 control-label">
                        </label>
                        <input type="button" id="send_update_mascota" name="send_update_mascota" style="margin-top: 80px; margin-left: -20px;" class="btn btn-info btn-block form-control col-md-6" value="Actulizar Mascota"/>
                        <input type="submit" id="button_submit" name="button_submit" style="margin-top: 80px; margin-left: -20px; display: none" class="btn btn-info btn-block form-control col-md-6" value="Actulizar Mascota"/>
                    </div>
                </div>
            </div>
    </div>
    <input type="hidden" id="image1Name" name="image1Name" value="${imagenes[0].nombre}"/>
    <input type="hidden" id="image2Name" name="image2Name" value="${imagenes[1].nombre}"/>
</form>
%{--<g:each in="${imagenes}" var="imagen">
        <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="150px" height="150px"/>

</g:each>--}%
<script>
    $(document).ready(function() {
        $("#mascota_name").focus();
        var URLValidate = "${createLink(controller:'mascota', action:'validarDuplicado')}";
        $("#send_update_mascota").click(function() {
            $.ajax({
                type: "POST",
                url: URLValidate,
                data : {
                    'nombre': $("#mascota_name").val(),
                    'sexo': $('input[name=mascota_sexo]:checked').val(),
                    'fecha_nacimiento': $("#mascota_fecha_nacimiento").val(),
                    'raza': $("#mascota_raza").val(),
                    'mascotaId': '${mascota.id}'
                },
                success: function (resp) {
                    if(resp == 'valido') {
                        $("#duplicado").hide();
                        $( "#button_submit" ).trigger( "click" );
                    }
                    if(resp == 'duplicado') {
                        $("#mascota_name").focus();
                        $("#duplicado").show();
                        $("#mascota_name").focus();
                    }
                }
            });
        });

        preCardInputs();
        function preCardInputs(){
            $("#mascota_raza").val("${mascota.raza.id}");
            var sexo = "${mascota.sexo}";
            if(sexo == "hembra") {
                $("#sexo_hembra").prop("checked", true);
            } else {
                $("#sexo_macho").prop("checked", true);
            }

            $("#descripcion").val("${mascota.descripcion}");
            countChar(document.getElementById("descripcion"));
        }

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
            }
            if($("#images1").val() != "") {
                reader.readAsDataURL(image);
            } else {
                $("#img1").removeClass( "ImageOnPreview" );
                $("#img1").addClass( "imageUpload" );
                $("#img1").prop("src", "/assets/default.png");
            }
            if(files[0].name == "") {
                $("#image1Name").val("default")
            } else {
                $("#image1Name").val(files[0].name)
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
            }

            if($("#images2").val() != "") {
                reader.readAsDataURL(image);
            } else {
                $("#img2").addClass( "imageUpload" );
                $("#img2").removeClass( "ImageOnPreview" );
                $("#img2").prop("src", "/assets/default.png");
            }

            if(files[0].name == "") {
                $("#image2Name").val("default")
            } else {
                $("#image2Name").val(files[0].name)
            }

        });

        $('#mascota_update_form').bootstrapValidator({
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
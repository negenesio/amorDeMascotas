<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="bootstrap_confirm.js"/>

    <style>
    a.step.nextLink.prevLink{
        color: black !important;
    }
    .step {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .nextLink {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .prevLink {
        padding: 10px;
        color: black;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .currentStep {
        padding: 10px;
        background-color: #b3b3b3;
        color: white;
        border: 1px solid black;
    }

    .step.gap {
        display: none;
    }

    .step:hover:not(.active) {
        background-color: #ddd;
    }

    div.hero {
        background: url('/assets/carrusel/schnauzer_gris.png');
        background-size: cover;
        width: 600px;
        height: 300px
    }

    .table td th {
        text-align: center;
    }

    .cancel{
        color:white;
    }

    .confirm{
        color:white;
    }
    </style>
    <title>Amor de Mascotas</title>
</head>
<body>
<g:if test="${!mascotas}">
    <div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center">
        <center>
            <div class="hero text-block-label" style="margin-top:5px">
                <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
                    <p>Aun no tienes cargada ninguna mascota</p>
                    <p>Debes al menos tener una mascota cargada para continuar.</p>
                </label>
                <a href="/mascota/registrar" class="btn btn-info" style="margin-top: 5px"/>Cargar Mascota</a>
            </div>
        </center>
    </div>
</g:if>
<g:else>
    <div id="div_con_mascota" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center;height: 415px;">
    <table class="table table-striped">
        <thead>
        <tr>
            <th><i class="fa fa-paw fa-2x"></i></th>
            <th>Nombre</th>
            <th>Edad</th>
            <th>Raza</th>
            <th>Sexo</th>
            <th>Acciones</th>
        </tr>
        </thead>
            <tbody>
            <g:each in="${mascotas}" var="mascota" status="counter">
                <tr>
                    <td scope="row"></td>
                    <td>${mascota.nombre}</td>
                    <td>${new Date().format('YYYY').toLong() - mascota.fechaNacimiento.format('YYYY').toLong()}</td>
                    <td>${mascota.raza.descripcion}</td>
                    <td>${mascota.sexo}</td>
                    <td style="font-size: 20px;width: 150px;">
                        <i data-toggle="confirmation-edit" data-popout="true" data-id="${mascota.id}" class="fas fa-edit fa-1x" style="padding-left: 10px; color: black; cursor: pointer" id="editarMascota" name="editarMascota"></i>
                        <i data-toggle="confirmation" data-popout="true" data-id="${mascota.id}" class="fas fa-backspace fa-1x" style="padding-left: 10px; color: #d16a4a; cursor: pointer" id="borrarMascota" name="borrarMascota"></i>
                        <i class="fas fa-heart" style="padding-left: 10px; color: #5a8044; cursor: pointer"></i>
                    </td>
                </tr>
        </g:each>
    </tbody>
    </table>
        <center><div class="paginateButtons" style="margin-top: 30px;">
            <g:paginate total="${mascotasCount}" max="5"/>

        </div></center>
    </div>
</g:else>
<script>
    $('[data-toggle=confirmation]').confirmation({
        focusout: false,
        rootSelector: '[data-toggle=confirmation]',
        title:"¿Eliminar Mascota?",
        onConfirm: function(value) {
            var id = $(this).attr('data-id');
            var URLborrarMascota = "${createLink(controller:'mascota', action:'borrarMascota')}"
            $.ajax({
                url: URLborrarMascota,
                data: {
                    'mascotaId':id
                },
                success: function (resp) {
                    if (resp == "true") {
                        window.location.href = "/home";
                    } else {
                        $("#div_index").show();
                        $("#username_register").focus();
                    }
                }
            });
        },
        buttons: [
            {
                class: 'btn btn-danger',
                iconClass: 'confirm fas fa-check',
                label: 'Confirmar',
            },
            {
                class: 'btn btn-secondary',
                iconClass: 'cancel fas fa-ban',
                label: 'Cancelar',
                cancel: true
            }
        ]
    });

    $('[data-toggle=confirmation-edit]').confirmation({
        focusout: false,
        rootSelector: '[data-toggle=confirmation-edit]',
        title:"¿Modificar Mascota?",
        onConfirm: function(value) {
            var id = $(this).attr('data-id');
            var URLeditarMascota = "/mascota/editarMascota?mascotaId="+id;
            window.location.href = URLeditarMascota;
        },
        buttons: [
            {
                class: 'btn btn-info',
                iconClass: 'confirm fas fa-check',
                label: 'Editar',
            },
            {
                class: 'btn btn-secondary',
                iconClass: 'cancel fas fa-ban',
                label: 'Cancelar',
                cancel: true
            }
        ]
    });
</script>
%{--<table>
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Edad</th>
        <th>Raza</th>
        <th>Sexo</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
        <g:each in="${mascotas}" var="mascota" status="counter">
            <tr>
                 <td scope="row">${counter+1}</td>
                <td>${mascota.nombre}</td>
                <td>${new Date().format('YYYY').toLong() - mascota.fechaNacimiento.format('YYYY').toLong()}</td>
                <td>${mascota.raza.descripcion}</td>
                <td>${mascota.sexo}</td>
                <td style="font-size: 20px;width: 150px;">
                    <i data-toggle="confirmation-edit" data-popout="true" data-id="${mascota.id}" class="fas fa-edit fa-1x" style="padding-left: 10px; color: black; cursor: pointer" id="borrarMascota" name="borrarMascota"></i>
                    --}%%{--<a href="${createLink(controller: 'mascota', action: 'editarMascota', params:['mascotaId':mascota.id])}"><i class="fas fa-edit fa-1x" style="padding-left: 10px; color: black"></i></a>--}%%{--
                    <i data-toggle="confirmation" data-popout="true" data-id="${mascota.id}" class="fas fa-backspace fa-1x" style="padding-left: 10px; color: #d16a4a; cursor: pointer" id="borrarMascota" name="borrarMascota"></i>
                    <i class="fas fa-heart" style="padding-left: 10px; color: #5a8044; cursor: pointer"></i>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>--}%
%{--<g:each var="mascota" in="${mascotas}">
    <br>${mascota.nombre}
</g:each>--}%
</div>
</body>
</html>
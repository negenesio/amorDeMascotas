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
    .col-center {
        margin: 0 auto;
        float: none !important;
    }

    div.hero {
        background: url('/assets/encuentro01.jpg');
        background-size: cover;
        width: 600px;
        height: 300px;
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
</head>
<body>

<div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center">
    <center>
        <div class="hero text-block-label" style="margin-top:5px">
            <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
            <g:if test="${encuentros.isEmpty()}">
                <p>¡Todavia no realizaste ninguna busqueda de encuentro!</p>
                <p>¡Puedes empezar ahora mismo!.</p>
            </g:if>
            <g:else>
                <p>¡Te notifcaremos cuando tengas un encuentro concretado!</p>
                <p>¡Nunca dejes de buscar encuentros!.</p>
            </g:else>
            </label>
        </div>
    </center>
    <center>
        <div style="padding-top: 20px">
            <h2><span style="padding-left: 40px">Selecciona un Candidato</span> <span><i style="padding-left: 100px" class="fas fa-arrow-down"></i></span></h2>

        </div>
    </center>
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
                        <span data-toggle="confirmation" data-popout="true" data-id="${mascota.id}" style="font-size: 15px; color: indianred; cursor: pointer"><i class="fas fa-heart" style="color: indianred"></i>Encuentro<i class="fas fa-paw" style="color: indianred"></i></span>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <center><div class="paginateButtons" style="margin-top: 30px;">
            <g:paginate total="${mascotasCount}" max="5"/>

        </div></center>
    </div>

</div>

</div>
<input type="hidden" id="firstEncuentro" name="firstEncuentro" value="false"/>
<input type="hidden" id="mascotaIdEncuentro" name="mascotaIdEncuentro" value="${mascotaIdEncuentro}"/>
<script>

    $('[data-toggle=confirmation]').confirmation({
        focusout: false,
        rootSelector: '[data-toggle=confirmation]',
        title:"¿Realizar Busqueda?",
        onConfirm: function(value) {
            var id = $(this).attr('data-id');
            window.location.href = "/encuentro/busqueda/"+id;
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
</script>
</body>
</html>


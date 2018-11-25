<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="not-list-notificationcircle.css"/>
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



    /*test*/
    .wrap { padding: 15px; }
    h1 { font-size: 28px; }
    h4,
    modal-title { font-size: 18px; font-weight: bold; }

    .no-borders { border: 0px; }
    .body-message { font-size: 18px; }
    .centered { text-align: center; }
    .btn-primary { background-color: #2086c1; border-color: transparent; outline: none; border-radius: 8px; font-size: 15px; padding: 10px 25px; }
    .btn-primary:hover { background-color: #2086c1; border-color: transparent; }
    .btn-primary:focus { outline: none; }
    h3.popover-header {
        font-size: 15px;
    }
</style>
</head>
<body>

<div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: 800px;display: block; justify-content: center; align-items: center">
    <center>
        <div class="hero text-block-label" style="margin-top:5px">
            <label style="margin-top: 90px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
            <g:if test="${encuentros.encuentro.isEmpty()}">
                <p>¡Todavia no Tienes un ENCUENTRO acertado!</p>
                <p>¡Sigue realizando busquedas, quizas hoy tengas suerte!.</p>
            </g:if>
            <g:else>
                <p>¡Ya puedes establecer converzaciones con tus encuentros!!</p>
                <p>¡Solo presiona sobre el:<i style="color: #00b400" class="far fa-comments fa-2x"></i>!.</p>
                <br>
                <p>¡Cuando quieras dar por finalizado solo presiona: <i style="color: #cd5c5c" class="fas fa-power-off fa-2x"></i>!!</p>
            </g:else>
            </label>
        </div>
    </center>
    <center>
        <div style="padding-top: 20px">
            <h2><span style="padding-left: 40px">Selecciona un Candidato</span> <span><i style="padding-left: 100px" class="fas fa-arrow-down"></i></span></h2>

        </div>
    </center>
    <div id="div_con_encuentros" name="div_con_mascota" class="container container-label align-self-start login-form" style="width: 800px;display: block; justify-content: center; align-items: center;height: 415px;">
        <table class="table table-striped dots">
            <thead>
            <tr>
                <th><i class="fa fa-paw fa-2x"></i></th>
                <th>Nombres</th>
                <th>Edades</th>
                <th>Raza</th>
                <th>Fecha</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
                <g:each in="${encuentros}" var="encuentro" status="counter">
                    <g:if test="${encuentros.encuentro.findAll {it.mascotaOwner.id == encuentro.encuentro.mascotaOwner.id}}">
                        <tr class="dots">
                        <td scope="row"></td>
                        <td>${encuentro.encuentro.mascotaOwner.nombre} <i class="fas fa-heart" style="color: indianred"></i> ${encuentro.encuentro.mascotaFind.nombre}</td>
                        <td>${new Date().format('YYYY').toLong() - encuentro.encuentro.mascotaOwner.fechaNacimiento.format('YYYY').toLong()} - ${new Date().format('YYYY').toLong() - encuentro.encuentro.mascotaFind.fechaNacimiento.format('YYYY').toLong()}</td>
                        <td>${encuentro.encuentro.mascotaOwner.raza.descripcion}</td>
                            <td>${encuentro.encuentro.fechaCreacion.format('dd/mm/YYYY')}</td>
                        <g:if test="${encuentro.chat != null && encuentro.chat.contador != 0}">
                        <td class="dots" style="font-size: 20px;width: 150px;">
                            <span style="color:green" data-toggle="matched" data-popout="true" data-id="${encuentro.encuentro.mascotaOwner.id}" data-encuentro="${encuentro.encuentro.id}" data-is-chat="true" data-chat="${encuentro.chat.id}" style="font-size: 18px; color: indianred; cursor: pointer">
                                <a href="#">
                                    <i style="font-size: 20px;color: #00b400;padding-left: 15px" class="far fa-comments"></i>
                                        <span class="glyphicon glyphicon-envelope">
                                            <mark class="big swing">${encuentro.chat.contador}</mark>
                                        </span>
                                </a>
                            </span>
                            <span data-toggle="finalizar" data-popout="true" data-id="${encuentro.encuentro.id}" style="font-size: 18px; color: indianred; cursor: pointer;margin-left: 15px;"><i class="fas fa-power-off" style="color: indianred"></i></span>
                        </td>
                        </g:if>
                            <g:else>
                                <td class="dots" style="font-size: 20px;width: 150px;">
                                    <span style="color:green" data-toggle="matched" data-popout="true" data-id="${encuentro.encuentro.mascotaOwner.id}" data-encuentro="${encuentro.encuentro.id}" data-is-chat="false" style="font-size: 18px; color: indianred; cursor: pointer">
                                        <a href="#">
                                            <i style="font-size: 20px;color: #00b400;padding-left: 15px" class="far fa-comments"></i>
                                            <font style="color:green">Chat</font>
                                        </a>

                                    <span data-toggle="finalizar" data-popout="true" data-id="${encuentro.encuentro.id}" style="font-size: 18px; color: indianred; cursor: pointer">
                                        <i class="fas fa-power-off" style="color: indianred"></i>
                                    </span>
                                </td>
                            </g:else>
                    </tr>

                    </g:if>
                </g:each>
            </tbody>
        </table>
        <center><div class="paginateButtons" style="margin-top: 30px;">
            <g:paginate total="${encuentrosCount}" max="5"/>

        </div></center>
    </div>

</div>

</div>
<button id="modal-chat" name="modal-chat" style="display: none" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-new">
    open modal
</button>

<div id="modal" class="modal fade bs-example-modal-new" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

    <div id="modal-data">

    </div>

</div>

<script>
    $('[data-toggle=matched]').confirmation({
        focusout: false,
        rootSelector: '[data-toggle=matched]',
        title:"¿Empezar a Chatear?",
        onConfirm: function(value) {
            var id = $(this).attr('data-id');
            var encuentroId = $(this).attr('data-encuentro');
            var dataParams = 'encuentro='+encuentroId
            var isChat =  $(this).attr('data-is-chat');
            if(isChat == "true") {
                dataParams = dataParams+'&chat='+$(this).attr('data-chat');
            }
            jQuery.ajax({
                type:'GET',
                data: dataParams,
                url:'/encuentro/chat',
                success:function(data,textStatus)
                {
                    $("#modal-data").html(data);
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){
                        window.location.href = "/home";
                    }
            });

            $("#modal-chat").click();
        },
        buttons: [
            {
                class: 'btn btn-success',
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

    $('[data-toggle=finalizar]').confirmation({
        focusout: false,
        rootSelector: '[data-toggle=finalizar]',
        title:"¿Dar por finalizado el Encuentro?",
        onConfirm: function(value) {
            var id = $(this).attr('data-id');
            jQuery.ajax({
                type:'GET',
                data: "encuentroId="+id,
                url:'/encuentro/finalizar',
                success:function(data,textStatus)
                {
                    window.location.href = "/encuentro/concretados";
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){
                        window.location.href = "/home";
                    }
            });

        },
        buttons: [
            {
                class: 'btn btn-danger',
                iconClass: 'confirm fas fa-power-off',
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


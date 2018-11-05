
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <title>Amor de Mascotas</title>

    <style>
    .carousel {
        padding: 0 70px;
    }
    .carousel .item {
        color: #999;
        font-size: 14px;
        text-align: center;
        overflow: hidden;
    }
    .carousel .item .img-box {
        width: 135px;
        height: 135px;
        margin: 0 auto;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 50%;
    }
    .carousel .img-box img {
        width: 100%;
        height: 100%;
        display: block;
        border-radius: 50%;
    }

    .carousel .img-carousel img {
        width: 100%;
        height: 100%;
        display: block;
        border-radius: 50%;
    }
    .img-carousel img {
        width: 100%;
        height: 100%;
        display: block;
        border-radius: 50%;
    }
    .carousel .carousel-control {
        width: 40px;
        height: 40px;
        margin-top: -20px;
        top: 50%;
        background: none;
    }
    .carousel-control i {
        font-size: 68px;
        line-height: 42px;
        position: absolute;
        display: inline-block;
        color: rgba(0, 0, 0, 0.8);
        text-shadow: 0 3px 3px #e6e6e6, 0 0 0 #000;
    }
    .carousel-indicators li, .carousel-indicators li.active {
        width: 10px;
        height: 10px;
        margin: 1px 3px;
        border-radius: 50%;
    }
    .carousel-indicators li {
        background: #45396c;
        border-color: transparent;
        box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
    }
    .carousel-indicators li.active {
        background: #999;
        box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
    }

    .carousel-indicators{
        position: relative;
        margin-top: 30px;
    }

    .fa-heart {
        color: #ef775f;
    }

    .fa-times {
        color: #878c91;
    }

    .fa-refresh {
        color: #ACF9D4;
    }

    .button {
        display: inline-block;
        border-radius: 4px;
        background-color: #0285CD;
        border: none;
        border-bottom: 2px solid #00679f;
        max-height: 60px;
        max-width: 180px;
        color: #FFFFFF;
        text-align: center;
        font-size: 18px !important;
        font-family: "Bliss 2","Helvetica Neue","Roboto",Arial,sans-serif;
        padding-top: 1rem;
        padding-bottom: 1rem;
        padding-right: 1.5rem;
        padding-left: 1.5rem;
        transition: all 0.5s;
        cursor: pointer;
        text-decoration: none;
    }

    .button span {
        cursor: pointer;
        display: inline-block;
        position: relative;
        transition: 0.5s;
    }

    .button-approved:hover {
        background-color: #dee2e6;
    }
    .carousel.slide {
        width: 350px;
        margin-top: 20px;
    }

    .color-hembra {
        background-color: #f5c6cb;
    }

    .color-macho {
        background-color: #9dc1d3;
    }

    #div_test {
        transition: transform 1s linear;
        transform-origin: top left;
        transform-style: preserve-3D;
    }

    #like:hover {
        color: red;
    }

    #notLike:hover {
        color: black;
    }

    .box-rotate-derecha {
        transform: rotate(-180deg);
    }
    .box-rotate-izquierda {
        transform: rotate(180deg);
    }

    .like {
        border-radius: 5px;
        padding: 5px 10px;
        border: 2px solid green;
        color: green;
        text-transform: uppercase;
        font-size: 15px;
        position: absolute;
        top: 10px;
        right: 69%;
        text-shadow: none;
    }
    .dislike {
        border-radius: 5px;
        padding: 5px 10px;
        border: 2px solid red;
        color: red;
        text-transform: uppercase;
        font-size: 15px;
        position: absolute;
        top: 10px;
        left: 66%;
        text-shadow: none;
    }

        /*TEST*/
    #container {
        width: 500px;
        margin: auto !important;
        display: block;
        height: 500px;
        position: relative;
        list-style-type: none;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .rotate-left {
        transform: rotate(30deg) scale(0.8);
        transition: 1s;
        margin-left: 400px;
        cursor: e-resize;
        opacity: 0;
        z-index: 10;
    }
    .rotate-right {
        transform: rotate(-30deg) scale(0.8);
        transition: 1s;
        opacity: 0;
        margin-left: -400px;
        cursor: w-resize;
        z-index: 10;
    }
    .avatar {
        background: #222;
        width: 340px;
        height: 340px;
        display: block;
        margin-top: 10px;
        margin-left: 10px;
        background-size: auto 160% !important;
        background-position: center;
        background-repeat: no-repeat;
    }
        .conteiner-test{
            width: 50%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

    li {
        list-style-type: none;
    }
    </style>
</head>
<body>

<center><div class="conteiner-test">
    <div style="padding-top: 10px;margin-top: 20px;">
        <div id="img_div" style="display: block; padding-bottom: 30px;">
            <div class="tab">
                <div class="mx-auto" style="width: 500px;margin-top: 20px;margin-left: -160px;height: 110px;">
                    <legend style="margin-left: 0px;">
                        <ul class="list-inline color-${mascotaOwner.sexo}">
                            <li class="list-inline-item">
                                <div id="carouselExampleFadeOwner" class="carousel slide carousel-fade" data-ride="carousel" style="margin-left: -250px">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <g:if test="${imagenesOwner[0].nombre != 'default'}">
                                                <div class="img-carousel" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesOwner[0].id])}" alt=""></div>
                                            </g:if>
                                            <g:else>
                                                <div class="img-carousel" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                            </g:else>
                                        </div>
                                        <div class="carousel-item ">
                                            <g:if test="${imagenesOwner[1].nombre != 'default'}">
                                                <div class="img-carousel" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesOwner[1].id])}" alt=""></div>
                                            </g:if>
                                            <g:else>
                                                <div class="img-carousel" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                            </g:else>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-inline-item" style="margin-left: -110px;position: absolute;margin-top: 15px;">
                                <h3>La mejor opcion para:</h3><h2>${mascotaOwner.nombre}</h2>
                            </li>
                        </ul>
                    </legend>
                </div>
            </div>
        </div>

        <div id="div_test" class="buddy" style="cursor: crosshair;">

        </div>
    </div>
</div></center>
<script>
    function buscarAjax() {
        jQuery.ajax({
            type:'GET',
            data:'mascotaId=' + ${mascotaOwner.id},
            url:'/encuentro/encuentroBusquedaAjax',
            success:function(data,textStatus)
            {
                $("#div_test").html(data);
            },
            error:
                function(XMLHttpRequest,textStatus,errorThrown){
                    window.location.href = "/home";
                }
        });
    };

    $("#carouselExampleFadeOwner").carousel({
        pause: true, // don't forget the colon here, it's an object
        interval: true,
        wrap: true,
        ride: true,
        interval: 1000 * 2
    })

    buscarAjax();


    /*END*/
</script>

</body>
</html>
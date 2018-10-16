
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>
    <title>Amor de Mascotas</title>

    <style>
    .carousel {
        margin: 50px auto;
        padding: 0 70px;
    }
    .carousel .item {
        color: #999;
        font-size: 14px;
        text-align: center;
        overflow: hidden;
        min-height: 290px;
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
    .carousel .testimonial {
        padding: 30px 0 10px;
    }
    .carousel .overview {
        font-style: italic;
    }
    .carousel .overview b {
        text-transform: uppercase;
        color: #7AA641;
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
    .carousel .carousel-indicators {
        bottom: -40px;
    }
    .carousel-indicators li, .carousel-indicators li.active {
        width: 10px;
        height: 10px;
        margin: 1px 3px;
        border-radius: 50%;
    }
    .carousel-indicators li {
        background: #999;
        border-color: transparent;
        box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
    }
    .carousel-indicators li.active {
        background: #555;
        box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
    }

    .tinder-header {
        display: block;
        margin-top: 20px;
        margin-bottom: 20px;
        align-self: center;
        height: 18vh;
        padding-bottom: 10px;
        z-index: 5;
    }

    .tinder {
        width: 100vw;
        height: 100vh;
        max-height: 680px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        position: relative;
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
    }

    .loaded.tinder {
        opacity: 1;
    }

    .tinder--status {
        position: absolute;
        top: 50%;
        margin-top: -30px;
        z-index: 3;
        width: 100%;
        text-align: center;
        pointer-events: none;
    }

    .tinder--status i {
        font-size: 100px;
        opacity: 0;
        transform: scale(0.3);
        transition: all 0.2s ease-in-out;
        position: absolute;
        width: 100px;
        margin-left: -50px;
    }

    .tinder_love .fa-heart {
        opacity: 0.7;
        transform: scale(1);
    }

    .tinder_nope .fa-remove {
        opacity: 0.7;
        transform: scale(1);
    }

    .tinder--cards {
        flex-grow: 16;
        padding-top: 15vh;
        text-align: center;
        display: flex;
        justify-content: center;
        z-index: 1;
        pointer-events: auto;
    }

    .tinder--card {
        display: inline-block;
        width: 90vw;
        max-width: 400px;
        background: #0285CD;
        color: #FFFFFF;
        padding-bottom: 16px;
        border-radius: 8px;
        overflow: hidden;
        position: absolute;
        will-change: transform;
        transition: all 0.3s ease-in-out;
        cursor: -webkit-grab;
        cursor: -moz-grab;
        cursor: grab;
    }

    .moving.tinder--card {
        transition: none;
        cursor: -webkit-grabbing;
        cursor: -moz-grabbing;
        cursor: grabbing;
    }

    .tinder--card img {
        max-width: 100%;
        pointer-events: none;
    }

    .tinder--card h3 {
        margin-top: 12px;
        font-size: 32px;
        padding: 0 16px;
        pointer-events: none;
    }

    .tinder--card p {
        margin-top: 24px;
        font-size: 20px;
        padding: 0 16px;
        pointer-events: none;
    }

    .tinder--buttons {
        flex: 0 0 100px;
        text-align: center;
        padding-top: 20px;
        z-index: 2;
    }

    .tinder--buttons button {
        border-radius: 50%;
        line-height: 60px;
        width: 60px;
        border: 0;
        background: #FFFFFF;
        display: inline-block;
        margin: 0 8px;
    }

    .tinder--buttons button:focus {
        outline: 0;
    }

    .tinder--buttons i {
        font-size: 32px;
        vertical-align: middle;
    }

    .fa-heart {
        color: #FFACE4;
    }

    .fa-remove {
        color: #CDD6DD;
    }

    .fa-refresh {
        color: #ACF9D4;
    }

    .tinder-result-button {
        display: block;
        position: absolute;
        text-align: center;
        align-self: center;
        justify-content: center;
        align-items: flex-start;
        z-index: 0;
    }

    .tinder-result-button h3 {
        font-size: 32px;
        padding: 32px 16px;
        color: #0285CD;
        max-width: 380px;
    }

    .tinderresult {
        padding-top: 10vh;
        text-align: center;
        align-self: center;
        justify-content: center;
        align-items: flex-start;
        width: 90vw;
        max-width: 400px;
        background: #FFFFFF;
        color: #0285CD;
        padding-bottom: 40px;
        z-index: 1;
        position: absolute;
        transition: all 1.3s ease-in-out;
        display: none;
    }

    .tinder-result img {
        max-width: 100%;
        max-height: 50vh;
        padding: 10%;
        pointer-events: none;
    }

    .tinder-result h3 {
        margin-top: 32px;
        font-size: 32px;
        padding: 0 16px;
        pointer-events: none;
    }

    .tinder-result p {
        font-size: 20px;
        padding: 0 16px;
        pointer-events: none;
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

    </style>
</head>
<body>
<div class="tab">
    <div class="mx-auto" style="width: 500px; background-color: #f8f9fa; margin-top: 20px">
        <!-- Form Name -->
        <legend style="    margin-left: 20px;">
            <center><img style="height: 70px;width: 70px" src="${resource(dir: 'images', file: 'dog-heart.png')}" alt="">
            <label style="font-size: 20px">Encuentra la mejor Opcion para:</label>
            <label style="color: black; font-size: 25px"> ${mascotaOwner.nombre}</label></center>
        </legend>
        <legend>
            <center>
                <g:if test="${imagenesOwner[0].nombre != 'default'}">
                    <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesOwner[0].id])}"  alt="add a photo" id="img1" name="img1" class="ImageOnPreview">
                </g:if>
                <g:if test="${imagenesOwner[1].nombre != 'default'}">
                    <img  src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesOwner[1].id])}"  alt="add a photo" id="img2" name="img2" class="ImageOnPreview">
                </g:if>
            </center>
        </legend>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-center m-auto">
                    <div id="sinMyCarousel" class="carousel slide" style="margin: 0;" data-ride="carousel">
                        <!-- Wrapper for carousel items -->
                        <div class="carousel-inner" style="height: 300px">
                            <div class="item carousel-item active">
                                <g:if test="${imagenesFind[0].nombre != 'default'}">
                                    <div class="img-box" style="margin-top: 80px;"><img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesFind[0].id])}" alt=""></div>
                                </g:if>
                                <g:else>
                                    <div class="img-box" style="margin-top: 80px;"><img src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                </g:else>
                            </div>
                            <div class="item carousel-item">
                                <g:if test="${imagenesFind[1].nombre != 'default'}">
                                    <div class="img-box" style="margin-top: 80px;"><img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesOwner[1].id])}" alt=""></div>
                                </g:if>
                                <g:else>
                                    <div class="img-box" style="margin-top: 80px;"><img src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                </g:else>
                            </div>
                        </div>
                        <!-- Carousel controls -->
                        <a class="carousel-control left carousel-control-prev" href="#sinMyCarousel" data-slide="prev" style="margin-top: -20%;">
                            <i style="color:black" class="fa fa-angle-left fa-2x"></i>
                        </a>
                        <a class="carousel-control right carousel-control-next" href="#sinMyCarousel" data-slide="next" style="margin-top: -20%;">
                            <i style="color:black" class="fa fa-angle-right fa-2x"></i>
                        </a>
                        <label style="color: black; font-size: 25px"> ${mascotaFind.nombre}</label></center>
                        <center><div style="padding-bottom: 15px;padding-bottom: 20px;margin-bottom: 40px;" class="tinder--buttons">
                            <button id="nope" class="button-approved"><i class="fa fa-times"></i></button>
                            <button id="love" class="button-approved"><i class="fa fa-heart"></i></button>
                        </div></center>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    $('.carousel').carousel({
        interval: 8000
    })
</script>
</body>
</html>
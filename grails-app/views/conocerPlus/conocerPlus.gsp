<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
    body {
        font-family: "Open Sans", sans-serif;
    }

    div.hero{
        background: url('/assets/carrusel/hero_01.jpg') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
    h2 {
        color: #333;
        text-align: center;
        text-transform: uppercase;
        font-family: "Roboto", sans-serif;
        font-weight: bold;
        position: relative;
        margin: 30px 0 60px;
    }
    h2::after {
        content: "";
        width: 100px;
        position: absolute;
        margin: 0 auto;
        height: 3px;
        background: #8fbc54;
        left: 0;
        right: 0;
        bottom: -10px;
    }
    .col-center {
        margin: 0 auto;
        float: none !important;
    }
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
    </style>
</head>
<body>
<div class="ui text container hero" style="height: 400px">
        <div style="margin-left: 20px; margin-top: 40px">
            <label style="color:white;margin-top: 50px;width: 300px;font-style: italic;">Nace una forma nueva de emprender amistades<p>Una web pensada especialente para nuestras Mascotas</p> </label>
            <p><a href="/registration" style="color: white"><div class="btn btn-primary button">Empezar Ahora <i class="fa fa-arrow-right fa-1x"></i></div></a></p>
        </div>
</div>
<div class="container" style="width: 900px;">
<!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">Simple y facíl de empezar. <p><span class="text-muted">Completamente gratis.</span></p></h2>
            <p class="lead">Dedicada a personas que transmiten su amor a sus mascotas y que esten dispuestas a demostrar su cariño a todo el mundo.</p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="/assets/carrusel/carrusel_3.jpg" alt="500x500" style="width: 400px; height: 300px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22500%22%20height%3D%22500%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20500%20500%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_164d879e2db%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_164d879e2db%22%3E%3Crect%20width%3D%22500%22%20height%3D%22500%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22185.125%22%20y%3D%22261.1%22%3E500x500%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-5 pull-md-7">
            <img class="featurette-image img-fluid mx-auto" src="/assets/carrusel/mascotas.jpg" alt="500x500" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22500%22%20height%3D%22500%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20500%20500%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_164d879e2df%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_164d879e2df%22%3E%3Crect%20width%3D%22500%22%20height%3D%22500%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22185.125%22%20y%3D%22261.1%22%3E500x500%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 400px; height: 300px;">
        </div>
        <div class="col-md-7 push-md-5">
            <h2 class="featurette-heading">Encuentra su pareja.<p><span class="text-muted">Crea lazos de amistad. </span></p></h2>
            <p class="lead">Encuentra la pareja ideal para tu mascota, contacta con su dueño y genera nuevas amistades que compartan tu amor por las mascotas.</p>
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">Distinta a otras redes. <p><span class="text-muted">eje central tu mascota.</span></p></h2>
            <p class="lead">Hasta ahora no existía una RED donde el punto central sean las mascotas. El objetivo principal es conectar a las personas que tengan un gusto similar por nuestras mascotas, y poder encontrar la pareja ideal para ellos..</p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="/assets/carrusel/carrusel_04.jpg" alt="500x500" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22500%22%20height%3D%22500%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20500%20500%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_164d879e2e1%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A25pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_164d879e2e1%22%3E%3Crect%20width%3D%22500%22%20height%3D%22500%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22185.125%22%20y%3D%22261.1%22%3E500x500%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 400px; height: 300px;">
        </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->
</div><!-- /.container -->


<div class="container">
    <div class="row">
        <div class="col-md-8 col-center m-auto">
            <h2>Testimoniales</h2>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Carousel indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for carousel items -->
                <div class="carousel-inner">
                    <div class="item carousel-item active">
                        <div class="img-box"><img src="${resource(dir: 'images', file: 'testimonial1.jpg')}" alt=""></div>
                        <p class="testimonial">Realmente funciona, consegui pareja para mi perra Catia, es muy facil empezar a utilizar, y muy útil para contactar con personas.</p>
                        <p class="overview"><b>Natalia Sanchez</b>, junto a su golden Catia.</p>
                    </div>
                    <div class="item carousel-item">
                        <div class="img-box"><img src="${resource(dir: 'images', file: 'testimonial2.jpg')}" alt=""></div>
                        <p class="testimonial">Todavia no tuve suerte, pero no pierdo las esperanzas de conseguirle novia a mi Labrador Thor. Es muy divertido poder conocer gente con mis mismos gustos y cariño por los perros.</p>
                        <p class="overview"><b>Debora Dominguez</b>, junto a su labrador Thor</p>
                    </div>
                    <div class="item carousel-item">
                        <div class="img-box"><img src="${resource(dir: 'images', file: 'testimonial3.jpg')}" alt=""></div>
                        <p class="testimonial">Las opciones de filtro para las busquedas hacen que sea realmente facíl encontrar un novio para mi Caniche Lula.</p>
                        <p class="overview"><b>Andrea Santillan</b>,junto a su canciche Maxima</p>
                    </div>
                </div>
                <!-- Carousel controls -->
                <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>


</body>
</html>



</body>
</html>
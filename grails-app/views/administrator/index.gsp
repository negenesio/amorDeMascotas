<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="login.css"/>

    <style>
    div.hero {
        background: url('/assets/carrusel/schnauzer_gris.png');
        background-size: cover;
        width: 600px;
        height: 300px
    }
    </style>
    <title>Amor de Mascotas</title>
</head>
<body>
<div id="div_recovery_password_user" name="div_recovery_password_user" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center">
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
</body>
</html>
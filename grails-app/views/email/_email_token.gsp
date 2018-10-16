<html>
<header>
    <style>
    fieldset {
        width: 450px;
        margin-left: 30px;
    }
    .login-form{
        background-color: #f8f9fa;
        width: 600px;
        margin-top: 20px;
    }
    div.form-group.has-feedback.has-error input {
        border-color: #cd4025;
    }
    #registration_form > div.form-group.has-feedback.has-error > small {
        color: green;
    }

    #registration_form > fieldset > div.form-group.has-feedback.has-success > div > i {
        margin-top: 7px;
    }

    #registration_form > fieldset > div.form-group.has-feedback.has-error > div > i {
        margin-top: 7px;
    }
    .add-on .input-group-btn > .btn {
        border-left-width:0;left:-2px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    }
    /* stop the glowing blue shadow */
    .add-on .form-control:focus {
        box-shadow:none;
        -webkit-box-shadow:none;
        border-color:#cccccc;
    }
    legend {
        height: 50px;
        line-height: 50px;
        padding: 0 0 0 60px;
    }
    </style>
</header>
<body>
<div id="div_index" name="div_index" class="container align-self-start login-form" style="display: block; justify-content: center; align-items: center; width: 600px; height: 300px">
    <fieldset style="display: flex; justify-content: center; align-items: center">

        <span><div>
            <img style="width: 60px; height: 60px; margin-left: -185px; margin-top: -10px;" src="cid:springsourceInlineImage"/>
            <label style="font-size: 20px"><b>Amor de Mascotas</b></label>
        </div>
        </span>
        <h3> Codigo de Seguridad - Recuperacion de Contraseña </h3>
        <h4>Usuario: ${username}</h4>
        <label>Codigo de Seguridad: <b style="font-size: 20px">${token}</b></label>
        <a href="http://localhost:8080/recovery-password-token/${username}/${token}"><h3>¡Haga click aqui para validar su cuenta!</h3></a>
        <br>
    </fieldset>
</div>
</body>
</html>

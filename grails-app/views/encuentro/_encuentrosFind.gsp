<g:if test="${mascotaFind}">
    <div id="div_find_encuentro">
        <div id="div_find" style="display: block">
            <div class="tab">
                <div class="mx-auto" style="width: 500px;margin-top: 20px;margin-left: -160px;height: 110px;">
                    <legend style="margin-left: 0px;">
                        <ul class="list-inline color-${mascotaFind.sexo}">
                            <li class="list-inline-item">
                                <div id="carouselExampleFadeFind" class="carousel slide carousel-fade" data-ride="carousel" style="margin-left: -250px;">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <g:if test="${imagenesFind[0].nombre != 'default'}">
                                                <div class="img-carousel test-rotation" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesFind[0].id])}" alt=""></div>
                                            </g:if>
                                            <g:else>
                                                <div class="img-carousel test-rotation" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                            </g:else>
                                        </div>
                                        <div class="carousel-item ">
                                            <g:if test="${imagenesFind[1].nombre != 'default'}">
                                                <div class="img-carousel test-rotation" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagenesFind[1].id])}" alt=""></div>
                                            </g:if>
                                            <g:else>
                                                <div class="img-carousel test-rotation" style="margin-top: 10px;width: 110px;height: 110px"><img style="width: 110px;height: 110px" src="${resource(dir: 'images', file: 'dog_profile.png')}" alt=""></div>
                                            </g:else>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-inline-item" style="margin-left: -80px;position: absolute;margin-top: 40px;">
                                <h3>Te presentamos a: </h3><h2>${mascotaFind.nombre}</h2>
                            </li>
                            <div class="carousel-indicators">
                                <li id="control-find-first" data-target="#carouselExampleFadeFind" data-slide-to="0" class="control-indicator active" onclick="firstControl();"></li>
                                <li id="control-find-second" data-target="#carouselExampleFadeFind" data-slide-to="1" class="control-indicator" onclick="secondControl();"></li>
                            </div>
                            <g:if test="mascotaFind.descripcion">
                                <center><textarea style="resize:none; width: 90%; flex: none" name="descripcion" maxlength="140" class="form-control" id="exampleTextarea" rows="3" readonly name="descripcion"> ${mascotaFind.descripcion}</textarea></center>
                            </g:if>
                        </ul>
                        <br>
                    </legend>
                </div>
            </div>
        </div>

        <div id="div_encuentro" style="display: block;margin-top: 150px;">
            <div class="tab">
                <div class="mx-auto" style="width: 500px;margin-top: -15px;margin-left: -160px;height: 110px;">
                    <legend style="margin-left: 0px;">
                        <center><ul class="list-inline color-${mascotaFind.sexo}" style="height: 90px;">
                            <li class="list-inline-item" style="margin-top: 30px">
                                <i id="like" style="margin-left: -80px" class="fa fa-heart fa-2x pull-left" aria-hidden="true" onclick="likeAjax();"></i>
                            </li>
                            <li class="list-inline-item">
                                <i id="notLike" style="margin-right: -80px" class="fa fa-times fa-2x pull-left" aria-hidden="true" onclick="notLikeAjax();"></i>
                            </li>
                        </ul></center>
                    </legend>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div id="div_sin_mascota" name="div_sin_mascota" class="container container-label align-self-start login-form" style="width: 700px;display: block; justify-content: center; align-items: center">
        <center>
            <div class="hero text-block-label" style="margin-top:10px;height: 150px;">
                <label style="margin-top: 25px; color: white; background: rgba(0, 0, 0, 0.6); font-size: 20px" class="font-weight-bold">
                    <p>No pudimos encontrar ninguna mascota por ahora.</p>
                    <p>Puedes probar suerte en cualquier momento!.</p>
                </label>
            </div>
        </center>
    </div>
</g:else>
<div class="status like" style="display: none">Me Gusta!</div>
<div class="status dislike" style="display: none">No me Gusta!</div>
<script>
    function firstControl(){
        $("#control-find-first").removeClass("active");
        $("#control-find-second").addClass("active");
    }

    function secondControl(){
        $("#control-find-second").removeClass("active");
        $("#control-find-first").addClass("active");
    }

    $(document).ready(function() {
        var isMatched = "${isMatched}";
        if(isMatched == "true"){
            window.location.href = "/encuentro/busqueda/"+${mascotaOwner?.id};
        }
        $("#carouselExampleFadeFind").carousel({
            pause: true, // don't forget the colon here, it's an object
            interval: true,
            wrap: true,
            ride: true,
            interval: 1000 * 2
        })

    });

    function likeAjax() {
        $("#div_find_encuentro").toggleClass('rotate-right').delay(700).fadeOut(1);
        jQuery.ajax({
            type:'GET',
            data:'mascotaId=' + ${mascotaOwner?.id} + '&encuentroLike=' + ${encuentrosReciente?.id},
            url:'/encuentro/encuentroBusquedaAjax',
            success:function(data,textStatus)
            {
                console.log("exito, al darle like ");
                setTimeout(function() {
                    likedelaySuccess(data);
                }, 800);
            },
            error:
                function(XMLHttpRequest,textStatus,errorThrown){
                    window.location.href = "/home";
                }
        });
    }
    /*function likeAjax() {
        $("#div_test").toggleClass('box-rotate-izquierda');
        setTimeout(function() {
            likedelaySuccess();
        }, 800);
    }*/
    function notLikeAjax() {
        $("#div_find_encuentro").toggleClass('rotate-left').delay(700).fadeOut(1);
        //$("#div_test").slideUp( 300).delay( 800 ).slideDown( 400 );
        //$("#div_encuentro").slideUp( 300).delay( 800 ).slideDown( 400 );
        jQuery.ajax({
            type:'GET',
            data:'mascotaId=' + ${mascotaOwner?.id} + '&encuentroNotLike=' + ${encuentrosReciente?.id},
            url:'/encuentro/encuentroBusquedaAjax',
            success:function(data,textStatus)
            {
                console.log("exito, al darle not_like")
                setTimeout(function() {
                    notLikedelaySuccess(data);
                }, 800);
            },
            error:
                function(XMLHttpRequest,textStatus,errorThrown){
                    window.location.href = "/home";
                }
        });
    };

    function likedelaySuccess(data){
        $("#div_find_encuentro").toggleClass('rotate-right');
        $("#div_find_encuentro").show()
        $("#div_test").html(data);
    }

    function notLikedelaySuccess(data){
        $("#div_find_encuentro").toggleClass('rotate-left');
        $("#div_find_encuentro").show()
        $("#div_test").html(data);
    }

    $( "#like" ).mouseenter(function() {
            $(".status.like").show();

        })
        .mouseleave(function() {
            $(".status.like").hide();
        });

    $( "#notLike" ).mouseenter(function() {
        $(".status.dislike").show();

    })
            .mouseleave(function() {
                $(".status.dislike").hide();
            });
</script>
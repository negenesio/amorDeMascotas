
<div class="modal-dialog">

    <!-- Modal Content: begins -->
    <div class="modal-content" style="width: 535px;">

        <!-- Modal Header -->
        <div class="modal-header">
            <center><b><h4 style="padding-left: 150px;font-size: 20px" class="modal-title" id="gridSystemModalLabel"> ${encuentro.mascotaOwner.nombre} <i class="fas fa-heart" style="color: indianred"></i> ${encuentro.mascotaFind.nombre}</h4></b></center>
        </div>

        <!-- Modal Body -->
        <div class="modal-body">
    <div id="chatMessages" style="width:500px;height:auto;min-height: 150px;background-color: #f3f2f2;"></div>
    <input type="text" id="messageBox" style="width: 350px;margin-top: 10px" name="message" onkeypress="messageKeyPress(this,event);"/><button id="send-message" class="btn-success" style="margin-left: 5px">Enviar</button>
    <div id="temp"></div>
    <script>
        $("#send-message").click(function(){
            var message = $('#messageBox').val();
            if(message != '') {
                jQuery.ajax({
                    type:'GET',
                    data:'message='+message+'&encuentro='+${encuentro.id},
                    url:'/encuentro/chat/enviar-mensaje',
                    success:function(data,textStatus)
                    {
                        $("#temp").html(data);
                    },
                    error:
                        function(XMLHttpRequest,textStatus,errorThrown){
                            console.log(errorThrown);
                        }
                });
                $('#messageBox').val('');
            }

            $('#messageBox').focus();

        });
        function messageKeyPress(field,event) {
            var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
            var message = $('#messageBox').val();
            if (theCode == 13 && message != ''){
                jQuery.ajax({
                    type:'GET',
                    data:'message='+message+'&encuentro='+${encuentro.id},
                    url:'/encuentro/chat/enviar-mensaje',
                    success:function(data,textStatus)
                    {
                        $("#temp").html(data);
                    },
                    error:
                        function(XMLHttpRequest,textStatus,errorThrown){
                            console.log(errorThrown);
                        }
                });
                $('#messageBox').val('');
                $('#messageBox').focus();
                return false;
            } else {
                $('#messageBox').focus();
                return true;
            }
        }

        function retrieveLatestMessages() {
            jQuery.ajax({
                type:'GET',
                data:'encuentro='+${encuentro.id},
                url:'/encuentro/chat/obtener-mensaje',
                success:function(data,textStatus)
                {
                    $("#chatMessages").html(data);
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){
                        console.log("error "+errorThrown)
                    }
            });
        }

        function pollMessages() {
            retrieveLatestMessages();
            setTimeout('pollMessages()', 5000);
        }
        pollMessages();

    </script>
        </div>

        <!-- Modal Footer -->
        <div class="modal-footer">
            <button id="cerrar_modal" type="button" class="btn btn-primary" data-dismiss="modal">Salir</button>
        </div>

    </div>
    <!-- Modal Content: ends -->

</div>
<script>
    $("#cerrar_modal").click(function() {
        window.location.href = "/encuentro/concretados";
    });
</script>
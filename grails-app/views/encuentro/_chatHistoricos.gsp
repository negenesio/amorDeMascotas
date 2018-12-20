
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
    <script>
        function retrieveLatestMessages() {
            jQuery.ajax({
                type:'GET',
                data:'encuentro='+${encuentro.id},
                url:'/encuentro/chat/obtener-mensaje-historicos',
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

        retrieveLatestMessages();
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
        window.location.href = "/encuentro/historicos";
    });
</script>
<div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">Mensaje nuevo</h3>
            </div>
            <div class="modal-body">
                <form name="for" action="controlador.jsp" method="POST">
                    <p><input type="email" name="correo" class="w-100" placeholder="Para"></p>
                    <p><input type="text" name="asunto" class="w-100" placeholder="Asunto"></p>
                    <textarea name="cuerpo" rows="10" class="w-100" placeholder="Cuerpo"></textarea><br>
                    <input class="btn btn-info" type="submit" name="enviar" value="Enviar">
                </form>
            </div>
        </div>
    </div>
</div>

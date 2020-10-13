<div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Loguin</h4>
            </div>
            <div class="modal-body">
                <form name="for" action="controlador.jsp" method="POST">
                        <p>Nombre <input type="text" name="usuario" placeholder="usuario">
                        <p>Contraseña <input type="password" name="contrasena" placeholder="contraseña"></p>
                        <p><a href="recuperar.jsp">recuperar contraseña</a></p>
                        <input type="submit" name="loguin" value="Loguin">
                        <input type="submit" name="registrar" value="Registrar">
                </form>
            </div>
        </div>
    </div>
</div>

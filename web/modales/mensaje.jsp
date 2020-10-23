<%@page import="Modelo.User"%>
<%@page import="Modelo.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
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
                <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
                    <p><input type="email" name="para" class="w-100" placeholder="Para" required=""></p>
                    <p><input type="text" name="asunto" class="w-100" placeholder="Asunto" required=""></p>
                    <textarea name="cuerpo" rows="10" class="w-100" placeholder="Cuerpo"></textarea><br>
                    <input class="btn btn-info" type="submit" name="enviar" value="Enviar">
                </form>
            </div>
        </div>
    </div>
</div>
<%
    User us = null;
    if (session.getAttribute("logueado") != null) {
        us = (User) session.getAttribute("logueado");
    }
    session.setAttribute("mensajes", ConexionEstatica.getMensajes(us.getEmail()));
    LinkedList mensajesRE = (LinkedList) session.getAttribute("mensajes");
    Mensaje m = null;
    for (int i = 0; i < mensajesRE.size(); i++) {
        m = (Mensaje) mensajesRE.get(i);
%>
<div class="modal fade" id="ModalCorreo<%=i%>" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="media">
                    <div class="media-left">
                        <img src='<%=m.getFotoimgString()%>' class="z-depth-0 text-left" style="width:60px" alt='Foto de perfil no encontrada'>
                    </div>
                    <div class="media-body">
                        <h4>From: <small><i><%= m.getEmail_env()%> (<%=m.getEnviado_nick()%>)</i></small></h4>
                        <h4>Asunto: <%= m.getAsunto()%></h4>
                    </div>
                    <div class="media-right">
                        <h4><small><i><%=m.getFecha() %></i></small></h4>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <h4><%= m.getContenido()%></h4>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
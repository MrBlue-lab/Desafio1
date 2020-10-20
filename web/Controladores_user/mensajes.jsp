<%@page import="Modelo.User"%>
<%@page import="Modelo.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
<table class="table table-hover fondowhite">
    <tbody class="tablero-mensajes">
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
        <tr>
            <td class="eye"><img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="mini_foto rounded-circle z-depth-0" alt="avatar eye"></td>
            <td class="w-50"> <%= m.getEnviado_nick()%><br><%= m.getEmail_env()%></td>
            <td class="w-50">  <%= m.getAsunto()%></td>
            <td class="eye">
                <div class="contenedor-modal">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#ModalCorreo<%=i%>">
                        <span class="glyphicon glyphicon-eye-open"></span>
                    </button>
                </div>
                <div class="modal fade" id="ModalCorreo<%=i%>" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h3 class="modal-title" id="myModalLabel">hole</h3>
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
            </td>
        </tr>
        <% }%>
    </tbody>
</table>

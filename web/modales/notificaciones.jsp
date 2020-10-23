<%@page import="Modelo.Notificacion"%>
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
            LinkedList mensajesRE = ConexionEstatica.getNotificaciones(us.getId());
            Notificacion m = null;
            for (int i = 0; i < mensajesRE.size(); i++) {
                m = (Notificacion) mensajesRE.get(i);
        %>
        <tr>
            <td class="eye">
                <%if (m.getFotoBlob() != null) {%>
                <img src='<%=m.getFotoimgString()%>' class="mini_foto rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                <%} else {%>

                <img src='../css/img/user1.jpg' class="mini_foto rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                <%
                    }
                %>
            </td>
            <td class="w-50"> <%= m.getEnviado_nick()%><br><%= m.getEmail_env()%>
            </td> 
            <td class="w-50">
                <div class="contenedor-modal">
                    <form name="for" action="../Controladores_comun/controlador.jsp" method="post">
                        <input type="text" value="<%= m.getEmail_env()%>"  hidden="" name="email_env">
                        <input type="submit" class="btn btn-success glyphicon" value="aceptar" name="aceptar_user"><input type="submit" class="btn btn-danger" value="denegar" name="denegar_user">
                    </form>
                </div>
            </td>
        </tr>
        <% }
            m = null;
            mensajesRE = null;
        %>
    </tbody>
</table>

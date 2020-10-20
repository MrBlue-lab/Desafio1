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
            <td class="eye"><img src='<%=m.getFotoimgString() %>' class="mini_foto rounded-circle z-depth-0" alt='Foto de perfil no encontrada'></td>
            <td class="w-50"> <%= m.getEnviado_nick()%><br><%= m.getEmail_env()%></td>
            <td class="w-50">  <%= m.getAsunto()%></td>
            <td class="eye">
                <div class="contenedor-modal">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#ModalCorreo<%=i%>">
                        <span class="glyphicon glyphicon-eye-open"></span>
                    </button>
                </div>
            </td>
        </tr>
        <% }%>
    </tbody>
</table>

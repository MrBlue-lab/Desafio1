<%-- 
    Document   : administrador
    Created on : 29 sept. 2020, 13:52:40
    Author     : daw205
--%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.User"%>
<%
    request.setCharacterEncoding("UTF-8");
    if (request.getParameter("email") != null) {
        String email = request.getParameter("email");

        if (request.getParameter("editar") != null) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            ConexionEstatica.nueva();
            ConexionEstatica.Modificar_User(email, nombre, apellido);
            session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());
            ConexionEstatica.cerrarBD();

        } else if (request.getParameter("eliminar") != null) {
            ConexionEstatica.nueva();
            ConexionEstatica.Borrar_User(email);
            session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());
            ConexionEstatica.cerrarBD();
        }

    } else {
        ConexionEstatica.nueva();
        session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());
        ConexionEstatica.cerrarBD();
    }

    response.sendRedirect("crud.jsp");

%>
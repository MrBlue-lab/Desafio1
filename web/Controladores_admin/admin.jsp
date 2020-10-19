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

            String nick = request.getParameter("nick");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String aux = request.getParameter("edad");
            int edad = Integer.parseInt(aux);
            String sexo = request.getParameter("sexo");
            aux = request.getParameter("validado");
            int validado = Integer.parseInt(aux);
            aux = request.getParameter("rol");
            int rol = Integer.parseInt(aux);
            ConexionEstatica.Modificar_User(email, nombre, nick, apellido, edad, sexo, rol, validado);
            session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());

        } else if (request.getParameter("eliminar") != null) {
            ConexionEstatica.Borrar_User(email);
            session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());
        }

    } else {
        ConexionEstatica.nueva();
        session.setAttribute("usuarios", ConexionEstatica.obtenerUsuarios());
        ConexionEstatica.cerrarBD();
    }
    response.sendRedirect("../vistas_admin/crud.jsp");

%>
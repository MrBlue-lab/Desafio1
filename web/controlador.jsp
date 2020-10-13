<%-- 
    Document   : controlador
    Created on : 25 sept. 2020, 13:24:03
    Author     : daw205
--%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.User"%>
<%
    //metodo para regresar en cualquier pagina
    if (request.getParameter("back") != null) {
        session.removeAttribute("logueado");
        response.sendRedirect("index.jsp");
    }

    //Redireccionamiento de paginas
    if (request.getParameter("registrar") != null) {
        response.sendRedirect("registrar.jsp");
    }

    //Registro de usuarios
    if (request.getParameter("registro") != null) {
        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String pass = request.getParameter("pass");
        String fecha = request.getParameter("fecha");
        String curso = request.getParameter("curso");
        String sexo = request.getParameter("sexo");
        String aux = request.getParameter("edad");
        int edad = Integer.parseInt(aux);
        aux = request.getParameter("tipo");
        int tipo = Integer.parseInt(aux);
        String asig[] = request.getParameterValues("asig");
        User u = new User(tipo, email, nombre, apellido, pass, edad, curso, sexo, fecha, asig);
        ConexionEstatica.nueva();
        ConexionEstatica.Insertar_User(u);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("index.jsp");
    }

    //Comprobacion de usuarios
    if (request.getParameter("loguin") != null) {
        String user = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");
        ConexionEstatica.nueva();
        if (ConexionEstatica.loguin(user, pass) != null) {
            session.setAttribute("logueado", ConexionEstatica.loguin(user, pass));
            response.sendRedirect("eleccion.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
        ConexionEstatica.cerrarBD();
    }

    //eleccion de usuario logueado
    if (request.getParameter("eleccion") != null) {
        String aux = request.getParameter("tipo");
        if (Integer.parseInt(aux) == 1) {
            response.sendRedirect("crud.jsp");
        } else {
            response.sendRedirect("home.jsp");
        }
    }
%>
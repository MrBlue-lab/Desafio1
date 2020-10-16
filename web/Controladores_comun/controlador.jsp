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
        if (session.getAttribute("logueado") != null) {
            session.removeAttribute("logueado");
        }
        response.sendRedirect("../index.jsp");
    }

    //Redireccionamiento de paginas
    if (request.getParameter("registrar") != null) {
        response.sendRedirect("../vistas_comun/registrar.jsp");
    }

    //Registro de usuarios
    if (request.getParameter("registro") != null) {
        String email = request.getParameter("email");
        String nick = request.getParameter("nickname");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String pass = request.getParameter("pass");
        String sexo = request.getParameter("sexo");
        String aux = request.getParameter("edad");
        int edad = Integer.parseInt(aux);
        User u = new User(email, pass, nombre, nick, apellido, edad, sexo);
        ConexionEstatica.nueva();
        ConexionEstatica.Insertar_User(u);
        ConexionEstatica.cerrarBD();
        response.sendRedirect("../index.jsp");
    }

    //Comprobacion de usuarios
    if (request.getParameter("loguin") != null) {
        String user = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");
        ConexionEstatica.nueva();
        if (ConexionEstatica.loguin(user, pass) != null) {
            User u=ConexionEstatica.loguin(user, pass);
            session.setAttribute("logueado",u);
            if (!ConexionEstatica.User_tiene_preferencias(u.getId())) {
                response.sendRedirect("../vistas_comun/preferencias.jsp");
            } else {
                response.sendRedirect("../vistas_comun/eleccion.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }
        ConexionEstatica.cerrarBD();
    }

    //eleccion de usuario logueado
    if (request.getParameter("eleccion") != null) {
        String aux = request.getParameter("tipo");
        if (Integer.parseInt(aux) == 2) {
            response.sendRedirect("crud.jsp");
        } else {
            response.sendRedirect("../vistas_user/home.jsp");
        }
    }
%>
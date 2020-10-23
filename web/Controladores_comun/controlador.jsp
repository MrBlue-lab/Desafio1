<%-- 
    Document   : controlador
    Created on : 25 sept. 2020, 13:24:03
    Author     : daw205
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.User"%>

<%
    //metodo para regresar en cualquier pagina
    if (request.getParameter("back") != null) {
        if (session.getAttribute("logueado") != null) {
            LinkedList personasonline = (LinkedList) application.getAttribute("usuarios_online");
            if (personasonline.size() > 1) {
                User prin = (User) session.getAttribute("logueado");
                User u = null;
                int cont = 0;
                do {
                    u = (User) personasonline.get(cont);
                    cont++;
                } while (u.getId() != prin.getId());
                personasonline.remove(cont - 1);
                application.setAttribute("usuarios_online", personasonline);
            } else {
                application.removeAttribute("usuarios_online");
            }
            session.removeAttribute("logueado");
        }
        response.sendRedirect("../index.jsp");
    }

    //Redireccionamiento de paginas
    if (request.getParameter("registrar") != null) {
        response.sendRedirect("../vistas_comun/registrar.jsp");
    }

    //Comprobacion de usuarios
    if (request.getParameter("loguin") != null) {
        String user = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");
        if (ConexionEstatica.loguin(user, pass) != null) {
            User u = ConexionEstatica.loguin(user, pass);
            if (ConexionEstatica.User_tiene_casa(u) == null) {
                response.sendRedirect("../vistas_comun/preferencias.jsp");
            } else {
                u = ConexionEstatica.User_tiene_casa(u);
                response.sendRedirect("../vistas_comun/eleccion.jsp");
            }
            session.setAttribute("logueado", u);
            if (application.getAttribute("usuarios_online") != null) {
                LinkedList personasonline = (LinkedList) application.getAttribute("usuarios_online");
                personasonline.addLast(u);
                application.setAttribute("usuarios_online", personasonline);
            } else {
                LinkedList personasonline = new LinkedList<User>();
                application.setAttribute("usuarios_online", personasonline);
            }
        } else {
            response.sendRedirect("../index.jsp");
        }
    }

    //eleccion de usuario logueado
    if (request.getParameter("eleccion") != null) {
        String aux = request.getParameter("tipo");
        if (Integer.parseInt(aux) == 2) {
            response.sendRedirect("../Controladores_admin/admin.jsp");
        } else {
            response.sendRedirect("../vistas_user/home.jsp");
        }
    }

    //agregar amigos
    if (request.getParameter("agregar") != null) {
        String email = request.getParameter("email");
        User u = (User) session.getAttribute("logueado");
        ConexionEstatica.agregarAmigo(u.getId(), email);
        response.sendRedirect("../vistas_user/casa.jsp");
    }
    
    
    //aceptar o cancelar amigos
    if (request.getParameter("aceptar_user") != null) {
        String email = request.getParameter("email_env");
        User u = (User) session.getAttribute("logueado");
        ConexionEstatica.aceptarAmigo(u.getId(), email);
        ConexionEstatica.rechazarAmigo(u.getId(), email);
        response.sendRedirect("../vistas_user/home.jsp");
    }else if(request.getParameter("denegar_user") != null){
        String email = request.getParameter("email_env");
        User u = (User) session.getAttribute("logueado");
        ConexionEstatica.rechazarAmigo(u.getId(), email);
        response.sendRedirect("../vistas_user/home.jsp");
    }

    //eleccion de usuario logueado
 /**   
    if (request.getParameter("enviar") != null) {
        User u = (User) session.getAttribute("logueado");
        if (!request.getParameter("para").equals(u.getEmail())) {
            String para = request.getParameter("para");
            String asunto = request.getParameter("asunto");
            String cuerpo = request.getParameter("cuerpo");
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
            String currentDate = ft.format(dNow);
            Date d = ft.parse(currentDate);
            java.sql.Date sqlDate = new java.sql.Date(d.getTime());
            ConexionEstatica.EnviarMensaje(u.getId(), para, asunto, cuerpo, sqlDate);
        }
        response.sendRedirect("../vistas_user/home.jsp");
    }
**/
    //eleccion de usuario logueado primera vez
    if (request.getParameter("preferencias") != null) {
        int casa = 0;
        int sombrero = 0;
        for (int i = 0; i < 10; i++) {
            String aux = request.getParameter("" + i);
            casa = casa + Integer.parseInt(aux);
        }
        if (casa >= 100 && casa <= 170) {
            sombrero = 4;
        } else if (casa >= 180 && casa <= 250) {
            sombrero = 3;
        } else if (casa >= 260 && casa <= 320) {
            sombrero = 2;
        } else if (casa >= 330 && casa <= 400) {
            sombrero = 1;
        }

        User u = (User) session.getAttribute("logueado");
        ConexionEstatica.sombrero_seleccionador(sombrero, u.getId(), casa);
        u = ConexionEstatica.User_tiene_casa(u);
        session.setAttribute("logueado", u);
        response.sendRedirect("../vistas_comun/eleccion.jsp");
    }
%>
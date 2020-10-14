<%-- 
    Document   : crud
    Created on : 29 sept. 2020, 13:42:30
    Author     : daw205
--%>

<%@page import="Modelo.User"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <%
            if (session.getAttribute("usuarios") == null) {
                out.print("no existen usuarios error");
            } else {
                LinkedList<User> lista = (LinkedList) session.getAttribute("usuarios");
                for (int i = 0; i < lista.size(); i++) {
                    User aux = lista.get(i);
        %>
        <form name="for" action="administrador.jsp" method="POST">
            <input type="text" name="email" value="<%=aux.getEmail()%>" readonly="">
            <input type="text" name="nombre" value="<%=aux.getNombre()%>">
            <input type="text" name="apellido" value="<%=aux.getApellidos()%>"> 
            <input type="submit" name="editar" value="Editar">
            <input type="submit" name="eliminar" value="Eliminar">
        </form>

    <%
            }
        }
    %>  
    <form name="for" action="controlador.jsp" method="POST">
        <input type="submit" name="back" value="Back">
    </form>
</body>
</html>
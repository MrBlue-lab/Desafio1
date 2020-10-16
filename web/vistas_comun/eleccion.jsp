<%-- 
    Document   : eleccion
    Created on : 29 sept. 2020, 13:21:52
    Author     : daw205
--%>

<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>Elección</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
            <fieldset>
                <legend>Elige rol</legend>
                <p>
                    <select name="tipo">
                        <option value="1"selected>Usuario
                            <%
                                User u = (User) session.getAttribute("logueado");
                                if (u.getRol() == 2) {
                            %>
                        <option value="2">Administrador
                            <%
                                }
                            %>
                    </select>
                </p>
            </fieldset>
            <input type="submit" name="eleccion" value="Aceptar">
            <input type="submit" name="back" value="back">
        </form>
    </body>
</html>

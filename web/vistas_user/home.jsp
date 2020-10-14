<%-- 
    Document   : home
    Created on : 25 sept. 2020, 13:27:14
    Author     : daw205
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
            <fieldset>
                <legend><h1>User</h1></legend>
                <h3>Loguin correcto</h3>
                <input type="submit" name="back" value="back">
            </fieldset>
        </form>
    </body>
</html>

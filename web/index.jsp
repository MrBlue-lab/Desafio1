<%-- 
    Document   : index
    Created on : 25 sept. 2020, 13:18:46
    Author     : daw205
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loguin</title>
    </head>
    <body>
        <form name="for" action="controlador.jsp" method="POST">
            <fieldset>
                <legend><h1>Loguin</h1></legend>
                <p>Nombre <input type="text" name="usuario" placeholder="usuario">
                <p>Contraseña <input type="password" name="contrasena" placeholder="contraseña"></p>
                <p><a href="recuperar.jsp">recuperar contraseña</a></p>
                <input type="submit" name="loguin" value="Loguin">
                <input type="submit" name="registrar" value="Registrar">
            </fieldset>
        </form>
    </body>
</html>

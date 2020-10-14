<%-- 
    Document   : enviar
    Created on : 30 sept. 2020, 10:53:25
    Author     : daw205
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
    </head>
    <body>
        <form action="enviar_correo.jsp" method="post">
            <input type="text" name="email" placeholder="Introduzca su usuario"><br>
            <input class="botones" type="submit" value="Recuperar contraseña">
        </form>
    </body>
</html>

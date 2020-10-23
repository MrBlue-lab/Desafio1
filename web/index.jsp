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
        <!-- CSS only -->

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="presentacion/elementos.jsp" />
        <title>Loguin</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"><h2>Facewarts</h2></a>
                </div>
            </div>
        </nav>
        <div class="container h-100">
            <div class="align-self-center text-center">
                <div class="card-head col-sm-12">
                    <div class="card-head text-center">
                        <h1><span class="glyphicon glyphicon-user"> LOGUIN</span></h1>
                    </div>
                    <div class="card-body col-sm-12 justify-content-center text-center">      
                        <form name="for" action="Controladores_comun/controlador.jsp" method="POST">
                            <p>Nombre <input type="text" name="usuario" placeholder="usuario">
                            <p>Contraseña <input type="password" name="contrasena" placeholder="contraseña"></p>
                            <p><a href="recuperar.jsp">recuperar contraseña</a></p>
                            <input type="submit" name="loguin" value="Loguin">
                            <input type="submit" name="registrar" value="Registrar">
                        </form> 
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="presentacion/footer.jsp" />
    </body>
</html>

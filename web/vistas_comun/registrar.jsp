<%-- 
    Document   : registrar
    Created on : 25 sept. 2020, 13:27:04
    Author     : daw205
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../presentacion/elementos.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">DOOM Crossing</a>
                </div>
            </div>
        </nav>

        <div class="container h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-body ">
                    <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
                        <fieldset>
                            <legend><h1>Registro</h1></legend>
                            <p>Nick <input type="text" name="nickname" placeholder="nick" value=""></p>
                            <p>Email <input type="text" name="email" placeholder="email" value=""></p>
                            <p>Nombre <input type="text" name="nombre" placeholder="nombre" value="">
                                <input type="text" name="apellido" placeholder="apellido" value=""></p>
                            <p>Contaseña <input type="password" name="pass" placeholder="email" value=""></p>
                            <p>Repetir contaseña <input type="password" name="pass2" placeholder="email" value=""></p>

                            <p>Edad <input type="number" name="edad" value="0"  max="100" min="0" ></p>
                            <br/>
                            <p>Sexo<br>
                                <input type="Radio" name="sexo" value="mujer"checked>Mujer<br>
                                <input type="Radio" name="sexo" value="hombre">Hombre
                            </p>
                            <input type="submit" name="back" value="Back">
                            <input type="submit" name="registro" value="registrarse">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>

<%-- 
    Document   : preferencias
    Created on : 16 oct. 2020, 12:37:40
    Author     : daw205
--%>

<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>Preferencias</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-sm-12 align-self-center text-center">
                    <div class="card shadow">
                        <div class="card-head ">
                            <%
                                User u = (User) session.getAttribute("logueado");
                            %>
                        </div>
                        <div class="card-body m-5">        

                            <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
                                <fieldset>
                                    <legend><h1>Preferencias</h1></legend>
                                    <br/>
                                    <p>DOOM <input type="number" name="edad" value="0"  max="100" min="0" ></p>
                                    <br/>
                                    <p>Crossing <input type="number" name="edad" value="0"  max="100" min="0" ></p>
                                    <br/>
                                    <input type="submit" name="registro" value="registrarse">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </body>
</html>

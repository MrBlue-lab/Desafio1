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
                                    <fieldset>
                                        <legend>¿Cual de estas caracteristicas crees que te define mejor?</legend>
                                        <p><br>
                                            <input type="Radio" name="0" value="30">Lealtad<br>
                                            <input type="Radio" name="0" value="20">Inteligencia<br>
                                            <input type="Radio" name="0" value="10">Ambicion<br>
                                            <input type="Radio" name="0" value="40">Valentia
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Si estudiases en howarts... 
                                            ¿Donde preferirias que estuviese tu dormitorio?</legend>
                                        <p><br>
                                            <input type="Radio" name="1" value="10">En las mazmorras<br>
                                            <input type="Radio" name="1" value="20">En una torre del castillo<br>
                                            <input type="Radio" name="1" value="30">Cerca de la cocina<br>
                                            <input type="Radio" name="1" value="40">En el centro del castillo
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Escoge una mascota</legend>
                                        <p><br>
                                            <input type="Radio" name="2" value="10">Camaleon<br>
                                            <input type="Radio" name="2" value="40">Lechuza<br>
                                            <input type="Radio" name="2" value="20">Gato<br>
                                            <input type="Radio" name="2" value="30">Sapo
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>¿Cual de estas asignaturas escogerias? (solo una respuesta)</legend>
                                        <p><br>
                                            <input type="Radio" name="3" value="30">Pociones<br>
                                            <input type="Radio" name="3" value="10">Transformaciones<br>
                                            <input type="Radio" name="3" value="40">Historia de la magia<br>
                                            <input type="Radio" name="3" value="20">Astronomia
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>¿Alguna vez has hecho trampas o copiado en un examen?</legend>
                                        <p><br>
                                            <input type="Radio" name="4" value="10">Si todos/as lo hacen<br>
                                            <input type="Radio" name="4" value="40">No nunca<br>
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Escoge el color que mas te guste:</legend>
                                        <p><br>
                                            <input type="Radio" name="5" value="40">Rojo<br>
                                            <input type="Radio" name="5" value="30">Amarillo<br>
                                            <input type="Radio" name="5" value="20">Azul<br>
                                            <input type="Radio" name="5" value="10">Verde
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Si jugases a quidditch... /n
                                            ¿Cual crees que seria tu rol en el equipo?</legend>
                                        <p><br>
                                            <input type="Radio" name="6" value="30">Cazador/a<br>
                                            <input type="Radio" name="6" value="10">Golpeador/a<br>
                                            <input type="Radio" name="6" value="40">Guardian/a<br>
                                            <input type="Radio" name="6" value="20">Buscador/a
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Te miras en el espejo de Oesed y ves tu futuro... /n
                                            ¿Como te ves?</legend>
                                        <p><br>
                                            <input type="Radio" name="7" value="10">Con mucho dinero<br>
                                            <input type="Radio" name="7" value="30">Rodeado de seres queridos<br>
                                            <input type="Radio" name="7" value="20">Siendo alguien importante en howarts<br>
                                            <input type="Radio" name="7" value="40">Viviendo un increible aventura
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>Escoge un animal</legend>
                                        <p><br>
                                            <input type="Radio" name="8" value="40">Leon<br>
                                            <input type="Radio" name="8" value="30">Tejon<br>
                                            <input type="Radio" name="8" value="20">Aguila<br>
                                            <input type="Radio" name="8" value="10">Serpiente
                                        </p>
                                    </fieldset>
                                    <fieldset>
                                        <legend>¿Que harias una vez terminases tus estudios en hogwarts?</legend>
                                        <p><br>
                                            <input type="Radio" name="9" value="10">Tendria un familia<br>
                                            <input type="Radio" name="9" value="30">Me uniria al ministerio de magia<br>
                                            <input type="Radio" name="9" value="20">Buscaria como seguir estudiando<br>
                                            <input type="Radio" name="9" value="40">Me iria de viaje
                                        </p>
                                    </fieldset>
                                    <br>
                                    <input type="submit" name="preferencias" value="Continuar">
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <jsp:include page="../presentacion/footer.jsp" />
    </body>
</html>

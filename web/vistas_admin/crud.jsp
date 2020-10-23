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
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>Usuarios</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <div class="container h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-head "> <ul class="list-group">
                        <%
                            if (session.getAttribute("usuarios") == null) {
                                out.print("<h1>no existen usuarios error</h1>");
                            } else {
                                LinkedList<User> lista = (LinkedList) session.getAttribute("usuarios");
                                for (int i = 0; i < lista.size(); i++) {
                                    User aux = lista.get(i);
                        %>
                        <li class="list-group-item">
                            <form name="for" action="../Controladores_admin/admin.jsp" method="POST">
                                <input type="text" name="email" value="<%=aux.getEmail()%>" readonly="" class="w-20">
                                <input type="text" name="nick" value="<%=aux.getNick()%>" class="w-20">
                                <input type="text" name="nombre" value="<%=aux.getNombre()%>" class="w-20">
                                <input type="text" name="apellido" value="<%=aux.getApellidos()%>" class="w-20"> 
                                <input type="number" name="edad" value="<%=aux.getEdad()%>" class="w-5">  <br>
                                <% if (aux.getSexo().equals("mujer")) {
                                %>
                                <input type="Radio" name="sexo" value="mujer"checked>Mujer
                                <input type="Radio" name="sexo" value="hombre">Hombre
                                <%
                                } else {
                                %>
                                <input type="Radio" name="sexo" value="mujer">Mujer
                                <input type="Radio" name="sexo" value="hombre"checked>Hombre
                                <%
                                    }
                                %>
                                Validado:<input type="number" name="validado" value="<%=aux.getValidado()%>" class="w-5">
                                Rol:<input type="number" name="rol" value="<%=aux.getRol()%>" class="w-5"> 
                                <div class="btn-group">
                                    <input type="submit" class="btn btn-primary" name="editar" value="Editar">
                                    <input type="submit" class="btn btn-danger" name="eliminar" value="Borrar">
                                </div> 
                            </form>
                        </li>
                        <%
                                }
                            }
                        %> 
                    </ul> 
                    <form name="for" action="../vistas_comun/eleccion.jsp" method="POST" style="margin-bottom: 100px">
                        <input type="submit" name="back" value="Back">
                    </form> 
                </div>
            </div>
        </div>
        <jsp:include page="../presentacion/footer.jsp" />
    </body>
</html>
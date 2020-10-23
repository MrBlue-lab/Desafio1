<%-- 
    Document   : home
    Created on : 25 sept. 2020, 13:27:14
    Author     : daw205
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>Amigos</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <div class="container h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-head ">
                    <%
                        User u = (User) session.getAttribute("logueado");
                        LinkedList c = ConexionEstatica.getAmigos2(u.getId());
                        User aux_amig = null;
                    %>
                    <h3><%if (u.getFotoBlobCasa() != null) {%>
                        <img src='<%=u.getFotoimgStringCasa()%>' class="" width="70" alt='Foto de perfil no encontrada'>
                        <%} else {%>
                        <img src='../css/img/user1.jpg' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                        <%
                            }
                        %>
                        Amigos</h3>
                </div>
                <div class="card-body m-5 col-sm-12">     
                    <%
                        for (int i = 0; i < c.size(); i++) {
                            aux_amig = (User) c.get(i);
                    %>
                    <div class="card-body m-5 col-sm-12">    
                        <div class="media col-sm-3"></div>
                        <div class="media col-sm-6">
                            <form name="for" action="../Controladores_comun/controlador.jsp" method="POST">
                                <div class="media-left">
                                    <%if (aux_amig.getFotoBlob() != null) {%>
                                    <img src='<%=aux_amig.getFotoimgString()%>' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                                    <%} else {%>
                                    <img src='../css/img/user1.jpg' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="media-body">
                                    <h4><%=aux_amig.getNick()%> <small class="m-5" style="margin-left: 30px;"><i><input type="text" name="email" value="<%= aux_amig.getEmail()%>" readonly=""></i></small><input class="btn btn-info" style="margin-left: 30px;" type="submit" name="agregar" value="Agregar"></h4>
                                </div>
                            </form>
                        </div>
                        <div class="media col-sm-3"><br></div>
                    </div>
                    <%}%>
                </div>
            </div>
        <jsp:include page="../presentacion/footer.jsp" />
    </body>
</html>

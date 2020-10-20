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
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="../presentacion/header.jsp" />
        <div class="container h-100">
            <div class="col-sm-12 align-self-center text-center">
                <div class="card-head ">
                    <%
                        User u = (User) session.getAttribute("logueado");
                        LinkedList c = ConexionEstatica.getPosiblesAmigos(u.getId());
                        User aux_amig = null;
                    %>
                </div>
                <div class="card-body m-5">     
                    <%
                        for (int i = 0; i < c.size(); i++) {
                            aux_amig = (User) c.get(i);
                    %>
                    <div class="media">
                        <div class="media-body">
                            <%if (aux_amig.getFotoBlob() != null) {%>
                            <img src='<%=aux_amig.getFotoimgString()%>' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                            <%} else {%>
                            <img src='../css/img/user1.jpg' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                            <%
                                }
                            %>
                            <h4><%=aux_amig.getNick()%> <br><small><i><%= aux_amig.getEmail()%></i></small></h4>
                        </div>
                        <div class="media-right">

                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : home
    Created on : 25 sept. 2020, 13:27:14
    Author     : daw205
--%>

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
                    %>
                </div>
                <div class="card-body m-5">             
                    <legend><h1><img src='<%=u.getFotoimgString() %>' class="" alt='Foto de perfil no encontrada' width="200" height="200"><%=u.getNick()%></h1></legend>
                    <h3><%= u.getEmail() %></h3>
                    <h3><%=u.getNombre()%> <%=u.getApellidos()%></h3>
                </div>
            </div>
        </div>
    </body>
</html>

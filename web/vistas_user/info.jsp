<%-- 
    Document   : home
    Created on : 25 sept. 2020, 13:27:14
    Author     : daw205
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../presentacion/elementos.jsp" />
        <title>Howarts</title>
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
                <div class="card-body m-5 col-sm-12">   
                    <h1><%=u.getCasa()%></h1>
                    <div class="col-sm-6"><%if (u.getFotoBlobCasa() != null) {%>
                        <img src='<%=u.getFotoimgStringCasa()%>' class="" width="300" alt='Foto de perfil no encontrada'>
                        <%} else {%>
                        <img src='../css/img/user1.jpg' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                        <%
                            }
                        %>
                        </div>
                    <h3 class="text-left col-sm-6"><%=ConexionEstatica.getInfo(u.getCasa())%></h3>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : recuperar
    Created on : 30 sept. 2020, 10:52:15
    Author     : daw205
--%>

<%@page import="Modelo.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <%
            Email email = new Email();
            String de = "auxiliardaw2@gmail.com";
            String clave = "Chubaca20";
            String para = "sergiosusin.ssc@gmail.com" ;
            String mensaje= "Mensajito";
            String asunto = "Usuario -->"+request.getParameter("email");
                    
            
            email.enviarCorreo(de, clave, para, mensaje, asunto);
            out.println("Correo enviado");
            //response.sendRedirect("index.jsp");
        %>
        <a href="index.jsp">loguin</a>
    </body>
</html>

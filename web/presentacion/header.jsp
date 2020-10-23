
<%@page import="Modelo.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.User"%>
<!--Navbar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="../vistas_user/home.jsp"><h2>Facewarts</h2></a>
        </div>
        <% User u = (User) session.getAttribute("logueado");
            if (!u.getCasa().equals("")) {
                int cont_amigos = 0;
        %>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a class="dropdown-toggle p-t1" data-toggle="dropdown" href="#">
                    <h4 class=" leta-20"><img src='<%=u.getFotoimgStringCasa()%>' class="rounded-circle z-depth-0" alt='casa'> <%=u.getCasa()%><span class="caret"></span></h4></a>
                <ul class="dropdown-menu">
                    <li><a href="../vistas_user/info.jsp"><h4>Información</h4></a></li>
                    <li><a href="../vistas_user/casa.jsp"><h4>Alumnos de <%=u.getCasa()%></h4></a></li>
                </ul>
            </li>
            <li><a href="#">
                    <%cont_amigos = ConexionEstatica.getAmigos((LinkedList) application.getAttribute("usuarios_online"), u.getId());%>
                    <h4>Amigos <%=cont_amigos%></h4>
                </a>
            </li>
            <%
                if (u.getRol() >= 2) {
            %>
            <li>
                <a href="../Controladores_admin/admin.jsp">
                    <h4>Crud user</h4>
                </a>
            </li>
            <%
                }
            %>
        </ul>
        <%
            }
            session.setAttribute("mensajes", ConexionEstatica.getMensajes(u.getEmail()));
            LinkedList mensajesRE = (LinkedList) session.getAttribute("mensajes");
        %> 
        <ul class="nav navbar-nav navbar-right nav-flex-icons">
            <li><a><div class="contenedor-modal"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#miModal"><span class="glyphicon glyphicon-leaf"></span> Enviar</button></div></a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle email" id="navbarDropdownMenuLink-56" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="glyphicon glyphicon-envelope p-5"></span> <%=mensajesRE.size()%>
                </a>
                <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary w-100px currentColor" aria-labelledby="navbarDropdownMenuLink-56">
                    <jsp:include page="../modales/mensajes.jsp" />
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle imagen" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">

                    <%if (u.getFotoBlob() != null) {%>
                    <img src='<%=u.getFotoimgString()%>' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                    <%} else {%>

                    <img src='../css/img/user1.jpg' class="rounded-circle z-depth-0" alt='Foto de perfil no encontrada'>
                    <%
                        }
                    %>
                </a>
                <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary w-100px" aria-labelledby="navbarDropdownMenuLink-55">
                    <h3 class="text-center"> <%= u.getNick()%></h3>
                    <div class="dropdown-divider"></div>
                    <a class="text-center"><form name="for" action="../Controladores_comun/controlador.jsp" method="POST"><input type="submit" class="btn btn-danger" value="cerrar sesion" name="back"></span></form></a>
                </div>
            </li>
        </ul>

    </div>
</nav>
<jsp:include page="../modales/mensaje.jsp" />
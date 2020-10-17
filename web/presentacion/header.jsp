
<%@page import="Modelo.User"%>
<!--Navbar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="../vistas_user/home.jsp"><h2>Facewarts</h2></a>
        </div>
            <% User u = (User) session.getAttribute("logueado");%> 
        <ul class="nav navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle imagen" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <img src="../css/img/<%=u.getCasa()%>.png" class="rounded-circle z-depth-0" alt="casa">
                </a>
                <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-55">
                    <h3> <%= u.getNick()%></h3>
                    <a class="dropdown-item" href="#">Action</a>
                    <a><form name="for" action="../Controladores_comun/controlador.jsp" method="POST"><input type="submit" class="btn btn-danger" value="cerrar sesion" name="back"></span></form></a>
                </div>
            </li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><h4>Page 1 <span class="caret"></span></h4></a>
                <ul class="dropdown-menu">
                    <li><a href="#"><h4>Page 1-1</h4></a></li>
                    <li><a href="#"><h4>Page 1-2</h4></a></li>
                    <li><a href="#"><h4>Page 1-3</h4></a></li>
                </ul>
            </li>
            <li><a href="#"><h4>Page 2</h4></a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right nav-flex-icons">
            <li><a><div class="contenedor-modal"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#miModal"><span class="glyphicon glyphicon-leaf"></span> Enviar</button></div></a></li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle email" id="navbarDropdownMenuLink-56" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="glyphicon glyphicon-envelope p-5"></span> 10
                </a>
                <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-56">
                    <h3> <%= u.getNick()%></h3>
                    <a class="dropdown-item" href="#">Action</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle imagen" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="rounded-circle z-depth-0" alt="avatar image">
                </a>
                <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-55">
                    <h3> <%= u.getNick()%></h3>
                    <a class="dropdown-item" href="#">Action</a>
                    <a><form name="for" action="../Controladores_comun/controlador.jsp" method="POST"><input type="submit" class="btn btn-danger" value="cerrar sesion" name="back"></span></form></a>
                </div>
            </li>
        </ul>

    </div>
</nav>
<jsp:include page="../modales/mensaje.jsp" />
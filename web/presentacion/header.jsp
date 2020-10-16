
<%@page import="Modelo.User"%>
<!--Navbar -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><h4>Facewarts</h4></a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="../vistas_user/home.jsp"><h4>Home</h4></a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><h5>Page 1 </h5><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#"><h4>Page 1-1</h4></a></li>
                    <li><a href="#"><h4>Page 1-2</h4></a></li>
                    <li><a href="#"><h4>Page 1-3</h4></a></li>
                </ul>
            </li>
            <li><a href="#"><h4>Page 2</h4></a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right nav-flex-icons">
            <% User u = (User) session.getAttribute("logueado");%> 

            <!--                                         
<li><a><div class="contenedor-modal"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#miModal"><span class="glyphicon glyphicon-user"></span> Loguin</button></div></a></li>
            -->

            <li><h3><span class="glyphicon glyphicon-envelope"></span> 1</h3></li>
            <li class="nav-item avatar dropdown">
                
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
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
<jsp:include page="../modales/loguin.jsp" />
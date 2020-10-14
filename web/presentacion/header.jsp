
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">DOOM Crossing</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Page 1-1</a></li>
                    <li><a href="#">Page 1-2</a></li>
                    <li><a href="#">Page 1-3</a></li>
                </ul>
            </li>
            <li><a href="#">Page 2</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%
                if (session.getAttribute("logueado") != null) {
            %>
            <li><a><form name="for" action="../Controladores_comun/controlador.jsp" method="POST"><input type="submit" class="btn btn-danger" value="back" name="back"></span></form></a></li>
            <%
                }
            %>
            <li><a><div class="contenedor-modal"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#miModal"><span class="glyphicon glyphicon-user"></span> Loguin</button></div></a></li>
        </ul>
    </div>
</nav>
<jsp:include page="../modales/loguin.jsp" />
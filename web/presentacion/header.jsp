
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Keanulovers</a>
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
            <li><a><button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-log-in"></span> Sign Up</button></a></li>
            <li><a><div class="contenedor-modal"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#miModal"><span class="glyphicon glyphicon-user"></span> Loguin</button></div></a></li>
        </ul>
    </div>
</nav>

<jsp:include page="../modales/loguin.jsp" />
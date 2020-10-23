<%@page import="Modelo.User"%>
<%@page import="Modelo.Mensaje"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.ConexionEstatica"%>
<div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">Mensaje nuevo</h3>
            </div>
            <div class="modal-body">
                <form name="for" enctype="multipart/form-data" action="../Controladores_user/subeemail.jsp" method="POST">
                    <p><input type="email" name="para" class="w-100" placeholder="Para" required=""></p>
                    <p><input type="text" name="asunto" class="w-100" placeholder="Asunto" required=""></p>
                    <textarea name="cuerpo" rows="10" class="w-100" placeholder="Cuerpo"></textarea><br>
                    <input class="btn btn-info" type="submit" name="enviar" value="Enviar">
                    <input type="file" name="fichero"/>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    User us = null;
    if (session.getAttribute("logueado") != null) {
        us = (User) session.getAttribute("logueado");
    }
    session.setAttribute("mensajes", ConexionEstatica.getMensajes(us.getEmail()));
    LinkedList mensajesRE = (LinkedList) session.getAttribute("mensajes");
    Mensaje m = null;
    for (int i = 0; i < mensajesRE.size(); i++) {
        m = (Mensaje) mensajesRE.get(i);
%>
<div class="modal fade" id="ModalCorreo<%=i%>" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="media">
                    <div class="media-left">
                        <img src='<%=m.getFotoimgString()%>' class="z-depth-0 text-left" style="width:60px" alt='Foto de perfil no encontrada'>
                    </div>
                    <div class="media-body">
                        <h4>From: <small><i><%= m.getEmail_env()%> (<%=m.getEnviado_nick()%>)</i></small></h4>
                        <h4>Asunto: <%= m.getAsunto()%></h4>
                    </div>
                    <div class="media-right">
                        <h4><small><i><%=m.getFecha()%></i></small></h4>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <h4><%= m.getContenido()%></h4>
                <%
                    if (!m.getDir().equals("")) {
                %>
                <div>
                    <a href="../perfiles/<%= m.getDir()%>" download="<%= m.getDir()%>">Download</a>
                </div>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</div>
<%
    }
%>
<div class="modal fade" id="modUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">Modificar usuario <small><i><%= us.getEmail()%></i></small></h3>
            </div>
            <div class="modal-body">
                <form name="for" action="../Controladores_user/subefichero.jsp" enctype="multipart/form-data" method="post">
                    <p>Nick <input type="text" name="nickname" placeholder="nick" value="<%= us.getNick()%>"></p>
                    <p>Foto de perfil </p>
                    <%if (us.getFotoBlob() != null) {%>
                    <img src='<%=us.getFotoimgString()%>' width="70" alt='Foto de perfil no encontrada'>
                    <%} else {%>
                    <img src='../css/img/user1.jpg' width="70" alt='Foto de perfil no encontrada'>
                    <%
                        }
                    %>
                    <br><br>
                    <input type="file" name="fichero" value=""/></br>
                    <p>Nombre <input type="text" name="nombre" placeholder="nombre" value="<%= us.getNombre()%>">
                        <input type="text" name="apellido" placeholder="apellido" value="<%= us.getApellidos()%>"></p>
                    <p>Nueva contaseña <input type="password" name="pass" placeholder="contraseña" value="<%= us.getPass()%>"></p>
                    <p>Repetir contaseña <input type="password" name="pass2" placeholder="contraseña" value="<%= us.getPass()%>"></p>
                    <p>Edad <input type="number" name="edad" value="<%= us.getEdad()%>"  max="100" min="0" ></p>
                    <br/>
                    <p>Sexo<br>
                        <% if (us.getSexo().equals("mujer")) {
                        %>
                        <input type="Radio" name="sexo" value="mujer"checked>Mujer
                        <input type="Radio" name="sexo" value="hombre">Hombre
                        <%
                        } else {
                        %>
                        <input type="Radio" name="sexo" value="mujer">Mujer
                        <input type="Radio" name="sexo" value="hombre"checked>Hombre
                        <%
                            }
                        %>
                    </p>
                    <input class="btn btn-primary" type="submit" name="editar_user" value="Aceptar">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Cancelar</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
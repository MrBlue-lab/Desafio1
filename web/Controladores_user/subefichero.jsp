<%-- 
    Document   : subefichero
    Created on : 20-oct-2019, 18:06:24
    Author     : fernando
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Modelo.User"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            
            // 'request' es la HttpServletRequest que recibimos del formulario.
            // Los items obtenidos serán cada uno de los campos del formulario,
            // tanto campos normales como ficheros subidos.
            List items = upload.parseRequest(request);
            User p = new User();

            // Se recorren todos los items, que son de tipo FileItem
            for (Object item : items) {
                FileItem uploaded = (FileItem) item;
                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese.
                if (!uploaded.isFormField()) {
                    // Es un campo fichero: guardamos el fichero en alguna carpeta (en este caso perfiles).
                    //Si lo ponemos como sigue: el archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
                    //Este directorio, por seguridad, luego no será accesible.
                    String rutaDestino = "perfiles/";
                    File fichero = new File(rutaDestino, uploaded.getName()); //El archivo se guardará en 'glassfish5/glassfish/domains/domain1/config/perfiles'.
                    try{
                    uploaded.write(fichero);
                    }catch(Exception ex){
                        out.println(ex);
                    }
                    //Pasamos a binario la imagen para almacenarla en MySQL en el campo BLOB.
                    byte[] icono = new byte[(int) fichero.length()];
                    InputStream input = new FileInputStream(fichero);
                    input.read(icono);
                    p.setFoto(icono);
                    out.println("Archivo '" + uploaded.getName() + "' subido correctamente.");
                } else {//Si es un campo de formulario (no fichero) extraemos su valor de la siguiente manera.
                    /*
                    Como el formulario debe ser enctype="multipart/form-data" para que admita el envío del fichero. 
                    La primera pega que encontramos con JSP es que si el envío el multipart, no funcionan las llamadas a 
                    request.getParameter(), siempre devuelven null. Por ello, si el formulario tiene más campos que 
                    necesitemos leer, debemos delegar toda la tarea en la librería apache-commons-fileupload.
                    */
                    // Para obtener clave y valor de los campos formulario.
                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();
                    out.println("Valor recuperado con uploaded: " + key + " = " + valor + "</br>");
                   if (key.equals("nombre")){
                       p.setNombre(valor);
                   }
                   if (key.equals("edad")){
                       p.setEdad(Integer.parseInt(valor));
                   }
                }
            }
            ConexionEstatica.Insertar_User(p);
        %>
        <a href='index.jsp'>Volver</a>
    </body>
</html>

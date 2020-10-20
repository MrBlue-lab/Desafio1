package Modelo;

import Auxiliar.Constantes;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static User loguin(String email, String pass) throws SQLException {
        ConexionEstatica.nueva();
        User existe = null;
        String sql = "SELECT * FROM user WHERE email = ? && pass = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ConexionEstatica.Conj_Registros = ps.executeQuery();

        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                if (ConexionEstatica.Conj_Registros.next()) {
                    existe = new User(Conj_Registros.getInt("id_us"), Conj_Registros.getString("email"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static User User_tiene_casa(User u) {
        ConexionEstatica.nueva();
        User us = null;
        try {
            String sentencia = "SELECT * FROM casa_estudiante,casas WHERE casa_estudiante.id_us = '" + u.getId() + "' && casa_estudiante.id_int=casas.id_int ";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                u.setCasa(Conj_Registros.getString("nombre"));
                u.setFotoBlobCasa(Conj_Registros.getBlob("img"));
                u.setFotoCasa(Conj_Registros.getBytes("img"));
                us = u;
            }
            ConexionEstatica.cerrarBD();
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return us;//Si devolvemos null el usuario no existe.
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerUsuarios() {
        ConexionEstatica.nueva();
        LinkedList personasBD = new LinkedList<>();
        User p = null;
        try {
            String sentencia = "SELECT * FROM user";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new User(Conj_Registros.getInt("id_us"), Conj_Registros.getString("email"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"));
                personasBD.add(p);
            }
            ConexionEstatica.cerrarBD();
        } catch (SQLException ex) {
        }
        return personasBD;
    }

    /**
     * INSERT INTO `mensajes` (`id_men`, `id_env`, `id_rez`, `asunto`,
     * `contenido`, `fecha`, `leido`) VALUES (NULL, '8', '8', 'jajaxd', 'hola yo
     * soy tu morenito 19', '2020-10-19', '0');
     */
    /**
     * @param email
     * @return
     */
    public static LinkedList getMensajes(String email) {
        ConexionEstatica.nueva();
        LinkedList mensajesRE = new LinkedList<>();
        PreparedStatement ps = null;
        String sql = "SELECT user.email AS 'recibido',(SELECT user.img FROM user WHERE user.id_us=mensajes.id_env) AS 'img',mensajes.*,(SELECT user.email FROM user WHERE user.id_us=mensajes.id_env) as 'enviado',(SELECT user.nick FROM user WHERE user.id_us=mensajes.id_env) as 'enviado_nick' FROM user,mensajes where user.id_us = mensajes.id_rez && user.email = ?";
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, email);
            ConexionEstatica.Conj_Registros = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                Mensaje p = null;
                while (ConexionEstatica.Conj_Registros.next()) {

                    p = new Mensaje(Conj_Registros.getInt("id_men"), Conj_Registros.getString("enviado"), Conj_Registros.getString("enviado_nick"), Conj_Registros.getString("recibido"), Conj_Registros.getString("asunto"), Conj_Registros.getString("contenido"), Conj_Registros.getString("fecha"), Conj_Registros.getInt("leido"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                    mensajesRE.add(p);
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return mensajesRE;
    }

    /**
     * @param email
     * @param nombre
     * @param apellido
     * @throws java.sql.SQLException
     */
    //---------------------------------------------------------- public
    public static void Modificar_User(String email, String nombre, String nick, String apellido, int edad, String sexo, int rol, int validado) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "UPDATE `user` SET `nick` = ?, `nombre` = ?, `apellidos` = ?, `edad` = ?, `sexo` = ?, `rol` = ?, `validado` = ? WHERE `email` = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, nick);
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            ps.setInt(4, edad);
            ps.setString(5, sexo);
            ps.setInt(6, rol);
            ps.setInt(7, validado);
            ps.setString(8, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    /**
     * @param u
     * @throws java.sql.SQLException
     */
    //----------------------------------------------------------
    public static void Insertar_User(User u) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "INSERT INTO `user` (`id_us`, `email`, `nick`, `pass`, `nombre`, `apellidos`, `edad`, `sexo`, `img`, `rol`, `validado`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, NULL, '1', '0');";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getNick());
            ps.setString(3, u.getPass());
            ps.setString(4, u.getNombre());
            ps.setString(5, u.getApellidos());
            ps.setInt(6, u.getEdad());
            ps.setString(7, u.getSexo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    //----------------------------------------------------------
    public static void Borrar_User(String email) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "DELETE FROM `user` WHERE email = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }

    public static void sombrero_seleccionador(int i, int id, int valoracion) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "INSERT INTO casa_estudiante  VALUES (?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, i);
            ps.setInt(2, id);
            ps.setInt(3, valoracion);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
    public static void EnviarMensaje(int id,String para,String asunto,String cuerpo,Date fecha){
        ConexionEstatica.nueva();
        String sql = "INSERT INTO mensajes VALUES (null,?,(select id_us from user where email=?),?,?,?,0)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, para);
            ps.setString(3, asunto);
            ps.setString(4, cuerpo);
            ps.setDate(5,  fecha);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
    }
}

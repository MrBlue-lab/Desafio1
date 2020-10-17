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
                if (ConexionEstatica.Conj_Registros.next()){
                    existe = new User(Conj_Registros.getInt("id_us"), Conj_Registros.getString("email"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"));
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static String User_tiene_casa(int id) {
        ConexionEstatica.nueva();
        String tiene = "";
        try {
            String sentencia = "SELECT * FROM casa_estudiante,casas WHERE casa_estudiante.id_us = '" + id + "' && casa_estudiante.id_int=casas.id_int ";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                tiene = Conj_Registros.getString("nombre");
            }
            ConexionEstatica.cerrarBD();
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return tiene;//Si devolvemos null el usuario no existe.
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
     * @param email
     * @param nombre
     * @param apellido
     * @throws java.sql.SQLException
     */
    /**
     * //---------------------------------------------------------- public
     * static void Modificar_User(String email, String nombre, String apellido)
     * throws SQLException { String Sentencia = "UPDATE usuarios SET nombre = '"
     * + nombre + "',apellidos = '" + apellido + "' WHERE email = '" + email +
     * "'"; ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia); }
     *
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

    /*
    //----------------------------------------------------------
    public static void Borrar_User(String email) throws SQLException {
        String Sentencia = "DELETE FROM `usuarios` WHERE email = '" + email + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }
**/
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
}

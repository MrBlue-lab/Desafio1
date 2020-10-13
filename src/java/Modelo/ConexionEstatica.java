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

    public static User loguin(String email, String pass) {
        User existe = null;
        try {
            String sentencia = "SELECT * FROM usuarios WHERE email = '" + email + "' && pass = '" + pass + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new User(Conj_Registros.getInt("tipo"), Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellidos"), Conj_Registros.getString("pass"), Conj_Registros.getInt("edad"), Conj_Registros.getString("curso"), Conj_Registros.getString("sexo"), Conj_Registros.getString("fecha"));;
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerUsuarios() {
        LinkedList personasBD = new LinkedList<>();
        User p = null;
        try {
            String sentencia = "SELECT * FROM usuarios";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                p = new User(Conj_Registros.getInt("tipo"), Conj_Registros.getString("email"), Conj_Registros.getString("nombre"), Conj_Registros.getString("apellidos"), Conj_Registros.getString("pass"), Conj_Registros.getInt("edad"), Conj_Registros.getString("curso"), Conj_Registros.getString("sexo"), Conj_Registros.getString("fecha"));;
                personasBD.add(p);
            }
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

    //----------------------------------------------------------
    public static void Modificar_User(String email, String nombre, String apellido) throws SQLException {
        String Sentencia = "UPDATE usuarios SET nombre = '" + nombre + "',apellidos = '" + apellido + "' WHERE email = '" + email + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void Insertar_User(User u) throws SQLException {
        String Sentencia = "INSERT INTO usuarios  VALUES ('" + u.getEmail() + "', '" + u.getNombre() + "', '" + u.getApellidos() + "', '" + u.getPass() + "', " + u.getTipo() + ", " + u.getEdad() + ", '" + u.getCurso() + "', '" + u.getSexo() + "', '" + u.getFecha() + "')";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void Borrar_User(String email) throws SQLException {
        String Sentencia = "DELETE FROM `usuarios` WHERE email = '" + email + "'";
        ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
    }

}

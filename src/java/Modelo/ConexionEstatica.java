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
        String sql = "SELECT * FROM user WHERE email = ? && pass = ? && validado = 1";
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
                    existe = new User(Conj_Registros.getInt("id_us"), email, pass, Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
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
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList getPosiblesAmigos(int id) {
        ConexionEstatica.nueva();
        LinkedList personasBD = new LinkedList<>();
        User p = null;
        PreparedStatement ps = null;
        String sql = "SELECT DISTINCT user.*,casa_estudiante.valoracion from user,casa_estudiante where casa_estudiante.id_int=(SELECT id_int FROM casa_estudiante WHERE id_us=?) && casa_estudiante.id_us=user.id_us && user.id_us != ? && user.id_us Not IN (SELECT user.id_us FROM user,amigos WHERE (amigos.id_us =? && amigos.id_amigo=user.id_us) || (amigos.id_amigo = ? && amigos.id_us = user.id_us)) ORDER BY (select casa_estudiante.valoracion FROM user,casa_estudiante where user.id_us = casa_estudiante.id_us && user.id_us=?) ";
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.setInt(3, id);
            ps.setInt(4, id);
            ps.setInt(5, id);
            ConexionEstatica.Conj_Registros = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                while (ConexionEstatica.Conj_Registros.next()) {
                    p = new User(Conj_Registros.getInt("id_us"), Conj_Registros.getString("email"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                    personasBD.add(p);
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return personasBD;
    }

    public static int getAmigos(LinkedList usuarios_online, int id) {
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        int cont = 0;
        User p;
        for (int i = 0; i < usuarios_online.size(); i++) {
            p = (User) usuarios_online.get(i);
            String sql = "SELECT DISTINCT * from user,casa_estudiante where casa_estudiante.id_int=(SELECT id_int FROM casa_estudiante WHERE id_us=?) && casa_estudiante.id_us=user.id_us && user.id_us != ? && user.id_us not IN (SELECT user.id_us FROM user,amigos WHERE (amigos.id_us=?) || (amigos.id_amigo = ?)) ";
            try {
                ps = ConexionEstatica.Conex.prepareStatement(sql);
                ps.setInt(1, id);
                ps.setInt(1, p.getId());
                ps.setInt(1, id);
                ps.setInt(1, p.getId());
                ConexionEstatica.Conj_Registros = ps.executeQuery();
            } catch (SQLException ex) {
                System.out.println("Error de SQL: " + ex.getMessage());
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            } finally {
                try {
                    while (ConexionEstatica.Conj_Registros.next()) {
                        cont++;
                    }
                    ps.close();
                    ConexionEstatica.cerrarBD();
                } catch (Exception ex) {
                    System.out.println("Error general: " + ex.getMessage());
                }
            }
        }
        return cont;
    }

    public static LinkedList getAmigos2(int id) {
        LinkedList list = new LinkedList();
        ConexionEstatica.nueva();
        PreparedStatement ps = null;
        int cont = 0;
        User p;
        String sql = "SELECT * from user WHERE user.id_us=(SELECT id_us from amistad where id_amigo = ?) OR user.id_us=(SELECT id_us from amistad where id_us = ?);";
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ConexionEstatica.Conj_Registros = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                while (ConexionEstatica.Conj_Registros.next()) {
                    p = new User(Conj_Registros.getInt("id_us"), Conj_Registros.getString("email"), Conj_Registros.getString("pass"), Conj_Registros.getString("nombre"), Conj_Registros.getString("nick"), Conj_Registros.getString("apellidos"), Conj_Registros.getInt("edad"), Conj_Registros.getString("sexo"), Conj_Registros.getInt("rol"), Conj_Registros.getInt("validado"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                    list.add(p);
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return list;
    }

    /**
     * @param id
     * @return
     */
    public static LinkedList getNotificaciones(int id) {
        ConexionEstatica.nueva();
        LinkedList mensajesRE = new LinkedList<>();
        PreparedStatement ps = null;
        String sql = "SELECT * from user,amigos where (amigos.id_us = user.id_us && amigos.id_amigo = ?) && user.id_us != ?;";
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ConexionEstatica.Conj_Registros = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                Notificacion p;
                int cont = 0;
                while (ConexionEstatica.Conj_Registros.next()) {

                    p = new Notificacion(cont, Conj_Registros.getString("nick"), Conj_Registros.getString("email"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                    mensajesRE.add(p);
                    cont++;
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
                Mensaje p;
                while (ConexionEstatica.Conj_Registros.next()) {

                    p = new Mensaje(Conj_Registros.getInt("id_men"), Conj_Registros.getString("enviado"), Conj_Registros.getString("enviado_nick"), Conj_Registros.getString("recibido"), Conj_Registros.getString("asunto"), Conj_Registros.getString("contenido"), Conj_Registros.getString("fecha"), Conj_Registros.getInt("leido"), Conj_Registros.getBytes("img"), Conj_Registros.getBlob("img"));
                    p.setDir(Conj_Registros.getString("archivo"));
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

    public static String getInfo(String casa) {
        ConexionEstatica.nueva();
        String info = null;
        PreparedStatement ps = null;
        String sql = "SELECT descripcion FROM casas where nombre = ?";
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, casa);
            ConexionEstatica.Conj_Registros = ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error de SQL: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error general: " + ex.getMessage());
        } finally {
            try {
                while (ConexionEstatica.Conj_Registros.next()) {
                    info = Conj_Registros.getString("descripcion");
                }
                ps.close();
                ConexionEstatica.cerrarBD();
            } catch (Exception ex) {
                System.out.println("Error general: " + ex.getMessage());
            }
        }
        return info;
    }

    /**
     * @param email
     * @param nombre
     * @param nick
     * @param apellido
     * @param edad
     * @param sexo
     * @param rol
     * @param validado
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
     * @param user
     * @throws java.sql.SQLException
     */
    //---------------------------------------------------------- public
    public static void Modificar_User(User user) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "UPDATE `user` SET `nick` = ?, `nombre` = ?, `apellidos` = ?, `edad` = ?, `sexo` = ?, `pass` = ?, `img` = ? WHERE `email` = ?";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(1, user.getNick());
            ps.setString(2, user.getNombre());
            ps.setString(3, user.getApellidos());
            ps.setInt(4, user.getEdad());
            ps.setString(5, user.getSexo());
            ps.setString(6, user.getPass());
            ps.setBytes(7, user.getFoto());
            ps.setString(8, user.getEmail());
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
        String sql = "INSERT INTO `user` (`id_us`, `email`, `nick`, `pass`, `nombre`, `apellidos`, `edad`, `sexo`, `img`, `rol`, `validado`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, '1', '0');";
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
            ps.setBytes(8, u.getFoto());
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

    public static void EnviarMensaje(int id, String para, String asunto, String cuerpo, Date fecha, String dir) {
        ConexionEstatica.nueva();
        String sql = "INSERT INTO mensajes VALUES (null,?,(select id_us from user where email=?),?,?,?,0,?)";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, para);
            ps.setString(3, asunto);
            ps.setString(4, cuerpo);
            ps.setDate(5, fecha);
            ps.setString(6, dir);
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

    public static void agregarAmigo(int id, String email) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "INSERT INTO `amigos` (`id_us`, `id_amigo`) VALUES (?, (SELECT id_us FROM user where email=?));";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, email);
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

    public static void aceptarAmigo(int id, String email) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "INSERT INTO `amistad` (`id_us`, `id_amigo`) VALUES (?, (SELECT id_us FROM user where email=?));";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setString(2, email);
            ps.setInt(1, id);
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
    public static void rechazarAmigo(int id, String email) throws SQLException {
        ConexionEstatica.nueva();
        String sql = "DELETE FROM `amigos` WHERE id_us = (select id_us from user where email = ?) AND (id_amigo = ?);";
        PreparedStatement ps = null;
        try {
            ps = ConexionEstatica.Conex.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, email);
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

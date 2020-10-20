/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author daw205
 */
public class Mensaje {
    int id_men;
    String email_env;
    String enviado_nick;
    String email_rez;
    String asunto;
    String contenido;
    String fecha;
    int leido;
    private byte[] foto;
    private Blob fotoBlob;

    public Mensaje(int id_men, String email_env, String enviado_nick, String email_rez, String asunto, String contenido, String fecha, int leido, byte[] foto, Blob fotoBlob) {
        this.id_men = id_men;
        this.email_env = email_env;
        this.enviado_nick = enviado_nick;
        this.email_rez = email_rez;
        this.asunto = asunto;
        this.contenido = contenido;
        this.fecha = fecha;
        this.leido = leido;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
    }

    public Mensaje(int id_men, String email_env, String email_rez, String asunto, String contenido, String fecha, int leido) {
        this.id_men = id_men;
        this.email_env = email_env;
        this.email_rez = email_rez;
        this.asunto = asunto;
        this.contenido = contenido;
        this.fecha = fecha;
        this.leido = leido;
    }

    public Mensaje(int id_men, String email_env, String enviado_nick, String email_rez, String asunto, String contenido, String fecha, int leido) {
        this.id_men = id_men;
        this.email_env = email_env;
        this.enviado_nick = enviado_nick;
        this.email_rez = email_rez;
        this.asunto = asunto;
        this.contenido = contenido;
        this.fecha = fecha;
        this.leido = leido;
    }

    public void setLeido(int leido) {
        this.leido = leido;
    }

    public String getEnviado_nick() {
        return enviado_nick;
    }

    public int getId_men() {
        return id_men;
    }

    public String getEmail_env() {
        return email_env;
    }

    public String getEmail_rez() {
        return email_rez;
    }

    public String getAsunto() {
        return asunto;
    }

    public String getContenido() {
        return contenido;
    }

    public String getFecha() {
        return fecha;
    }

    public int getLeido() {
        return leido;
    }
    
    public String getFotoimgString() {
        String image =null;
        try {
            byte[] imageBytes = this.fotoBlob.getBytes(1, (int) this.fotoBlob.length());
            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
            image = "data:image/jpg;base64," + encodedImage;
            
        } catch (SQLException ex) {
        }
        return image;
    }
    
}

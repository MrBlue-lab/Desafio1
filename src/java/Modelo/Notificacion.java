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
public class Notificacion {
    
    int id_not;
    String enviado_nick;
    String email_env;
    private byte[] foto;
    private Blob fotoBlob;

    public Notificacion(int id_not, String enviado_nick, String email_env, byte[] foto, Blob fotoBlob) {
        this.id_not = id_not;
        this.enviado_nick = enviado_nick;
        this.email_env = email_env;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
    }

    public int getId_not() {
        return id_not;
    }

    public void setId_not(int id_not) {
        this.id_not = id_not;
    }

    public String getEnviado_nick() {
        return enviado_nick;
    }

    public void setEnviado_nick(String enviado_nick) {
        this.enviado_nick = enviado_nick;
    }

    public String getEmail_env() {
        return email_env;
    }

    public void setEmail_env(String email_env) {
        this.email_env = email_env;
    }


    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public Blob getFotoBlob() {
        return fotoBlob;
    }

    public void setFotoBlob(Blob fotoBlob) {
        this.fotoBlob = fotoBlob;
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

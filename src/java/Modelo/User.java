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
public class User {

    private final int id;
    private final String email;
    private String casa;
    private String pass;
    private String nombre;
    private String nick;
    private String apellidos;
    private int edad;
    private String sexo;
    private int rol;
    private int validado;
    private byte[] foto;
    private Blob fotoBlob;

    public User() {
        this.id=0;
        this.email="";
    }

    public User(int id, String email, String pass) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.casa="";
    }

    public User(int id, String email, String pass, int rol, int validado) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.rol = rol;
        this.validado = validado;
        this.casa="";
    }

    public User( String email, String pass, String nombre, String nick, String apellidos, int edad, String sexo) {
        this.id = 0;
        this.email = email;
        this.pass = pass;
        this.nombre = nombre;
        this.nick = nick;
        this.apellidos = apellidos;
        this.edad = edad;
        this.sexo = sexo;
        this.casa="";
    }


    public User(int id, String email, String pass, String nombre, String nick, String apellidos, int edad, String sexo, int rol, int validado) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.nombre = nombre;
        this.nick = nick;
        this.apellidos = apellidos;
        this.edad = edad;
        this.sexo = sexo;
        this.rol = rol;
        this.validado = validado;
        this.casa="";
    }
    public User(int id, String email, String nombre, String nick, String apellidos, int edad, String sexo, int rol, int validado) {
        this.id = id;
        this.email = email;
        this.nombre = nombre;
        this.nick = nick;
        this.apellidos = apellidos;
        this.edad = edad;
        this.sexo = sexo;
        this.rol = rol;
        this.validado = validado;
        this.casa="";
    }
    public User(String email, String nombre, String nick, String apellidos, int edad, String sexo, int rol, int validado) {
        this.id = 0;
        this.email = email;
        this.nombre = nombre;
        this.nick = nick;
        this.apellidos = apellidos;
        this.edad = edad;
        this.sexo = sexo;
        this.rol = rol;
        this.validado = validado;
        this.casa="";
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

    public String getNick() {
        return nick;
    }

    public String getCasa() {
        return casa;
    }

    public void setCasa(String casa) {
        this.casa = casa;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public int getValidado() {
        return validado;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public int isValidado() {
        return validado;
    }

    public void setValidado(int validado) {
        this.validado = validado;
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

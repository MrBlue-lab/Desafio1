/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author daw205
 */
public class User {

    private final int id;
    private final String email;
    private String pass;
    private String nombre;
    private String apellidos;
    private int edad;
    private String sexo;
    private int rol;
    private int validado;

    public User(int id, String email, String pass) {
        this.id = id;
        this.email = email;
        this.pass = pass;
    }

    public User(int id, String email, String pass, int rol, int validado) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.rol = rol;
        this.validado = validado;
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

}

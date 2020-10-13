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
    private int tipo;
    private final String email;
    private String nombre;
    private String apellidos;
    private String pass;
    private int edad;
    private String curso;
    private String sexo;
    private String fecha;
    private String [] asig;

    public User(int tipo, String email, String nombre, String apellidos, String pass, int edad, String curso, String sexo, String fecha) {
        this.tipo = tipo;
        this.email = email;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.pass = pass;
        this.edad = edad;
        this.curso = curso;
        this.sexo = sexo;
        this.fecha = fecha;
    }
    public User(int tipo, String email, String nombre, String apellidos, String pass, int edad, String curso, String sexo, String fecha, String[] asig) {
        this.tipo = tipo;
        this.email = email;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.pass = pass;
        this.edad = edad;
        this.curso = curso;
        this.sexo = sexo;
        this.fecha = fecha;
        this.asig = asig;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
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

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String[] getAsig() {
        return asig;
    }

    public void setAsig(String[] asig) {
        this.asig = asig;
    }

    @Override
    public String toString() {
        String aux=new String();
        for (int i = 0; i < asig.length; i++) {
            aux=aux+asig[i]+" ";
        }
        return "Persona{" + "nombre=" + nombre + ", apellidos=" + apellidos + ", edad=" + edad + ", curso=" + curso + ", sexo=" + sexo + ", fecha_creacion=" + fecha + ", asig=" + aux  + '}';
    }
    
}

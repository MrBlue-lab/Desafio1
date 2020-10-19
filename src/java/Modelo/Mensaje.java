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
public class Mensaje {
    int id_men;
    String email_env;
    String email_rez;
    String asunto;
    String contenido;
    String fecha;
    int leido;

    public Mensaje(int id_men, String email_env, String email_rez, String asunto, String contenido, String fecha, int leido) {
        this.id_men = id_men;
        this.email_env = email_env;
        this.email_rez = email_rez;
        this.asunto = asunto;
        this.contenido = contenido;
        this.fecha = fecha;
        this.leido = leido;
    }

    public void setLeido(int leido) {
        this.leido = leido;
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
    
    
}

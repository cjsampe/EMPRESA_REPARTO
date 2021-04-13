package com.sanvalero.cdaexpres.domain;

/**
 * Un cliente
 */
public class Cliente extends Persona {

    private int id;
    private String email;
    

    public Cliente(int id, String nombre, String dni, String telefono, String email) {
        super(nombre,dni,telefono);
        this.id = id;
        this.email = email;
    }

    public Cliente(String nombre, String dni, String telefono, String email) {
        super(nombre,dni,telefono);
        this.email = email;       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
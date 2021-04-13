package com.sanvalero.cdaexpres.domain;

/**
 * Un repartidor
 */
public class Repartidores {

    private int id;
    private String nombre;
    private String dni;
    private String telefono;
    private int salario;
    

    public Repartidores(int id, String nombre, String dni, String telefono, int salario) {
        this.id = id;
        this.nombre = nombre;
        this.dni = dni;
        this.telefono = telefono;
        this.salario = salario;
        
    }

    public Repartidores(String nombre, String dni, String telefono, int salario) {
        this.nombre = nombre;
        this.dni = dni;
        this.telefono = telefono;
        this.salario = salario;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    
}

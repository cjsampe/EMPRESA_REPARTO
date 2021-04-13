package com.sanvalero.cdaexpres.domain;

/**
 * Un repartidor
 */
public class Repartidor extends Persona {

    private int id;
    private float salario;
    

    public Repartidor(int id, String nombre, String dni, String telefono, float salario) {
        super(nombre,dni,telefono);
        this.id = id;
        this.salario = salario;
        
    }

    public Repartidor(String nombre, String dni, String telefono, float salario) {
        super(nombre,dni,telefono);
        this.salario = salario;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    
}

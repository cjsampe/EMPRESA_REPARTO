package com.sanvalero.cdaexpres.domain;

/**
 *
 * Un vehiculo
 */
public class Vehiculos {
    private int id;
    private String tipo;
    private String marca;
    private String modelo;
    private String matricula;

    public Vehiculos(int id, String tipo, String marca, String modelo, String matricula) {
        this.id = id;
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
        this.matricula = matricula;
    }

    public Vehiculos(String tipo, String marca, String modelo, String matricula) {
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
        this.matricula = matricula;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    
    
    
}

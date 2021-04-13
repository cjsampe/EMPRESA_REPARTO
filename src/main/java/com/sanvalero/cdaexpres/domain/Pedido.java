package com.sanvalero.cdaexpres.domain;

/**
 *
 * Un pedido
 */
public class Pedido {
    private int idPedido;
    private String fechaEnvio;
    private String direccion;
    private float peso;
    private float precio;
    private boolean fragil;
    private boolean urgente;
    private Cliente cliente;
    private Repartidor repartidor;
    private Vehiculo vehiculo;

    public Pedido(int idPedido, String fechaEnvio, String direccion, float peso, float precio, boolean fragil, boolean urgente, Cliente cliente, Repartidor repartidor, Vehiculo vehiculo) {
        this.idPedido = idPedido;
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.peso = peso;
        this.precio = precio;
        this.fragil = fragil;
        this.urgente = urgente;
        this.vehiculo = vehiculo;
        this.repartidor = repartidor;
        this.cliente = cliente;
    }

    public Pedido(String fechaEnvio, String direccion, float peso, float precio, boolean fragil, boolean urgente) {
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.peso = peso;
        this.precio = precio;
        this.fragil = fragil;
        this.urgente = urgente;
    }
    
    
    
}

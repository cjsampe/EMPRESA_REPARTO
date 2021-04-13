package com.sanvalero.cdaexpres.domain;

/**
 *
 * Un pedido
 */
public class Pedidos {
    private int idPedido;
    private int idVehiculo;
    private int idRepartidor;
    private int idCliente;
    private String fechaEnvio;
    private String direccion;
    private int peso;
    private int precio;
    private boolean fragil;
    private boolean urgente;

    public Pedidos(int idPedido, int idVehiculo, int idRepartidor, int idCliente, String fechaEnvio, String direccion, int peso, int precio, boolean fragil, boolean urgente) {
        this.idPedido = idPedido;
        this.idVehiculo = idVehiculo;
        this.idRepartidor = idRepartidor;
        this.idCliente = idCliente;
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.peso = peso;
        this.precio = precio;
        this.fragil = fragil;
        this.urgente = urgente;
    }

    public Pedidos(String fechaEnvio, String direccion, int peso, int precio, boolean fragil, boolean urgente) {
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.peso = peso;
        this.precio = precio;
        this.fragil = fragil;
        this.urgente = urgente;
    }
    
    
    
}

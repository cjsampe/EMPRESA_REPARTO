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

    public int getIdPedido() {
        return idPedido;
    }

    public String getFechaEnvio() {
        return fechaEnvio;
    }

    public String getDireccion() {
        return direccion;
    }

    public float getPeso() {
        return peso;
    }

    public float getPrecio() {
        return precio;
    }

    public boolean isFragil() {
        return fragil;
    }

    public boolean isUrgente() {
        return urgente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public Repartidor getRepartidor() {
        return repartidor;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public void setFechaEnvio(String fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setFragil(boolean fragil) {
        this.fragil = fragil;
    }

    public void setUrgente(boolean urgente) {
        this.urgente = urgente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public void setRepartidor(Repartidor repartidor) {
        this.repartidor = repartidor;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
}

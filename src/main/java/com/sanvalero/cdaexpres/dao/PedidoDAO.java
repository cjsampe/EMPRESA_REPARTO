
package com.sanvalero.cdaexpres.dao;

import com.sanvalero.cdaexpres.domain.Cliente;
import com.sanvalero.cdaexpres.domain.Pedido;
import com.sanvalero.cdaexpres.domain.Repartidor;
import com.sanvalero.cdaexpres.domain.Vehiculo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PedidoDAO {

    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USUARIO = "PEDIDOS";
    private final String CONTRASENA = "PEDIDOS";
    
    private Connection connection;
    
    public PedidoDAO() {
        connect();
    }
    
    /**
     * Conecta con la base de datos
     */
    public void connect() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL_CONEXION, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    /**
     * Desconecta de la base de datos
     */
    public void disconnect() {
        try {
            connection.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
    
    /**
     * Añade un cliente a la base de datos
     * @param cliente con la información que se quiere registrar
     * @throws SQLException 
     */
    public void addPedido(Pedido pedido) throws SQLException {
        String sql = "INSERT INTO pedidos (vehiculo_id, repartidor_id, cliente_id, fecha_envio, direccion, peso, precio, fragil, urgente) " +
                "VALUES (?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'), ?, ?, ?, ?, ?)";
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        
        // Cambiar formato booleano a int para la base de datos
        int fragil = 0;
        int urgente = 0;
        if (pedido.isFragil()) {
            fragil = 1;
        }
        if (pedido.isUrgente()) {
            urgente = 1;
        }
        
        sentencia.setInt(1, pedido.getVehiculo().getId());
        sentencia.setInt(2, pedido.getRepartidor().getId());
        sentencia.setInt(3, pedido.getCliente().getId());
        sentencia.setString(4, pedido.getFechaEnvio());
        sentencia.setString(5, pedido.getDireccion());
        sentencia.setFloat(6, pedido.getPeso());
        sentencia.setFloat(7, pedido.getPrecio());
        sentencia.setInt(8, fragil);
        sentencia.setInt(9, urgente);
        sentencia.executeUpdate();
    }
    
    /**
     * Obtiene la lista de clientes de la base de datos
     * @return Una colección con los clientes
     */
    public ArrayList<Pedido> getAllPedidos() throws SQLException { 
        String sql = "SELECT p.direccion, p.peso, p.precio, p.fragil, p.urgente, "
                + "c.nombre, r.nombre, v.tipo FROM pedidos p, clientes c, repartidores r, vehiculos v WHERE "
                + "p.cliente_id = c.cliente_id AND p.repartidor_id = r.repartidor_id AND p.vehiculo_id = v.vehiculo_id";
        ArrayList<Pedido> pedidos = new ArrayList<>();
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        ResultSet resultado = sentencia.executeQuery();
        while (resultado.next()) {
        // Cambiar formato int a booleano por la base de datos
            boolean fragil = false;
            boolean urgente = false;
            if (resultado.getInt(4) == 1) {
                fragil = true;
            }
            if (resultado.getInt(5) == 1) {
                urgente = true;
            }

            Cliente cliente = new Cliente(0,resultado.getString(6),null,null,null);
            Repartidor repartidor = new Repartidor(0,resultado.getString(7),null,null,0);
            Vehiculo vehiculo = new Vehiculo(0,resultado.getString(8),null,null,null);
            Pedido pedido = new Pedido(0, null, resultado.getString(1), resultado.getFloat(2), resultado.getFloat(3), fragil, urgente, cliente, repartidor, vehiculo);
            pedidos.add(pedido);
        }
        
       
        return pedidos;
    }
    
    /**
     * Obtiene la lista de pedidos de un cliente seleccionado
     * @param id del cliente a consultar
     * @return Una colección con los pedidos
     */
    public ArrayList<Pedido> getPedidosCliente(Cliente cliente) throws SQLException { 
        String sql = "SELECT p.fecha_envio, p.direccion, p.peso, p.precio, p.fragil, p.urgente FROM pedidos p WHERE "
                + "p.cliente_id = ?";
        ArrayList<Pedido> pedidos = new ArrayList<>();
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setInt(1, cliente.getId());
        ResultSet resultado = sentencia.executeQuery();
        while (resultado.next()) {
        // Cambiar formato int a booleano por la base de datos
            boolean fragil = false;
            boolean urgente = false;
            if (resultado.getInt(4) == 1) {
                fragil = true;
            }
            if (resultado.getInt(5) == 1) {
                urgente = true;
            }

            Pedido pedido = new Pedido(0, resultado.getString(1), resultado.getString(2), resultado.getFloat(3), resultado.getFloat(4), fragil, urgente, null, null, null);
            pedidos.add(pedido);
        }
        
       
        return pedidos;
    }
    
    
    /**
     * Elimina un cliente
     * @param id El id del cliente a eliminar
     */
    public void removePedido(int id) throws SQLException {
        String sql = "DELETE FROM pedidos WHERE pedido_id = (?)";

        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setInt(1, id);
        sentencia.executeUpdate();
    }
    
    
    /**
     * Modifica la información de un cliente
     * @param cliente La película con la información a modificar
     */
    public void modifyMovie(Cliente cliente) {
        
    }
}

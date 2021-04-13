
package com.sanvalero.cdaexpres.dao;

import com.sanvalero.cdaexpres.domain.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClienteDAO {

    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USUARIO = "PEDIDOS";
    private final String CONTRASENA = "PEDIDOS";
    
    private Connection connection;
    
    public ClienteDAO() {
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
    public void addCliente(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO clientes (nombre, dni, telefono, email) " +
                "VALUES (?, ?, ?, ?)";
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, cliente.getNombre());
        sentencia.setString(2, cliente.getDni());
        sentencia.setString(3, cliente.getTelefono());
        sentencia.setString(4, cliente.getEmail());
        sentencia.executeUpdate();
    }
    
    /**
     * Obtiene la lista de clientes de la base de datos
     * @return Una colección con los clientes
     */
    public ArrayList<Cliente> getAllClientes() throws SQLException { 
        String sql = "SELECT cliente_id, nombre, dni, telefono, email FROM clientes";
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        ResultSet resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Cliente cliente = new Cliente(resultado.getInt(1), resultado.getString(2),
                    resultado.getString(3), resultado.getString(4), resultado.getString(5));
            clientes.add(cliente);
        }
        return clientes;
    }
    
    /**
     * Obtiene un cliente de la base de datos
     * @param dni para buscar por el cliente
     * @return Una colección con el clientee encontrado
     */
    public ArrayList<Cliente> getClientesDni(String dni) throws SQLException { 
        String sql = "SELECT cliente_id, nombre, dni, telefono, email FROM clientes WHERE "
                + "dni = (?)";
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, dni);
        ResultSet resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Cliente cliente = new Cliente(resultado.getInt(1), resultado.getString(2),
                    resultado.getString(3), resultado.getString(4), resultado.getString(5));
            clientes.add(cliente);
        }
        return clientes;
    }
    
    /**
     * Elimina un cliente
     * @param id El id del cliente a eliminar
     */
    public void removeCliente(String dni) throws SQLException {
        String sql = "DELETE FROM clientes WHERE dni = (?)";

        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, dni);
        sentencia.executeUpdate();
    }
    
    /**
     * Modifica la información de un cliente
     * @param cliente El cliente con la información a modificar
     */
    public void modifyCliente(Cliente cliente) {
                 
    }
}

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
            Cliente cliente = new Cliente(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5));

            clientes.add(cliente);
        }
        
       
        return clientes;
    }
    
    
    /**
     * Elimina un cliente
     * @param id El id del cliente a eliminar
     */
    public void removeCliente(int id) throws SQLException {
        String sql = "DELETE FROM clientes WHERE cliente_id = (?)";

        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setInt(1, id);
        sentencia.executeUpdate();
    }
    
    /**
     * Busca si existe un cliente con el DNI introducido
     * Si no hay ninguno, al quedar el nombre vacío se devuelve un error
     * @param dni
     * @return cliente
     * @throws SQLException 
     */
    public Cliente buscarCliente(String dni) throws SQLException {
        String sql = "Select c.cliente_id, nombre FROM clientes c WHERE c.dni = ?";
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, dni);
        ResultSet resultado = sentencia.executeQuery();
        Cliente cliente = new Cliente(0,null,null,null,null);
        while (resultado.next()) {
            cliente.setId(resultado.getInt(1));
            cliente.setNombre(resultado.getString(2));
        }
        return cliente;
    }
    
    
    /**
     * Modifica la información de un cliente
     * @param cliente La película con la información a modificar
     */
    public void modifyMovie(Cliente cliente) {
        
    }
}

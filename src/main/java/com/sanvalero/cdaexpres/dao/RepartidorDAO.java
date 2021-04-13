
package com.sanvalero.cdaexpres.dao;

import com.sanvalero.cdaexpres.domain.Repartidor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RepartidorDAO {

    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USUARIO = "PEDIDOS";
    private final String CONTRASENA = "PEDIDOS";
    
    private Connection connection;
    
    public RepartidorDAO() {
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
     * Busca si existe un repartidor con el DNI introducido
     * Si no hay ninguno, al quedar el nombre vacío se devuelve un error
     * @param dni
     * @return repartidor
     * @throws SQLException 
     */
    public Repartidor buscarRepartidor(String dni) throws SQLException {
        String sql = "Select r.repartidor_id, nombre FROM repartidores r WHERE r.dni = ?";
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, dni);
        ResultSet resultado = sentencia.executeQuery();
        Repartidor repartidor = new Repartidor(0,null,null,null,0);
        while (resultado.next()) {
            repartidor.setId(resultado.getInt(1));
            repartidor.setNombre(resultado.getString(2));
        }
        return repartidor;
    }
}

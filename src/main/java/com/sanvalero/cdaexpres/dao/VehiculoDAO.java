
package com.sanvalero.cdaexpres.dao;

import com.sanvalero.cdaexpres.domain.Vehiculo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VehiculoDAO {

    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USUARIO = "PEDIDOS";
    private final String CONTRASENA = "PEDIDOS";
    
    private Connection connection;
    
    public VehiculoDAO() {
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
     * Busca si existe un vehículo con la matrícula introducida
     * Si no hay ninguno, al quedar el tipo vacío se devuelve un error
     * @param matricula
     * @return vehículo
     * @throws SQLException 
     */
    public Vehiculo buscarVehiculo(String matricula) throws SQLException {
        String sql = "Select v.vehiculo_id, v.tipo FROM vehiculos v WHERE v.matricula = ?";
        PreparedStatement sentencia = connection.prepareStatement(sql);
        sentencia.setString(1, matricula);
        ResultSet resultado = sentencia.executeQuery();
        Vehiculo vehiculo = new Vehiculo(0,null,null,null,null);
        while (resultado.next()) {
            vehiculo.setId(resultado.getInt(1));
            vehiculo.setTipo(resultado.getString(2));
        }
        return vehiculo;
    }
}
package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.ClienteDAO;
import com.sanvalero.cdaexpres.dao.RepartidorDAO;
import com.sanvalero.cdaexpres.dao.VehiculoDAO;
import com.sanvalero.cdaexpres.dao.PedidoDAO;
import com.sanvalero.cdaexpres.domain.Cliente;
import com.sanvalero.cdaexpres.domain.Pedido;
import com.sanvalero.cdaexpres.domain.Repartidor;
import com.sanvalero.cdaexpres.domain.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que añade un pedido a la base de datos
 */
@WebServlet(name = "new-order", urlPatterns = {"/new-order"})
public class AddPedidoInglesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        boolean fragil = false;
        boolean urgente = false;
        // TODO La fecha requiere que el usuario introduzca un valor en formato dd/mm/yyyy. Cambiar el input por uno más seguro
        String fecha = request.getParameter("fecha");
        String direccion = request.getParameter("direccion");
        // TODO Estos float solo funcionan si el usuario introduce un valor en formato 1.0 (Con punto funciona. Con una coma produce error).
        float peso = Float.parseFloat(request.getParameter("peso"));
        float precio = Float.parseFloat(request.getParameter("precio"));

        // Solución para el problema de dejar la checkbox en blanco
        String fragilCheckbox = request.getParameter("fragil");
        String urgenteCheckbox = request.getParameter("urgente");
        if (fragilCheckbox != null) {
            fragil = true;
        }
        if (urgenteCheckbox != null) {
            urgente = true;
        }
        
        String dniCliente = request.getParameter("dniCliente");
        String dniRepartidor = request.getParameter("dniRepartidor");
        String matricula = request.getParameter("matricula");

        PedidoDAO pedidoDAO = new PedidoDAO();
        ClienteDAO clienteDAO = new ClienteDAO();
        RepartidorDAO repartidorDAO = new RepartidorDAO();
        VehiculoDAO vehiculoDAO = new VehiculoDAO();

        try {
            Cliente cliente = clienteDAO.buscarCliente(dniCliente);
            Repartidor repartidor = repartidorDAO.buscarRepartidor(dniRepartidor);
            Vehiculo vehiculo = vehiculoDAO.buscarVehiculo(matricula);
            if (cliente.getNombre() == null) {
                response.sendRedirect("pedido_ingles.jsp?status=cliente_error");
            } else if (repartidor.getNombre() == null) {
                response.sendRedirect("pedido_ingles.jsp?status=repartidor_error");
            } else if (vehiculo.getTipo() == null) {
                response.sendRedirect("pedido_ingles.jsp?status=vehiculo_error");
            } else {
                Pedido pedido = new Pedido(0, fecha, direccion, peso, precio, fragil, urgente, cliente, repartidor, vehiculo);
                pedidoDAO.addPedido(pedido);
                PrintWriter out = response.getWriter();
                response.sendRedirect("pedido_ingles.jsp?status=ok");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.sendRedirect("pedido_ingles.jsp?status=error");
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
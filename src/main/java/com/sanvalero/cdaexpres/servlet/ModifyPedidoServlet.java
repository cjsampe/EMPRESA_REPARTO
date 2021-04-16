package com.sanvalero.cdaexpres.servlet;


import com.sanvalero.cdaexpres.dao.PedidoDAO;
import com.sanvalero.cdaexpres.domain.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que elimina un cliente de la base de datos
 */
@WebServlet(name = "modify-pedido", urlPatterns = {"/modify-pedido"})
public class ModifyPedidoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        boolean fragil = false;
        boolean urgente = false;
        int id = Integer.parseInt(request.getParameter("id"));
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

        PedidoDAO pedidoDAO = new PedidoDAO();

        try {
            Pedido pedido = new Pedido(id, fecha, direccion, peso, precio, fragil, urgente, null, null, null);
            pedidoDAO.modificarPedido(pedido);
            PrintWriter out = response.getWriter();
            response.sendRedirect("pedido.jsp?status=ok");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.sendRedirect("pedido.jsp?status=error");
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

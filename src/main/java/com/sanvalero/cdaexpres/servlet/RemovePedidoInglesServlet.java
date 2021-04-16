package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.PedidoDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que elimina un cliente de la base de datos
 */
@WebServlet(name = "remove-order", urlPatterns = {"/remove-order"})
public class RemovePedidoInglesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("eliminarPedido"));        
        PedidoDAO pedidoDAO = new PedidoDAO();
        try {
            pedidoDAO.removePedido(id);
            response.sendRedirect("pedido_ingles.jsp?status=ok");
        }catch (SQLException sqle) {
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

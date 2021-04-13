package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.PedidoDAO;
import com.sanvalero.cdaexpres.domain.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que obtiene la lista completa de clientes de la base de datos
 */
@WebServlet(name = "pedidos", urlPatterns = {"/pedidos"})
public class GetPedidosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<p>Listado de clientes (con servlet)</p>");
        PedidoDAO pedidoDAO = new PedidoDAO();
        try {
            ArrayList<Pedido> pedidos = pedidoDAO.getAllPedidos();
            out.println("<ul>");
            for (Pedido pedido : pedidos) {
                out.println("<li>" + pedido.getDireccion() + " <a href='remove-pedido?id=" + pedido.getIdPedido() + "'>Eliminar</a></li>");
            }
            // FIXME cliente de ejemplo (eliminar cuando se desarrolle el listado)
            out.println("<li>Pedido de ejemplo</li> <a href='remove-cliente?id=23'>Eliminar</a></li>");
            out.println("</ul>");

            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (!message.equals("")) {
                out.println("<p style='color:green'>" + message + "</p>");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
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

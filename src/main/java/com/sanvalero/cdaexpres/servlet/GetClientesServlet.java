package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.ClienteDAO;
import com.sanvalero.cdaexpres.domain.Cliente;
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
@WebServlet(name = "clientes", urlPatterns = {"/clientes"})
public class GetClientesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<p>Listado de clientes (con servlet)</p>");
        ClienteDAO clienteDAO = new ClienteDAO();
        try {
            ArrayList<Cliente> clientes = clienteDAO.getAllClientes();
            out.println("<ul>");
            for (Cliente cliente : clientes) {
                out.println("<li>" + cliente.getNombre() + " <a href='remove-cliente?id=" + cliente.getId() + "'>Eliminar</a></li>");
            }
            // FIXME cliente de ejemplo (eliminar cuando se desarrolle el listado)
            out.println("<li>Cliente de ejemplo</li> <a href='remove-cliente?id=23'>Eliminar</a></li>");
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

package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.ClienteDAO;
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
@WebServlet(name = "remove-cliente", urlPatterns = {"/remove-cliente"})
public class RemoveClienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int clienteId = Integer.parseInt(request.getParameter("id"));        
        ClienteDAO clienteDAO = new ClienteDAO();
        try{
        clienteDAO.removeCliente(clienteId);
        response.sendRedirect("clientes?message=Cliente eliminado");
        }catch (SQLException sqle) {
            sqle.printStackTrace();
            response.sendRedirect("myform_1.jsp?status=error");
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

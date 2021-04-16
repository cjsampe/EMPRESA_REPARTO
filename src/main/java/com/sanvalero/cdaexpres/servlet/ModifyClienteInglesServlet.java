package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.ClienteDAO;
import com.sanvalero.cdaexpres.domain.Cliente;
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
@WebServlet(name = "modify-customer", urlPatterns = {"/modify-customer"})
public class ModifyClienteInglesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        ClienteDAO clienteDAO = new ClienteDAO();
        Cliente cliente = new Cliente(id,nombre,dni,telefono,email);
        try{
            clienteDAO.modifyCliente(cliente);
            response.sendRedirect("cliente_ingles.jsp?status=ok");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            response.sendRedirect("cliente_ingles.jsp?status=error");
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

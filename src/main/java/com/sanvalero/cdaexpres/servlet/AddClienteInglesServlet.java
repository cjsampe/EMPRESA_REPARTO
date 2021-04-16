package com.sanvalero.cdaexpres.servlet;

import com.sanvalero.cdaexpres.dao.ClienteDAO;
import com.sanvalero.cdaexpres.domain.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que añade un cliente a la base de datos
 */
@WebServlet(name = "new-cliente", urlPatterns = {"/new-cliente"})
public class AddClienteInglesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
                
        Cliente cliente = new Cliente(nombre, dni, telefono, email);
        ClienteDAO clienteDAO = new ClienteDAO();
        try {
            clienteDAO.addCliente(cliente);
            PrintWriter out = response.getWriter();
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
<%@page import="com.sanvalero.ctaexpres.domain.Cliente"%>
<%@page import="com.sanvalero.ctaexpres.dao.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
    </head>
    <body>
        <h1>Lista de Clientes (con JSP)</h1>
        <%
            ClienteDAO clienteDAO = new ClienteDAO();
            ArrayList<Cliente> clientes = clienteDAO.getAllClientes();
        %>
        <ul>
        <%
            for (Cliente cliente : clientes) {
        %>
        <li><%= cliente.getNombre()%> <a href="remove-cliente?id=<%= cliente.getId() %>">Eliminar</a></li>
        <%    
            }
        %>
        </ul>
        <!-- FIXME Clientede ejemplo (eliminar cuando se desarrolle el listado) -->
        <li>Cliente de ejemplo <a href="remove-cliente?id=45">Eliminar</a></li>
        <%
            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <p style='color:green'><%= message %></p>
        <%        
            }
        %>
    </body>
</html>

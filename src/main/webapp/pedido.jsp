<%@page import="com.sanvalero.cdaexpres.domain.Pedido"%>
<%@page import="com.sanvalero.cdaexpres.dao.PedidoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de pedidos</title>
    </head>
    <body>
        <h1>Lista de Clientes (con JSP)</h1>
        <%
            PedidoDAO pedidoDAO = new PedidoDAO();
            ArrayList<Pedido> pedidos = pedidoDAO.getAllPedidos();
        %>
        <ul>
        <%
            for (Pedido pedido : pedidos) {
        %>
        <li><%= pedido.getFechaEnvio() + "" + pedido.getDireccion()%> <a href="remove-pedido?id=<%= pedido.getIdPedido() %>">Eliminar</a></li>
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

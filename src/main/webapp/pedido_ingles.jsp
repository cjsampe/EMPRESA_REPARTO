<%@page import="com.sanvalero.cdaexpres.dao.VehiculoDAO"%>
<%@page import="com.sanvalero.cdaexpres.dao.ClienteDAO"%>
<%@page import="com.sanvalero.cdaexpres.dao.RepartidorDAO"%>
<%@page import="com.sanvalero.cdaexpres.domain.Pedido"%>
<%@page import="com.sanvalero.cdaexpres.dao.PedidoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Orders</title>
        <link rel="shortcut icon" href="images/logo_pestanacda.png">
        <link rel="stylesheet" href="CSScdaexpres/estilos_clientes.css">
        <script src="https://kit.fontawesome.com/653631b56e.js" crossorigin="anonymous"></script>
        <script src="script/script.js"></script>
    </head>
    <body onload="pagina(0)">
        <header>
            <nav class="menu-navegacion contenedor">
                <div class="logo">   
                    <img src="images/logo_cdaexpres.jpg" alt="">
                </div>
                <div class="enlaces"> 
                        <li><a href="index_ingles.html">Home</a></li>
                        <li><a href="cliente_ingles.jsp">Customers</a></li>
                        <li><a href="pedido.jsp"><img src="images/bandera_espanola.jpg" style="width:20%"></a></li>
                </div>
            </nav>
            <section class="hero">
                <div class="contenedor-textos contenedor">
                    <h1>Order List (with JSP)</h1>
                </div>
            </section>
        </header>
        <br>
        <br>
        
        <%
            PedidoDAO pedidoDAO = new PedidoDAO();
            ArrayList<Pedido> pedidos = pedidoDAO.getAllPedidos();
        %>

        
        <div class="contenido">
            <div>
                <div id="nuevo" onclick="nuevo()"><p>New order</p></div>
                <form id="form" method="post" action="new-order">
                    <input type="text" name="dniCliente" placeholder="DNI del cliente" required/>
                    <input type="text" name="dniRepartidor" placeholder="Customer's DNI" required/>
                    <input type="text" name="matricula" placeholder="Vehicle registration number" required/>
                    <input type="text" name="fecha" placeholder="Date of dispatch (dd/mm/yyyy)" required/>
                    <input type="text" name="direccion" placeholder="Address" required/>
                    <input type="text" name="peso" placeholder="Weight" required/>
                    <input type="text" name="precio" placeholder="Price" required/>
                    <div class="check"><input type="checkbox" name="fragil"/><p>Fragile</p></div>
                    <div class="check"><input type="checkbox" name="urgente"/><p>Urgent</p></div>
                    <input type="submit" value="Add order"/>
                </form>
            </div>
            <div class="lista">
                <form id="buscar">
                    <input id="buscador2" type="text" placeholder="Enter the date or address">
                    <input type="button" value="Search" onclick="buscarPedido()">
                </form>
                <%
                    for (Pedido pedido : pedidos) {
                %>
                    <div class="cliente" onclick="verPedido(this, '<%=pedido.getIdPedido()%>')"><%= pedido.getFechaEnvio() + " - " + pedido.getDireccion()%></div>
                <%    
                    }
                %>
                <div id="paginacion">
                    <input id="anterior" type="button" value="Previous" onclick="pagina(1)">
                    <input id="siguiente" type="button" value="Next" onclick="pagina(2)">
                </div>
            </div>
            <div class="detalle">
                <%
                    String fragil = "";
                    String urgente = "";
                    for (Pedido pedido : pedidos) {
                        if (pedido.isFragil() == true) {
                            fragil = "Sí";
                        } else {
                            fragil = "No";
                        }
                        if (pedido.isUrgente()) {
                            urgente = "Sí";
                        } else {
                            urgente = "No";
                        }
                %>
                <div id="<%=pedido.getIdPedido()%>" class="datos">
                    <div>Date: <%=pedido.getFechaEnvio()%></div>
                    <div>Dirección: <%=pedido.getDireccion()%></div>
                    <div>Address: <%=pedido.getPeso()%></div>
                    <div>Price: <%=pedido.getPrecio()%></div>
                    <div>Fragile: <%=fragil%></div>
                    <div>Urgent: <%=urgente%></div>

                    <div class="botones">
                        <form method="post" id="modificarPedido">
                            <input type="button" value="Modify order" onclick="modificar(<%= pedido.getIdPedido()%>)">
                        </form>
                        <form method="post" id="eliminarPedido" action="remove-order">
                            <input class="inputOculto" type="text" value="<%=pedido.getIdPedido()%>" name="eliminarPedido">
                            <input type="submit" value="Delete order">
                        </form>
                    </div>
                </div>
                <div>
                    <form id="form<%= pedido.getIdPedido()%>" class="actualizar" method="post" action="modify-order">
                        <input class="inputOculto" type="text" name="id" value="<%= pedido.getIdPedido()%>">
                        <input type="text" name="fecha" value="<%= pedido.getFechaEnvio()%>"/>
                        <input type="text" name="direccion" value="<%= pedido.getDireccion()%>"/>
                        <input type="text" name="peso" value="<%= pedido.getPeso()%>"/>
                        <input type="text" name="precio" value="<%= pedido.getPrecio()%>"/>
                        <div class="check"><input type="checkbox" name="fragil"
                            <% if (pedido.isFragil()) {
                                %>checked<%
                            }%>
                        /><p>Fragile</p></div>
                        <div class="check"><input type="checkbox" name="urgente"
                            <% if (pedido.isUrgente()) {
                                %>checked<%
                            }%>
                        /><p>Urgent</p></div>
                        <input type="submit" value="Update"/>
                    </form>
                </div>
                <%    
                    }
                %>
            </div>
        </div>
        
        <%
            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <p style='color:green'><%= message %></p>
        <%        
            }

            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            switch (status) {
                case "ok":
                    out.println("<p style='color:green'>Changes have been saved</p>");
                    break;
                case "cliente_error":
                    out.println("<p style='color:red'>The client entered does not exist. You must add it first</p>");
                    break;
                case "repartidor_error":
                    out.println("<p style='color:red'>The dealer you entered does not exist. You must add it first</p>");
                    break;
                case "vehiculo_error":
                    out.println("<p style='color:red'>The vehicle entered does not exist. You must add it first</p>");
                    break;
                case "error":
                    out.println("<p style='color:red'>An error has occurred</p>");
            }
        %>
        <footer>
            <div class="redes-sociales">
                <i class="fab fa-twitter"></i>
                <i class="fab fa-facebook-f"></i>
                <i class="fab fa-instagram"></i>
                <i class="fab fa-windows"></i>
            </div>
            <div class="enlaces">
                <ul>
                    <li><a href="aviso_legal_ingles.jsp">Legal warning</a></li>
                    <li><a href="politica_privacidad_ingles.jsp">Privacy Policy</a></li>
                    <li><a href="pedido.jsp"><img src="images/bandera_espanola.jpg" style="width:20%"></a></li>
                </ul>
            </div> 
            
        <br>
        <br>
        </footer>
    </body>
</html>

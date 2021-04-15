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
        <title>Listado de Pedidos</title>
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
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="cliente.jsp">Clientes</a></li>
                        <li><a href="#"><img src="images/bandera_inglesa.jpg" style="width:20%"></a></li>
                </div>
            </nav>
            <section class="hero">
                <div class="contenedor-textos contenedor">
                    <h1>Lista de Pedidos (con JSP) </h1>
                </div>
            </section>
        </header>
        <br>
        <br>
        
        <%
            ClienteDAO clienteDAO = new ClienteDAO();
            RepartidorDAO repartidorDAO = new RepartidorDAO();
            VehiculoDAO vehiculoDAO = new VehiculoDAO();
            PedidoDAO pedidoDAO = new PedidoDAO();
            ArrayList<Pedido> pedidos = pedidoDAO.getAllPedidos();
        %>

        
        <div class="contenido">
            <div>
                <div id="nuevo" onclick="nuevo()"><p>Nuevo pedido</p></div>
                <form id="form" method="post" action="nuevo-pedido">
                    <input type="text" name="dniCliente" placeholder="DNI del cliente" required/>
                    <input type="text" name="dniRepartidor" placeholder="DNI del repartidor" required/>
                    <input type="text" name="matricula" placeholder="Matrícula del vehículo" required/>
                    <input type="text" name="fecha" placeholder="Fecha envío (dd/mm/yyyy)" required/>
                    <input type="text" name="direccion" placeholder="Dirección" required/>
                    <input type="text" name="peso" placeholder="Peso" required/>
                    <input type="text" name="precio" placeholder="Precio" required/>
                    <div class="check"><input type="checkbox" name="fragil"/><p>Frágil</p></div>
                    <div class="check"><input type="checkbox" name="urgente"/><p>Urgente</p></div>
                    <input type="submit" value="Añadir pedido"/>
                </form>
            </div>
            <div class="lista">
                <form id="buscar">
                    <input id="buscador2" type="text" placeholder="Introduce la fecha o dirección">
                    <input type="button" value="Buscar" onclick="buscarPedido()">
                </form>
                <%
                    for (Pedido pedido : pedidos) {
                        int pedidoId = pedido.getIdPedido();
                %>
                    <div class="cliente" onclick="verPedido(this, '<%=pedidoId%>')"><%= pedido.getFechaEnvio() + " - " + pedido.getDireccion()%></div>
                <%    
                    }
                %>
                <div id="paginacion">
                    <input id="anterior" type="button" value="Anterior" onclick="pagina(1)">
                    <input id="siguiente" type="button" value="Siguiente" onclick="pagina(2)">
                </div>
            </div>
            <div class="detalle">
                <%
                    String fragil = "";
                    String urgente = "";
                    for (Pedido pedido : pedidos) {
                        int pedidoId = pedido.getIdPedido();
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
                <div id="<%=pedidoId%>" class="datos">
                    <div>Fecha: <%=pedido.getFechaEnvio()%></div>
                    <div>Dirección: <%=pedido.getDireccion()%></div>
                    <div>Peso: <%=pedido.getPeso()%></div>
                    <div>Precio: <%=pedido.getPrecio()%></div>
                    <div>Frágil: <%=fragil%></div>
                    <div>Urgente: <%=urgente%></div>

                    <div class="botones">
                        <form method="post" id="modificarPedido">
                            <input type="button" value="Modificar pedido" onclick="modificar(<%= pedido.getIdPedido()%>)">
                        </form>
                        <form method="post" id="eliminarPedido" action="remove-pedido">
                            <input class="inputOculto" type="text" value="<%=pedido.getIdPedido()%>" name="eliminarPedido">
                            <input type="submit" value="Eliminar pedido">
                        </form>
                    </div>
                </div>
                <div>
                    <form id="form<%= pedido.getIdPedido()%>" class="actualizar" method="post" action="modify-pedido">
                        <input class="inputOculto" type="text" name="id" value="<%= pedido.getIdPedido()%>">
                        <input type="text" name="fecha" value="<%= pedido.getFechaEnvio()%>"/>
                        <input type="text" name="direccion" value="<%= pedido.getDireccion()%>"/>
                        <input type="text" name="peso" value="<%= pedido.getPeso()%>"/>
                        <input type="text" name="precio" value="<%= pedido.getPrecio()%>"/>
                        <div class="check"><input type="checkbox" name="fragil"
                            <% if (pedido.isFragil()) {
                                %>checked<%
                            }%>
                        /><p>Frágil</p></div>
                        <div class="check"><input type="checkbox" name="urgente"
                            <% if (pedido.isUrgente()) {
                                %>checked<%
                            }%>
                        /><p>Urgente</p></div>
                        <input type="submit" value="Actualizar"/>
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
                    out.println("<p style='color:green'>Se han guardado los cambios</p>");
                    break;
                case "cliente_error":
                    out.println("<p style='color:red'>El cliente introducido no existe. Debes añadirlo primero</p>");
                    break;
                case "repartidor_error":
                    out.println("<p style='color:red'>El repartidor introducido no existe. Debes añadirlo primero</p>");
                    break;
                case "vehiculo_error":
                    out.println("<p style='color:red'>El vehículo introducido no existe. Debes añadirlo primero</p>");
                    break;
                case "error":
                    out.println("<p style='color:red'>Se ha producido un error</p>");
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
                        <li><a href="aviso_legal.jsp">Aviso Legal</a></li>
                        <li><a href="politica_privacidad.jsp">Politica de privacidad</a></li>
                        <li><a href="index_ingles.jsp"><img src="images/bandera_inglesa.jpg" style="width:20%"></a></li>
                </ul>
            </div> 
            
        <br>
        <br>
        </footer>
    </body>
</html>

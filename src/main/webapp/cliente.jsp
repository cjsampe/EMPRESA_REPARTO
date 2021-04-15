<%@page import="com.sanvalero.cdaexpres.dao.PedidoDAO"%>
<%@page import="com.sanvalero.cdaexpres.domain.Pedido"%>
<%@page import="com.sanvalero.cdaexpres.domain.Cliente"%>
<%@page import="com.sanvalero.cdaexpres.dao.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
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
                        <li><a href="pedido.jsp">Pedidos</a></li>
                        <li><a href="cliente_ingles.jsp"><img src="images/bandera_inglesa.jpg" style="width:20%"></a></li>
                </div>
            </nav>
            <section class="hero">
                <div class="contenedor-textos contenedor">
                    <h1>Lista de Clientes (con JSP) </h1>
                </div>
            </section>
        </header>
        <br>
        <br>
        <%
            ClienteDAO clienteDAO = new ClienteDAO();
            PedidoDAO pedidoDAO = new PedidoDAO();
            ArrayList<Cliente> clientes = clienteDAO.getAllClientes();
        %>
        <div class="contenido">
            <div>
                <div id="nuevo" onclick="nuevo()"><p>Nuevo cliente</p></div>
                <form id="form" method="post" action="nuevo-cliente">
                    <input type="text" name="nombre" placeholder="Nombre"
                        pattern="[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48}" required/>
                    <input type="text" name="dni" placeholder="DNI" pattern="[A-Za-z0-9!?-]{9}" required/>
                    <input type="text" name="telefono" placeholder="Teléfono" required/>
                    <input type="text" name="email" placeholder="Email"
                           pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" required/>
                    <input type="submit" value="Añadir cliente"/>
                </form>
            </div>
            <div class="lista">
                <form id="buscar">
                    <input id="buscador" type="text" placeholder="Busca por nombre">
                    <input type="button" value="Buscar" onclick="buscar()">
                </form>
                <%
                    for (Cliente cliente : clientes) {
                        int clienteId = cliente.getId();
                %>
                    <div class="cliente" onclick="verCliente(this, '<%=clienteId%>')"><%= cliente.getNombre()%></div>
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
                    for (Cliente cliente : clientes) {
                        int clienteId = cliente.getId();
                %>
                <div id="<%=clienteId%>" class="datos">
                    <div>Nombre: <%= cliente.getNombre()%></div>
                    <div>DNI: <%= cliente.getDni()%></div>
                    <div>Teléfono: <%= cliente.getTelefono()%></div>
                    <div>E-mail: <%= cliente.getEmail()%></div>

                    <div class="botones">
                        <form method="post" id="modificar">
                            <input type="button" value="Modificar cliente" onclick="modificar(<%= cliente.getId()%>)">
                        </form>
                        <form method="post" id="eliminar" action="remove-cliente">
                            <input class="inputOculto" type="text" value="<%=cliente.getId()%>" name="eliminarCliente">
                            <input type="submit" value="Eliminar cliente">
                        </form>
                        <form method="post" id="consultar" action="consultar-cliente">
                            <input class="inputOculto" type="text" value="<%=cliente.getId()%>" name="consultar">
                            <input type="button" value="Ver pedidos realizados" onclick="mostrarPedidos(<%= cliente.getId()%>)">
                        </form>
                    </div>
                </div>
                <div>
                    <form id="form<%= cliente.getId()%>" class="actualizar" method="post" action="modify-cliente">
                        <input class="inputOculto" type="text" name="id" value="<%= cliente.getId()%>">
                        <input type="text" name="nombre" value="<%= cliente.getNombre()%>"/>
                        <input type="text" name="dni" value="<%= cliente.getDni()%>"/>
                        <input type="text" name="telefono" value="<%= cliente.getTelefono()%>"/>
                        <input type="text" name="email" value="<%= cliente.getEmail()%>"/>
                        <input type="submit" value="Actualizar"/>
                    </form>
                </div>
                <%    
                    }
                %>
            </div>
        </div>
        <div id="seccionPedidos">
            <%
                for (Cliente cliente : clientes) {
                    
                    ArrayList<Pedido> pedidos = pedidoDAO.getPedidosCliente(cliente);
            %>
            <div>
                <%
                    String fragil = "";
                    String urgente = "";
                    for (Pedido pedido : pedidos) {
                        if (pedido.isFragil()) {
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
                    <div class="pedidos mostrar<%=cliente.getId()%>">
                        <div class="pedidoFecha">Fecha: <%=pedido.getFechaEnvio()%></div>
                        <div class="pedidoDireccion">Dirección: <%=pedido.getDireccion()%></div>
                        <div class="pedidoPeso">Peso: <%=pedido.getPeso()%></div>
                        <div class="pedidoPrecio">Precio: <%=pedido.getPrecio()%></div>
                        <div class="pedidoFragil">Frágil: <%=fragil%></div>
                        <div class="pedidoUrgente">Urgente: <%=urgente%></div>
                    </div>
                    
                <%
                    }
                %></div><%
                }
                %>
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
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>Se han guardado los cambios</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>Ha habido un error realizando los cambios</p>");
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
                        <li><a href="cliente_ingles.jsp"><img src="images/bandera_inglesa.jpg" style="width:20%"></a></li>
                </ul>
            </div> 
            
        <br>
        <br>
        </footer>
    </body>
</html>

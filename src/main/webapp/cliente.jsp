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
        <style>
            .contenido {
                display: flex;
                width: 100%;
                max-width: 1250px;
                min-height: 700px;
                padding: 0px;
                margin: 10px auto 0px auto;
            }
            .lista {
                flex: 30%;
                padding-right: 25px;
            }
            .cliente {
                background-color: #f1f1f1;
                height: 30px;
                margin: 8px 0px 0px;
                padding: 14px;
                border: 0.5px solid gray;
                display: none;
            }
            .detalle {
                flex: 70%;
            }
            .datos {
                display: none;
                
            }
            .datos div {
                background-color: #f1f1f1;
                height: 30px;
                margin: 2px 0px;
                padding: 14px;
                border: 1px solid #3333ff;
            }
            .botones {
                display: flex;
                justify-content: space-between;
            }
            #modificar {
                width: 32%;
                height: 32px;
            }
            #modificar input {
                background-color: #e65c2b;
                width: 100%;
                height: 100%;
            }
            #eliminar {
                width: 32%;
                height: 32px;
            }
            #eliminar input {
                background-color:#fed665;
                width: 100%;
                height: 100%;
            }
            #consultar {
                width: 32%;
                height: 32px;
            }
            #consultar input {
                background-color: cadetblue;
                width: 100%;
                height: 100%;
            }
            .inputOculto {
                display: none;
            }
            .actualizar {
                display: none;
                justify-content: center;
                flex-wrap: wrap;
                width: 180px;
            }
            .actualizar input {
                margin: 2px 0px;
                width: 100%;
            }
            #nuevo {
                height: 32px;
                width: 180px;
                margin-right: 10px;
                background-color: orange;
                display: flex;
                border-radius:12px;
                justify-content: center;
            }
            #nuevo p {
                margin: 8px 0px 0px;
                font-size: 16px;
            }
            
            #form {
                display: none;
                justify-content: center;
                flex-wrap: wrap;
                width: 180px;
            }
            #form input {
                margin: 5px 0px;
                border-radius:5px;
                width: 100%;
            }
            #buscar {
                display: flex;
                justify-content: space-between;
            }
            #buscar input[type="text"]{
                height: 26px;
                width: 70%;
                border-radius:5px;
            }
            #buscar input[type="button"]{
                height: 32px;
                border-radius:5px;
                width: 25%;
            }
            .pedidos {
                display: none;
                background-color: #cdeff7;
                height: 30px;
                margin: 2px 0px;
                padding: 14px;
                border: 1px solid #37bdc9;
                grid-template-columns: 25% 25% 15% 15% 10% 10%;
            }
            #seccionPedidos {
                margin-top: 10px;
            }
        </style>
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
                        <li><a href="#"><img src="images/bandera_inglesa.jpg" style="width:20%"></a></li>
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
                    <input type="text" name="telefono" placeholder="Teléfono"/>
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
                <div>
                    <input id="anterior" type="button" value="<" onclick="pagina(1)">
                    <input id="siguiente" type="button" value=">" onclick="pagina(2)">
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
                    String fragil = "No";
                    String urgente = "No";
                    for (Pedido pedido : pedidos) {
                        if (pedido.isFragil() == true) {
                            fragil = "Sí";
                        }
                        if (pedido.isUrgente() == true) {
                            urgente = "Sí";
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
        <script src="https://kit.fontawesome.com/653631b56e.js" crossorigin="anonymous"></script>
    
    <script>
        
        var numClientes = document.getElementsByClassName("cliente");
        var numDatos = document.getElementsByClassName("datos");
        var numForm = document.getElementsByClassName("actualizar");
        var numPedidos = document.getElementsByClassName("pedidos");
        var numPag = 0;
        
        function ocultar() {
            for (var i = 0; i < numForm.length; i++) {
                numForm[i].style.display = 'none';
            }
            for (var i = 0; i < numPedidos.length; i++) {
                numPedidos[i].style.display = "none";
            }
        }
        
        function verCliente(cliente, id) {
            for (var i = 0; i < numClientes.length; i++) {
                numClientes[i].style.backgroundColor = '#f1f1f1';
            }
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            ocultar();
            document.getElementById(id).style.display = "block";
            cliente.style.backgroundColor = 'lightblue';
            document.getElementById("form").style.display = "none";
        }
        
        function modificar(x) {
            ocultar();
            var formulario = document.getElementById("form" + x);
            formulario.style.display = "flex";
        }
        
        function nuevo() {
            ocultar();
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            for (var i = 0; i < numClientes.length; i++) {
                numClientes[i].style.backgroundColor = '#f1f1f1';
            }
            document.getElementById("form").style.display = "flex";
        }
        
        function buscar() {
            var buscador = document.getElementById("buscador").value;
            ocultar();
            for (var i = 0; i < numDatos.length; i++) {
                numDatos[i].style.display = "none";
            }
            for (var i = 0; i < numClientes.length; i++) {
                if (numClientes[i].innerHTML.indexOf(buscador) !== -1) {
                    numClientes[i].style.display = 'block';
                    numClientes[i].style.backgroundColor = '#f1f1f1';
                } else {
                    numClientes[i].style.display = 'none';
                } 
            }
            document.getElementById("form").style.display = "none";
        }
        
        function pagina(pag) {
            ocultar();
            if (pag === 1) {
                numPag = numPag-10;
            }
            if (pag === 2) {
                numPag = numPag+10;
            }
            if (numPag === 0) {
                document.getElementById("anterior").style.display = "none";
            } else {
                document.getElementById("anterior").style.display = "inline-block";
            }
            for (var i = 0; i < numClientes.length; i++) {
                    numClientes[i].style.display = "none";
            }
            if ((numPag+10) > numClientes.length) {
                document.getElementById("siguiente").style.display = "none";
            } else {
                document.getElementById("siguiente").style.display = "inline-block";
            }
            if (numClientes.length > 10) {
                for (var i = 0; i < 10; i++) {
                    numClientes[i+numPag].style.backgroundColor = '#f1f1f1';
                    numClientes[i+numPag].style.display = "block";
                }
            } else {
                for (var i = 0; i < numClientes.length; i++) {
                    numClientes[i].style.backgroundColor = '#f1f1f1';
                    numClientes[i].style.display = "block";
                }
            }
        }
        
        function mostrarPedidos(id) {
            var mostrar = document.getElementsByClassName("mostrar" + id);
            ocultar();
            for (var i = 0; i < mostrar.length; i++) {
                mostrar[i].style.display = 'grid';
            }
        }
        
    </script>
    
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>Se han guardado los cambios</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>Ha habido un error realizando los cambios</p>");
            }
        %>
</body>
</html>

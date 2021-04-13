<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar pedido</title>
    </head>
    <body>
        <h1>Ejemplo de formulario web</h1>
        <form method="post" action="add-pedido">
            DNI del cliente:
            <input type="text" name="cliente"/><br/>
            DNI del Repartidor:
            <input type="text" name="repartidor"/><br/>
            Matrícula del vehículo:
            <input type="text" name="vehiculo"/><br/>
            Fecha de envío:
            <input type="text" name="fecha"/><br/>
            Dirección:
            <input type="text" name="direccion"/><br/>
            Peso:
            <input type="text" name="peso"/><br/>
            Precio:
            <input type="text" name="precio"/><br/>
            Frágil:
            <input type="checkbox" name="fragil"/><br/>
            Urgente:
            <input type="checkbox" name="urgente"/><br/>
            <input type="submit" value="Registrar"/>
        </form>
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
            
            switch (status) {
                case "ok":
                    out.println("<p style='color:green'>El pedido se ha registrado con éxito</p>");
                    break;
                case "error":
                    out.println("<p style='color:red'>No se ha podido registrar el pedido</p>");
                    break;
                case "cliente_error":
                    out.println("<p style='color:red'>No existe ningún cliente con ese DNI. Introduce primero un nuevo cliente</p>");
                    break;
                case "repartidor_error":
                    out.println("<p style='color:red'>No existe ningún repartidor con ese DNI. Introduce primero un nuevo repartidor</p>");
                    break;
                case "vehiculo_error":
                    out.println("<p style='color:red'>No existe ningún vehículo con esa matrícula. Introduce primero un nuevo vehículo</p>");
                    break;
            }
        %>
    </body>
</html>
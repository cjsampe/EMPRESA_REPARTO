<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My form</title>
    </head>
    <body>
        <h1>Registrar un nuevo cliente</h1>
        <form method="post" action="add-cliente">
            Nombre:
            <input type="text" name="nombre"/><br/>
            Dni:
            <input type="text" name="dni"/><br/>
            Teléfono:
            <input type="text" name="telefono"/><br/>
            Email:
            <input type="text" name="email"/><br/>
            <input type="submit" value="Registrar"/>
        </form>
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>El cliente se ha registrado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido registrar el cliente</p>");
            }
        %>
    </body>
</html>

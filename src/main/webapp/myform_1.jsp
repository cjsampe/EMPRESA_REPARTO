<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My form</title>
    </head>
    <body>
        <h1>Eliminar un cliente por el DNI</h1>
        <form method="post" action="remove-cliente">
            DNI:
            <input type="text" name="dni"/><br/>
            <input type="submit" value="Eliminar"/>
        </form>
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>El cliente se ha eliminado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido eliminar el cliente</p>");
            }
        %>
    </body>
</html>

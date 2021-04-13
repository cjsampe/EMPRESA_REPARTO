<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My form</title>
    </head>
    <body>
        <h1>Busqueda por DNI</h1>
        <form method="post" action="consult-cliente">
            
            Dni:
            <input type="text" name="dni"/><br/>
            <input type="submit" value="Consultar"/>
        </form>
        
    </body>
</html>

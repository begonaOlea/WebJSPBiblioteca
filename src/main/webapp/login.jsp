
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <%@include file="WEB-INF/vista/bootStrap.html" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Introduce los datos de Acceso</h1>
                </div>
            </div>
            <form >
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" name="email"
                           id="email" placeholder="Introduce  email">
                </div>
                <div class="form-group">
                    <label for="pwd">Password</label>
                    <input type="password" class="form-control" name="pwd"
                           id="pwd" placeholder="Password">
                </div>
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-primary" style="margin-right: 10px;">Registrarse</button>
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>

        </div>
    </body>
</html>
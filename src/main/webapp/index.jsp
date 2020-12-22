
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="WEB-INF/vista/bootStrap.html" %>
    </head>
    <body>
        <div class="container" style="background: ${ cookie.color.value };">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Bienvenido a la Biblioteca !!!</h1>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col">
                    <form action="preferencias" method="GET">
                        <label >Seleccione su color preferente: </label>
                        <select name="colorPref" >
                            <option value="#E9967A">rojo</option>
                            <option selected="selected" value="#a9dfbf">verde</option>
                            <option value="#f4d03f">amarillo</option>
                        </select> 
                        <input type="submit" value="Enviar" />
                    </form>
                </div>
            </div>
            

        </div>
    </body>
</html>

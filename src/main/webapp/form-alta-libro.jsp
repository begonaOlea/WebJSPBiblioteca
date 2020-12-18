
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="WEB-INF/vista/bootStrap.html" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Alta Libro</h1>
                </div>
            </div>
            <!--  formulario  -->
            <div class="row">
                <div class="col">

                    <form action="alta-nuevo-libro" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="number" class="form-control" id="id"
                                       placeholder="Introduce id libro" name="id">
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="titulo" 
                                       placeholder="Introduce el título" name="titulo">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="autor" 
                                       placeholder="Introduce el autor" name="autor">
                            </div>
                        </div>
                        
                         <button type="submit" class="btn btn-primary">Grabar</button>
                    </form> 

                </div>
            </div>
        </div>
    </body>
</html>

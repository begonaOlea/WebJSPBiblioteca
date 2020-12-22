
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
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

            <!-- mensaje error alta -->
            <c:if test="${not empty requestScope.msgErrorAlta }" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.msgErrorAlta}
                </div>
            </c:if>


            <!--  formulario  -->


            <div class="row">
                <div class="col">

                    <form action="alta-nuevo-libro" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="number" class="form-control" id="id"
                                       placeholder="Introduce id libro" name="id">
                            </div>
                            <div class="col">${ requestScope.msgErrorId }</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="titulo" 
                                       placeholder="Introduce el título" name="titulo">
                            </div>
                            <div class="col">${ requestScope.msgErrorTitulo }</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="autor" 
                                       placeholder="Introduce el autor" name="autor">
                            </div>
                            <div class="col">${ requestScope.msgErrorAutor }</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Grabar</button>
                    </form> 

                </div>
            </div>
        </div>
    </body>
</html>

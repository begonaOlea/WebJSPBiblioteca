
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Usuario</title>
        <%@include file="WEB-INF/vista/bootStrap.html" %>
    </head>
    <body>
        <div class="container">

            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Alta Nuevo Usuario</h1>
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

                    <form action="alta-nuevo-usuario" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="email" class="form-control" id="email" 
                                       placeholder="Introduce el email" name="email">
                            </div>
                            <div class="col">${ requestScope.msgErrorEmail }</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="password" class="form-control" id="pwd" 
                                       placeholder="Introduce la clave" name="pwd">
                            </div>
                            <div class="col">${ requestScope.msgErrorPwd }</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="nombre" 
                                       placeholder="Introduce el nombre" name="nombre">
                            </div>
                            <div class="col">${ requestScope.msgErrorNombre }</div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" id="apellidos" 
                                       placeholder="Introduce los apellidos" name="apellidos">
                            </div>
                            <div class="col">${ requestScope.msgErrorApellidos }</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Grabar</button>
                    </form> 

                </div>
            </div>
        </div>
    </body>
</html>

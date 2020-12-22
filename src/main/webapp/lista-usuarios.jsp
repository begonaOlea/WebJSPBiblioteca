<%@page import="com.biblioteca.model.Usuario"%>
<%@page import="com.biblioteca.model.Libro"%>
<%@page import="java.util.Collection"%>
<%@page import="com.biblioteca.model.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Usuarios</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Lista Usuarios</h1>

               
                    <%  
                        Collection<Usuario> lista = DB.getUsuarios();
                        request.setAttribute("listaUsuarios", lista);
                    %>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Email</th>
                                <th scope="col">Usuario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="usr" items="${ requestScope.listaUsuarios }">
                            <tr>
                                <th scope="row">${ usr.email }</th>
                                <td>${ usr.nombre } ${ usr.apellidos } </td>
                            </tr>   
                            </c:forEach>
                        </tbody>
                    </table>


                </div>
            </div>
        </div> 
    </body>
</html>

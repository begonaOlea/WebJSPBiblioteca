
<%@page import="com.biblioteca.model.DB"%>
<%@page import="java.util.Collection"%>
<%@page import="com.biblioteca.model.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista libros alquilados</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Lista libros Alquilados</h1>
                    
                    
                    <%
                        Collection<Libro> libros = DB.getLibrosPrestados();
                    %>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Título</th>
                                <th scope="col">Autor</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Libro l : libros) {%>
                            <tr>
                                <th scope="row"><%= l.getId()%></th>
                                <td><%= l.getTitulo()%></td>
                                <td><%= l.getAutor()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
    </body>
</html>

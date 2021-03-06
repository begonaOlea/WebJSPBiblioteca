<%@page import="com.biblioteca.model.Libro"%>
<%@page import="java.util.Collection"%>
<%@page import="com.biblioteca.model.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista libros</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/vista/cabecera.jspf" %>
            <%@include file="WEB-INF/vista/navegacion.jspf" %>

            <div class="row">
                <div class="col">
                    <h1>Lista libros</h1>

                    ejemplo EL  *${requestScope.mensaje}*
                    <br />
                    ejemplo jsp *<%=  request.getAttribute("mensaje")%>*

                    

                    <c:if test="${not empty requestScope.mensaje}" >
                        <div class="alert alert-success" role="alert">
                           ${requestScope.mensaje}
                        </div>
                    </c:if>

                    <%
                        if (request.getAttribute("mensaje") != null) {
                            //hay mensaje
                            String msg = (String) request.getAttribute("mensaje");
                    %>

                    <div class="alert alert-success" role="alert">
                        <%= msg%>
                    </div>
                    <%
                        }//fin if
                    %>

                    <%   Collection<Libro> libros = DB.getAllLibros();  %>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Título</th>
                                <th scope="col">Autor</th>
                                <th scope="col">Disponibilidad</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Libro l : libros) {%>
                            <tr>
                                <th scope="row"><%= l.getId()%></th>
                                <td><%= l.getTitulo()%></td>
                                <td><%= l.getAutor()%></td>
                                <td>
                                    <% if (l.isDisponible()) { %>
                                    disponible
                                    <% } else { %>
                                    alquilado
                                    <%} %>
                                </td>
                                <td>
                                    <% if (l.isDisponible()) {%>
                                    <a href="alquilar?id=<%= l.getId()%>" >Alquilar</a>
                                    <%} %>
                                </td>
                            </tr>   
                            <% }%>
                        </tbody>
                    </table>


                </div>
            </div>
        </div> 
    </body>
</html>

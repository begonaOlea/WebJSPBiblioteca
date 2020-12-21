package com.biblioteca.web;

import com.biblioteca.excepciones.DBException;
import com.biblioteca.model.DB;
import com.biblioteca.model.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AltaLibroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //1. LEER PARAMETROS id, titulo, autor  (name del input)
        String paramId = request.getParameter("id");
        String paramTitulo = request.getParameter("titulo");
        String paramAutor = request.getParameter("autor");

        //2.  VALIDAR PARAMETROS
        String msgErrorId = null;
        String msgErrorTitulo = null;
        String msgErrorAutor = null;
        String msgErrorAlta = null;

        boolean valido = true;

        // 2.1. VALIDAR ID
        int id = 0;
        if (paramId == null) {
            msgErrorId = "Debe indicar el id del Libro";
            valido = false;
        } else {
            try {
                id = Integer.parseInt(paramId);
            } catch (NumberFormatException e) {
                msgErrorId = "Debe indicar un id numérico";
                valido = false;
            }
        }

        // 2.2. VALIDAR TITULO        
        if (paramTitulo == null || paramTitulo.trim().length() == 0) {
            msgErrorTitulo = "Debe indicar  título";
            valido = false;
        }

        // 2.2. VALIDAR AUTOR
        if (paramAutor == null || paramAutor.trim().length() == 0) {
            msgErrorAutor = "Debe indicar autor ";
            valido = false;
        }

        //3.  SI NO HAY ALGUN ERROR intentar grabar
        if (valido) {
            Libro libro = new Libro(id, paramTitulo, paramAutor, true);
            try {
                DB.altaLibro(libro);
            } catch (DBException e) {
                msgErrorAlta = e.getMessage();
                valido = false;               
            }
        }//fin datos validos

        // DESPACHAR LA RESPUESTA 
        //4. SI HAY ALGUN ERROR ir a form-alta-libro.jsp
        //   SINO ir a lista-libros.jsp
        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "lista-libros.jsp";
        } else {
            jspAMostrar = "form-alta-libro.jsp";
            request.setAttribute("msgErrorId", msgErrorId);
            request.setAttribute("msgErrorTitulo", msgErrorTitulo);
            request.setAttribute("msgErrorAutor", msgErrorAutor);
            request.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(jspAMostrar);
        rd.forward(request, response);

    }//fin doPost

}

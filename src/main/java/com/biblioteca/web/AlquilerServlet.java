
package com.biblioteca.web;

import com.biblioteca.model.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AlquilerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        //1. Leer param id  
        //2. Validar 
        //    2.1 . No es valido ir a la pagian lista-libros.jps pasando el 
        //          mensaje de error
        //    2.2  Es valido.  Alquilar  -- MODEL
        //          y Despachar la peticion al JSP  lista-libros.jps
        
        String sId = req.getParameter("id");
        String mensaje = null;
        int id = 0;
        if(sId == null || sId.trim().length() == 0){
            mensaje ="Debe indicar el  id del libro a alquilar.";
        }else{
            try{
                id = Integer.parseInt(sId);            
            }catch(NumberFormatException e){
                mensaje = "Debe indicar un id de producto con formato número entero";
            }            
        }  
        
        
        if(mensaje == null){
            //MODEL
            DB.alquilar(id);
            mensaje = "Alquiló ok";
        }
        
        //despachar al JSP
        RequestDispatcher rd = req.getRequestDispatcher("lista-libros.jsp");
        //pendiente pasar msgError
        
        req.setAttribute("mensaje", mensaje);        
        rd.forward(req, resp);
        
    }//fin doGet

   
}

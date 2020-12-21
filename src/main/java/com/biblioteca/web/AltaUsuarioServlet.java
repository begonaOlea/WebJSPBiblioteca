package com.biblioteca.web;

import com.biblioteca.excepciones.DBException;
import com.biblioteca.model.DB;
import com.biblioteca.model.Libro;
import com.biblioteca.model.Usuario;
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author begonaolea
 */
@WebServlet(name = "AltaUsuarioServlet", urlPatterns = {"/alta-nuevo-usuario"})
public class AltaUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        //1. LEER PARAMETROS email, pwd, nombre, apellidos
        String paramEmail = request.getParameter("email");
        String paramPwd = request.getParameter("pwd");
        String paramNombre = request.getParameter("nombre");
        String paramApell = request.getParameter("apellidos");

        //2.  VALIDAR PARAMETROS
        String msgErrorEmail = null;
        String msgErrorPwd = null;
        String msgErrorNombre = null;
        String msgErrorApellidos = null;
        String msgErrorAlta = null;

        boolean valido = true;

        // 2.1. VALIDAR EMAIL
        if (paramEmail == null || paramEmail.trim().length() == 0) {
            msgErrorEmail = "Debe indicar el email del usuario";
            valido = false;
        }

        // 2.2. VALIDAR PWD        
        if (paramPwd == null || paramPwd.trim().length() == 0) {
            msgErrorPwd = "Debe indicar una clave";
            valido = false;
        }

        // 2.2. VALIDAR NOMBRE
        if (paramNombre == null || paramNombre.trim().length() == 0) {
            msgErrorNombre = "Debe indicar nombre ";
            valido = false;
        }
         // 2.3. VALIDAR APELLIDOS
        if (paramApell == null || paramApell.trim().length() == 0) {
            msgErrorApellidos = "Debe indicar los apellidos ";
            valido = false;
        }

        //3.  SI NO HAY ALGUN ERROR intentar grabar
        if (valido) {
            Usuario usuario = new Usuario(paramEmail, paramPwd, paramNombre, paramApell);
            try {
                DB.altaUsuario(usuario);
                // add usuario ATRIBUTO DE SESION
                //El usuario no manda jSessionId , crea una nueva sesion
                //sino devuelve la sesión existente para es id
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
            } catch (DBException e) {
                msgErrorAlta = e.getMessage();
                valido = false;               
            }
        }//fin datos validos

        // DESPACHAR LA RESPUESTA 
        //4. SI HAY ALGUN ERROR ir a form-alta-usuario.jsp
        //   SINO ir a lista-usuarios.jsp
        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "lista-usuarios.jsp";
        } else {
            jspAMostrar = "form-alta-usuario.jsp";
            request.setAttribute("msgErrorEmail", msgErrorEmail);
            request.setAttribute("msgErrorPwd", msgErrorPwd);
            request.setAttribute("msgErrorNombre", msgErrorNombre);
            request.setAttribute("msgErrorApellidos", msgErrorApellidos);
            request.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(jspAMostrar);
        rd.forward(request, response);

    }

   
}

package Servlets;

import com.mundo.expocaninawebapp.Perro;
import com.mundo.expocaninawebapp.Serializacion;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvExpCanina", urlPatterns = {"/SvExpCanina"})
public class SvExpCanina extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();
        
        ArrayList <Perro> misPerros = new ArrayList<>();
        try {
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Aqui viene los datos por POST
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String imagen = request.getParameter("imagen");
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");
 
        //Ingresar los datos al objeto
        Perro perro= new Perro(nombre, raza, imagen, Integer.parseInt(puntos), Integer.parseInt(edad));        
        misPerros.add(perro);
        Serializacion.escribirArchivo(misPerros, context);

        //Agregar el arrayList completo de la solicitud como atributo
        session.setAttribute("misPerros", misPerros);

        //Redireccionar a la pagina de destino
        response.sendRedirect("index.jsp");  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
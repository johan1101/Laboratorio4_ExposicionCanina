package Servlets;

import com.mundo.expocaninawebapp.Perro;
import com.mundo.expocaninawebapp.Serializacion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
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

        ArrayList<Perro> misPerros = new ArrayList<>();
        try {
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Aquí vienen los datos por POST
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        Part filePart = request.getPart("imagen"); 
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");

        // Directorio de carga en el servidor donde se guardarán las imágenes
        String uploadPath = context.getRealPath("/imgPerros");

        // Obtener el nombre del archivo
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Construir la ruta completa del archivo en el servidor
        String filePath = uploadPath + File.separator + fileName;

        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(filePath)) {

            int read;
            byte[] buffer = new byte[1024];
            while ((read = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, read);
            }
        }

            // Ingresar los datos al objeto
            Perro perro = new Perro(nombre, raza, fileName, Integer.parseInt(puntos), Integer.parseInt(edad));
            misPerros.add(perro);
            Serializacion.escribirArchivo(misPerros, context);

        // Agregar el ArrayList completo de la solicitud como atributo
        session.setAttribute("misPerros", misPerros);

        // Redireccionar a la página de destino
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
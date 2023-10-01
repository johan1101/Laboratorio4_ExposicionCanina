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

@WebServlet(name = "SvExpCanina", urlPatterns = {"/SvExpCanina"})
// Método para manejar las solicitudes HTTP, para tabajar con archivos FILE
@MultipartConfig
public class SvExpCanina extends HttpServlet {

    //Crear una lista para almacenar objetos Perro
    ArrayList<Perro> misPerros = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // Método para buscar un perro por nombre en la lista
    private Perro buscarPerroPorNombre(String nombre) {
        for (Perro perro : misPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro; // Retorna el perro si lo encuentra
            }
        }
        return null; // Retorna null si no se encuentra el perro
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        try {
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }
        String nombre = request.getParameter("nombre");
        Perro perro = buscarPerroPorNombre(nombre); // Implementa la lógica para buscar el perro en tu lista de perros
        if (perro != null) {
            // Genera la respuesta HTML con los detalles del perro
            String perroHtml = "<h2>Nombre: " + perro.getNombre() + "</h2>"
                    + "<p>Raza: " + perro.getRaza() + "</p>"
                    + "<p>Puntos: " + perro.getPuntos() + "</p>"
                    + "<p>Edad (meses): " + perro.getEdad() + "</p>"
                    + "<img src='imgPerros/" + perro.getImagen() + "'alt='" + perro.getNombre() + "' width='100%'/>";

            response.setContentType("text/html");
            response.getWriter().write(perroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("Perro no encontrado");
        }
    }

    //"<p><img src=" + request.getContextPath() + "/imgPerros/" + perro.getImagen() + " 'style='width: 200px;" + "alt='Imagen de perro'></p>";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener la sesion actual
        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        //Crear una lista para almacenar objetos Perro
        ArrayList<Perro> misPerros = new ArrayList<>();

        try {
            //Cargar la lista de perros desde un archivo
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            //Manejar una excepcion en caso de error al leer el archivo
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtener datos del formulario enviados por POST
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");

        //Obtener la parte del archivo de imagen desde la solicitud
        Part filePart = request.getPart("imagen");

        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");

        // Directorio de carga en el servidor donde se guardarán las imágenes
        String uploadPath = context.getRealPath("/imgPerros");

        // Obtener el nombre del archivo de imagen enviado
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Construir la ruta completa del archivo de imagen en el servidor
        String filePath = uploadPath + File.separator + fileName;

        //Abrir un flujo de entrada para el archivo de imagen recibido
        try (InputStream fileContent = filePart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(filePath)) {

            int read;
            byte[] buffer = new byte[1024];

            //Leer el archivo de imagen y escribirlo en el servidor
            while ((read = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, read);
            }
        }

        // Crear un objeto Perro con los datos ingresados y el nombre del archivo de imagen
        Perro perro = new Perro(nombre, raza, fileName, Integer.parseInt(puntos), Integer.parseInt(edad));

        //Agregar el objeto Perro a la lista de perros
        misPerros.add(perro);

        //Guardar la lista actualizada en un archivo
        Serializacion.escribirArchivo(misPerros, context);

        // Agregar la lista completa de perros como atributo en la sesión
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

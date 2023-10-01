package Servlets;

import com.mundo.expocaninawebapp.Perro;
import com.mundo.expocaninawebapp.Serializacion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import javax.servlet.http.Part;

/**
 *
 * @author INES CHAR
 */
@WebServlet(name = "SvOpciones", urlPatterns = {"/SvOpciones"})
@MultipartConfig
public class SvOpciones extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método de procesamiento principal
        processRequest(request, response);

        // Obtiene el contexto del servlet
        ServletContext context = getServletContext();

        // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        String nombreEliminar = request.getParameter("nombre");

        String nuevaRaza = request.getParameter("nuevaRaza");
        
        String nuevaPuntuacion = request.getParameter("nuevosPuntos");
        
        String nuevaEdad = request.getParameter("nuevaEdad");
        
        System.out.println(nombreEliminar);
        System.out.println(nuevaRaza);
        System.out.println(nuevaPuntuacion);

        // Crea una lista para almacenar objetos de la clase "Perro"
        ArrayList<Perro> misPerros = new ArrayList<>();

        try {
            // Carga la lista de perros desde un archivo utilizando el contexto del servlet
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            // Maneja una excepción en caso de error al leer el archivo
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (int i = 0; i < misPerros.size(); i++) {
            Perro perro = misPerros.get(i);

            // Comprueba si el nombre del perro coincide con el nombre proporcionado
            if (perro.getNombre().equals(nombreEliminar)) {
                if(!nuevaRaza.equals("") ){
                    perro.setRaza(nuevaRaza);
                }
                
                if(!nuevaPuntuacion.equals("") ){
                    perro.setPuntos(Integer.parseInt(nuevaPuntuacion));
                }
                
                if(!nuevaEdad.equals("")){
                    perro.setEdad(Integer.parseInt(nuevaEdad));
                }
                
            }
        }
        // Guarda la lista actualizada en un archivo
        Serializacion.escribirArchivo(misPerros, context);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el archivo enviado desde el formulario
        Part filePart = request.getPart("imagen"); // "imagen" debe coincidir con el nombre del campo del formulario

        String nombre = request.getParameter("nombre");

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

        // Verifica si se recibió un archivo
        if (filePart != null) {
            // Procesa el archivo aquí, por ejemplo, guarda la imagen en el servidor
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

            for (int i = 0; i < misPerros.size(); i++) {
                Perro perro = misPerros.get(i);

                // Comprueba si el nombre del perro coincide con el nombre proporcionado
                if (perro.getNombre().equals(nombre)) {
                    // Obtiene la ruta relativa de la carpeta de imágenes
                    String rutaRelativa = "/imgPerros/";

                    // Obtiene la ruta absoluta en el sistema de archivos
                    String rutaAbsoluta = context.getRealPath(rutaRelativa);

                    // Crea un objeto File para la carpeta de imágenes
                    File archivo = new File(rutaAbsoluta);

                    // Crea un objeto File para la imagen a eliminar
                    File imagenEliminar = new File(archivo + "/" + perro.getImagen());

                    System.out.println(imagenEliminar);
                    // Verifica si la imagen existe y la elimina
                    if (imagenEliminar.exists()) {
                        // Elimina la imagen del sistema de archivos
                        imagenEliminar.delete();
                    } else {
                        System.err.println("");
                    }
                    perro.setImagen(fileName);
                }
            }
            // Guarda la lista actualizada en un archivo
            Serializacion.escribirArchivo(misPerros, context);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.expocaninawebapp.Perro;
import com.mundo.expocaninawebapp.Serializacion;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author
 */
@WebServlet(name = "SvEliminar", urlPatterns = {"/SvEliminar"})
public class SvEliminar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    /**
     * Este servlet maneja las solicitudes HTTP GET para eliminar un perro de la
     * exposición canina.
     *
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método de procesamiento principal
        processRequest(request, response);

        // Obtiene el contexto del servlet
        ServletContext context = getServletContext();

        // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        String nombreEliminar = request.getParameter("nombre");

        // Crea una lista para almacenar objetos de la clase "Perro"
        ArrayList<Perro> misPerros = new ArrayList<>();

        try {
            // Carga la lista de perros desde un archivo utilizando el contexto del servlet
            Serializacion.leerArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            // Maneja una excepción en caso de error al leer el archivo
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Recorre la lista de perros
        for (int i = 0; i < misPerros.size(); i++) {
            Perro perro = misPerros.get(i);

            // Comprueba si el nombre del perro coincide con el nombre proporcionado
            if (perro.getNombre().equals(nombreEliminar)) {

                // Obtiene la ruta relativa de la carpeta de imágenes
                String rutaRelativa = "/imgPerros/";

                // Obtiene la ruta absoluta en el sistema de archivos
                String rutaAbsoluta = context.getRealPath(rutaRelativa);

                // Crea un objeto File para la carpeta de imágenes
                File archivo = new File(rutaAbsoluta);

                // Crea un objeto File para la imagen a eliminar
                File imagenEliminar = new File(archivo + "/" + perro.getImagen());

                // Verifica si la imagen existe y la elimina
                if (imagenEliminar.exists()) {
                    // Elimina la imagen del sistema de archivos
                    imagenEliminar.delete();
                    if (imagenEliminar.delete()) {
                        System.out.println("");
                    } else {
                        System.err.println("");
                    }
                } else {
                    System.err.println("");
                }

                // Elimina el perro de la lista
                misPerros.remove(i);
                i--; // Ajusta el índice después de eliminar el elemento
            }
        }

        // Guarda la lista actualizada en un archivo
        Serializacion.escribirArchivo(misPerros, context);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método de procesamiento principal
        processRequest(request, response);

        // Obtenemos de que manera se va a ordenar la lista
        String ordenar = request.getParameter("opcion");

        // Crea una lista para almacenar objetos de la clase "Perro"
        ArrayList<Perro> misPerros = new ArrayList<>();

        // Obtiene el contexto del servlet
        ServletContext context = getServletContext();

        try {
            Serializacion.leerArchivo(misPerros, context);
            System.out.println(misPerros);

            if (ordenar.equals("nombre")) {
                // Ordenar la lista de perros por el atributo "nombre"
                Collections.sort(misPerros, new Comparator<Perro>() {
                    @Override
                    public int compare(Perro perro1, Perro perro2) {
                        // Comparar los nombres de los perros

                        return perro1.getNombre().compareToIgnoreCase(perro2.getNombre());

                    }
                });
            }

            if (ordenar.equals("raza")) {
                // Ordenar la lista de perros por el atributo "raza"
                Collections.sort(misPerros, new Comparator<Perro>() {
                    @Override
                    public int compare(Perro perro1, Perro perro2) {
                        // Comparar la raza de los perros
                        return perro1.getRaza().compareToIgnoreCase(perro2.getRaza());

                    }
                });
            }

            if (ordenar.equals("puntos")) {
                // Ordenar la lista de perros por el atributo "puntos"
                Collections.sort(misPerros, new Comparator<Perro>() {
                    @Override
                    public int compare(Perro perro1, Perro perro2) {
                        // Comparar los puntos de los perros
                        return Integer.compare(perro2.getPuntos(), perro1.getPuntos());

                    }
                });
            }

            if (ordenar.equals("edad")) {
                // Ordenar la lista de perros por el atributo "edad"
                Collections.sort(misPerros, new Comparator<Perro>() {
                    @Override
                    public int compare(Perro perro1, Perro perro2) {
                        // Comparar los puntos de los perros
                        return Integer.compare(perro2.getEdad(), perro1.getEdad());

                    }
                });
            }

            Serializacion.escribirArchivo(misPerros, context);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

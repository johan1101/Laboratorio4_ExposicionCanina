/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author
 */
@WebServlet(name = "SvBuscar", urlPatterns = {"/SvBuscar"})
public class SvBuscar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        // Obtenemos de qué manera se va a ordenar la lista
        String buscar = request.getParameter("opcion");

        // Crea una lista para almacenar objetos de la clase "Perro"
        ArrayList<Perro> misPerros = new ArrayList<>();

        // Obtiene el contexto del servlet
        ServletContext context = getServletContext();

        try {
            Serializacion.leerArchivo(misPerros, context);
            ArrayList<Perro> perrosEncontrados = new ArrayList<>();

            if (buscar.equals("puntajeMayor")) {

                // Variables para el seguimiento de la puntuación más alta y la lista de perros con la puntuación más alta
                int maxPuntuacion = Integer.MIN_VALUE;

                // Recorre la lista de perros
                for (Perro perro : misPerros) {
                    int puntuacionActual = perro.getPuntos();

                    // Si encontramos una puntuación más alta, actualizamos la lista de perros con la puntuación más alta
                    if (puntuacionActual > maxPuntuacion) {
                        maxPuntuacion = puntuacionActual;
                        perrosEncontrados.clear();
                        perrosEncontrados.add(perro);
                    } else if (puntuacionActual == maxPuntuacion) {
                        // Si encontramos una puntuación igual, la agregamos a la lista
                        perrosEncontrados.add(perro);
                    }
                }

                // En este punto, perrosConMaxPuntuacion contendrá todos los perros con la puntuación más alta
                System.out.println("Puntuación más alta: " + maxPuntuacion);
                System.out.println("Perros con la puntuación más alta: " + perrosEncontrados);
            }

            //---------------------------------------------------------
            if (buscar.equals("puntajeMenor")) {
                // Variables para el seguimiento de la puntuación más baja y la lista de perros con la puntuación más baja
                int minPuntuacion = Integer.MAX_VALUE;

                // Recorre la lista de perros
                for (Perro perro : misPerros) {
                    int puntuacionActual = perro.getPuntos();

                    // Si encontramos una puntuación más baja, actualizamos la lista de perros con la puntuación más baja
                    if (puntuacionActual < minPuntuacion) {
                        minPuntuacion = puntuacionActual;
                        perrosEncontrados.clear();
                        perrosEncontrados.add(perro);
                    } else if (puntuacionActual == minPuntuacion) {
                        // Si encontramos una puntuación igual, la agregamos a la lista
                        perrosEncontrados.add(perro);
                    }
                }

                // En este punto, perrosEncontrados contendrá todos los perros con la puntuación más baja
                System.out.println("Puntuación más baja: " + minPuntuacion);
                System.out.println("Perros con la puntuación más baja: " + perrosEncontrados);
            }

            //---------------------------------------------------------
            if (buscar.equals("edadMayor")) {

                // Variables para el seguimiento de la puntuación más alta y la lista de perros con la puntuación más alta
                int maxPuntuacion = Integer.MIN_VALUE;

                // Recorre la lista de perros
                for (Perro perro : misPerros) {
                    int puntuacionActual = perro.getEdad();

                    // Si encontramos una puntuación más alta, actualizamos la lista de perros con la puntuación más alta
                    if (puntuacionActual > maxPuntuacion) {
                        maxPuntuacion = puntuacionActual;
                        perrosEncontrados.clear();
                        perrosEncontrados.add(perro);
                    } else if (puntuacionActual == maxPuntuacion) {
                        // Si encontramos una puntuación igual, la agregamos a la lista
                        perrosEncontrados.add(perro);
                    }
                }

                // En este punto, perrosConMaxPuntuacion contendrá todos los perros con la puntuación más alta
                System.out.println("Puntuación más alta: " + maxPuntuacion);
                System.out.println("Perros con la puntuación más alta: " + perrosEncontrados);
            }

            //---------------------------------------------------------
            if (buscar.equals("edadMenor")) {
                // Variables para el seguimiento de la puntuación más baja y la lista de perros con la puntuación más baja
                int minPuntuacion = Integer.MAX_VALUE;

                // Recorre la lista de perros
                for (Perro perro : misPerros) {
                    int puntuacionActual = perro.getEdad();

                    // Si encontramos una puntuación más baja, actualizamos la lista de perros con la puntuación más baja
                    if (puntuacionActual < minPuntuacion) {
                        minPuntuacion = puntuacionActual;
                        perrosEncontrados.clear();
                        perrosEncontrados.add(perro);
                    } else if (puntuacionActual == minPuntuacion) {
                        // Si encontramos una puntuación igual, la agregamos a la lista
                        perrosEncontrados.add(perro);
                    }
                }

                // En este punto, perrosEncontrados contendrá todos los perros con la puntuación más baja
                System.out.println("Puntuación más baja: " + minPuntuacion);
                System.out.println("Perros con la puntuación más baja: " + perrosEncontrados);
            }

           
            Serializacion.escribirBusqueda(perrosEncontrados, context);
            System.out.println(perrosEncontrados);
            
                        // Redireccionar a la página de destino
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvBuscar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Recupera el valor del parámetro "error" enviado desde SvExpoCanina
    String error = request.getParameter("error");
    
    System.out.println("Corriedno metodo");

    // Modifica el valor del parámetro si es necesario
    if ("nombre_repetido".equals(error)) {
        error = "nuevo_valor_del_error";
    }

    // Redirige a index.jsp con el nuevo valor del parámetro "error"
    response.sendRedirect("index.jsp?error=" + error);
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

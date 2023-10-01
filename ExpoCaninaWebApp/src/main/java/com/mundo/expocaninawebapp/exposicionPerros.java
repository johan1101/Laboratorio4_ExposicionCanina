/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.expocaninawebapp;

import java.io.File;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author
 */
public class exposicionPerros {

    /**
     * Este método elimina un perro de una lista de perros y también elimina la
     * imagen asociada al perro desde la ubicación física en el sistema de
     * archivos.
     *
     * @param misPerros La lista de perros de la cual se eliminará el perro.
     * @param nombreEliminar El nombre del perro que se eliminará de la lista.
     * @param context El contexto del servlet para obtener la ruta real de la
     * imagen.
     */
    public static void eliminarPerro(ArrayList<Perro> misPerros, String nombreEliminar, ServletContext context) {

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
    }
}

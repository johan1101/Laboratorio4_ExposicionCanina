package com.mundo.expocaninawebapp;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Johan Ordoñez - Ana Cristina Mera - Karoll Gabriela Delgado
 */
public class Serializacion {

    /**
     * Escribe datos serializados de la lista de misPerros en un archivo.
     *
     * @param misPerros ArrayList de objetos Video que se van a escribir en el
     * archivo.
     * @param context El contexto ServletContext para obtener la ruta del
     * archivo.
     * @throws FileNotFoundException Si no se encuentra el archivo de datos.
     * @throws IOException Si ocurre un error durante la escritura en el
     * archivo.
     */
    public static void escribirArchivo(ArrayList<Perro> misPerros, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/perrosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir cada objeto Perro en el archivo
            for (Perro perro : misPerros) {
                oos.writeObject(perro);
            }
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }
    
       public static void escribirModal(ArrayList<Perro> misPerros, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/modal.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir cada objeto Perro en el archivo
            for (Perro perro : misPerros) {
                oos.writeObject(perro);
            }
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }

    public static void escribirBusqueda(ArrayList<Perro> misPerros, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/perrosBusqueda.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir cada objeto Perro en el archivo
            for (Perro perro : misPerros) {
                oos.writeObject(perro);
            }
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }

    /**
     * Lee datos serializados desde un archivo y los agrega a la lista de
     * misPerros.
     *
     * @param misPerros ArrayList de objetos Video donde se agregarán los datos
     * leídos.
     * @param context El contexto ServletContext para obtener la ruta del
     * archivo.
     * @throws IOException Si ocurre un error durante la lectura del archivo.
     * @throws ClassNotFoundException Si la clase del objeto leído no se
     * encuentra.
     */
    public static void leerArchivo(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/perrosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        // Verificar si el archivo está vacío antes de intentar leerlo
        if (archivo.length() == 0) {
            System.out.println("El archivo está vacío, no se realizará la lectura.");
            return; // Salir del método sin realizar la lectura
        }

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {

            // Limpiar la lista actual antes de agregar nuevos elementos
            misPerros.clear();

            while (true) {
                try {
                    // Leer un objeto Perro del archivo
                    Perro perro = (Perro) ois.readObject();

                    // Agregar el objeto Perro a la lista
                    misPerros.add(perro);
                } catch (EOFException e) {
                    // Se alcanzó el final del archivo
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo de datos.");
        }
    }

    
    public static void leerArchivoBusqueda(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/perrosBusqueda.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        // Verificar si el archivo está vacío antes de intentar leerlo
        if (archivo.length() == 0) {
            System.out.println("El archivo está vacío, no se realizará la lectura.");
            return; // Salir del método sin realizar la lectura
        }

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {

            // Limpiar la lista actual antes de agregar nuevos elementos
            misPerros.clear();

            while (true) {
                try {
                    // Leer un objeto Perro del archivo
                    Perro perro = (Perro) ois.readObject();

                    // Agregar el objeto Perro a la lista
                    misPerros.add(perro);
                } catch (EOFException e) {
                    // Se alcanzó el final del archivo
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo de datos.");
        }
    }
    
       public static void leerModalError(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/modal.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        // Verificar si el archivo está vacío antes de intentar leerlo
        if (archivo.length() == 0) {
            System.out.println("El archivo está vacío, no se realizará la lectura.");
            return; // Salir del método sin realizar la lectura
        }

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {

            // Limpiar la lista actual antes de agregar nuevos elementos
            misPerros.clear();

            while (true) {
                try {
                    // Leer un objeto Perro del archivo
                    Perro perro = (Perro) ois.readObject();

                    // Agregar el objeto Perro a la lista
                    misPerros.add(perro);
                } catch (EOFException e) {
                    // Se alcanzó el final del archivo
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo de datos.");
        }
    }
}
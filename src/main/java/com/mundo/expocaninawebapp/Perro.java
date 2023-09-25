package com.mundo.expocaninawebapp;

import java.io.Serializable;

/**
 *
 * @author Johan Ordoñez - Ana Cristina Mera - Karoll Gabriela Delgado
 */

    /**
     * La clase Perro representa a un perro en la aplicación de la exposición canina.
     * Cada instancia de esta clase contiene información sobre el nombre, raza, imagen,
     * puntos y edad de un perro.
     */
    public class Perro implements Serializable {

        //Atributos de la clase Perro
        private String nombre; //Nombre del perro
        private String raza;   //Raza del perro
        private String imagen; //Nombre de la imagen del perro
        private int puntos;    //Puntuacion del perro
        private int edad;      //Edad del perro

        /**
        * Constructor por defecto de la clase Perro.
        * Crea una instancia de Perro con atributos vacíos.
        */
        public Perro() {
        }

        /**
        * Constructor de la clase Perro.
        *
        * @param nombre Nombre del perro.
        * @param raza   Raza del perro.
        * @param imagen Nombre de la imagen del perro.
        * @param puntos Puntuación del perro.
        * @param edad   Edad del perro.
        */
        public Perro(String nombre, String raza, String imagen, int puntos, int edad) {
            this.nombre = nombre;
            this.raza = raza;
            this.imagen = imagen;
            this.puntos = puntos;
            this.edad = edad;
        }

        /**
        * Obtiene el nombre del perro.
        *
        * @return Nombre del perro.
        */
        public String getNombre() {
            return nombre;
        }

        /**
        * Establece el nombre del perro.
        *
        * @param nombre Nombre del perro.
        */
        public void setNombre(String nombre) {
            this.nombre = nombre;
        }

        /**
        * Obtiene la raza del perro.
        *
        * @return Raza del perro.
        */
        public String getRaza() {
            return raza;
        }

        /**
        * Establece la raza del perro.
        *
        * @param raza Raza del perro.
        */
        public void setRaza(String raza) {
            this.raza = raza;
        }

        /**
        * Obtiene el nombre de la imagen del perro.
        *
        * @return Nombre de la imagen del perro.
        */
        public String getImagen() {
            return imagen;
        }

        /**
        * Establece el nombre de la imagen del perro.
        *
        * @param imagen Nombre de la imagen del perro.
        */
        public void setImagen(String imagen) {
            this.imagen = imagen;
        }

        /**
        * Obtiene la puntuación del perro.
        *
        * @return Puntuación del perro.
        */
        public int getPuntos() {
            return puntos;
        }

        /**
        * Establece la puntuación del perro.
        *
        * @param puntos Puntuación del perro.
        */
        public void setPuntos(int puntos) {
            this.puntos = puntos;
        }

        /**
        * Obtiene la edad del perro.
        *
        * @return Edad del perro.
        */
        public int getEdad() {
            return edad;
        }

        /**
        * Establece la edad del perro.
        *
        * @param edad Edad del perro.
        */
        public void setEdad(int edad) {
            this.edad = edad;
        }
    }

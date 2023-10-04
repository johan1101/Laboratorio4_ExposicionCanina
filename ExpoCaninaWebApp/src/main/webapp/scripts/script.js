
    // Agrega un evento de escucha al campo de texto
    document.getElementById('nombre').addEventListener('input', function () {
        var inputText = this.value.trim(); // Obtén el valor del campo y quita los espacios en blanco al inicio y al final
        var palabras = inputText.split(/\s+/); // Divide el valor en palabras utilizando espacios en blanco como separadores

        // Verifica si el número de palabras es mayor que 10
        if (palabras.length > 10) {
            // Muestra un mensaje de error y deshabilita el envío del formulario si se supera el límite
            document.getElementById('mensajeError').textContent = 'El nombre no puede tener más de 10 palabras.';
            document.getElementById('nombre').setCustomValidity(''); // Invalida el campo
        } else {
            // Limpia el mensaje de error y permite el envío del formulario si no se supera el límite
            document.getElementById('mensajeError').textContent = '';
            document.getElementById('nombre').setCustomValidity(''); // Valida el campo
        }
    });


    function ordenarPor(opcion) {

        var ordenarPor = opcion;

        // Realiza una solicitud AJAX al servlet para realizar la ordenación alfabética
        $.ajax({
            url: 'SvEliminar?opcion=' + ordenarPor,
            method: 'POST', // Utiliza POST u otro método HTTP según corresponda
            success: function (data) {
                // En caso de éxito en la solicitud:
                // Puedes realizar acciones adicionales aquí si es necesario
                console.log('Ordenación alfabética exitosa.');
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al realizar la ordenación alfabética.');
            }
        });
    }

    function editarFoto() {

        var form = document.getElementById("fileUploadForm");

        // Verificar la validez del formulario
        if (form.checkValidity()) {

            // Obtén el formulario
            var form = document.getElementById("fileUploadForm");

            // Construye un objeto FormData con el formulario
            var formData = new FormData(form);

            // Obtiene el nombre del perro
            var nombre = nombreEdit; // Asegúrate de que esta variable esté definida

            // Agrega el nombre como un campo en el formData
            formData.append('nombre', nombre);

            // Realiza una solicitud AJAX al servlet para editar la foto del perro
            $.ajax({
                url: 'SvOpciones', // URL del servlet que manejará la edición de la foto
                method: 'POST', // Utiliza POST para enviar datos de formulario
                data: formData, // Envía los datos del formulario incluyendo el archivo y el nombre
                contentType: false, // Establece el tipo de contenido como false para que jQuery maneje automáticamente el encabezado
                processData: false, // No procesa los datos, ya que FormData lo hace automáticamente
                success: function (data) {
                    // En caso de éxito en la solicitud:
                    // Cierra el modal de edición de foto
                    $('#editFoto').modal('hide');

                    // Recarga la página actual para reflejar los cambios
                    location.reload();
                },
                error: function () {
                    // En caso de error en la solicitud:
                    // Registra un mensaje de error en la consola (para fines de depuración)
                    console.log('Error al editar la foto del perro.');
                }
            });
        } else {
            // Pedira que se ingrese un dato
        }
    }

    /**
     * Esta función se encarga de eliminar un perro a través de una solicitud AJAX al servidor.
     */
    function editarCaracteristicas(nombre) {
        var form = document.getElementById(nombre);

        // Verificar la validez del formulario
        if (form.checkValidity()) {
            // Obtiene el nombre del perro desde una variable previamente definida (nombreP)
            var nombre = nombreEdit;

            // Obtener el valor de la nueva raza ingresada por el usuario
            var nuevaR = document.getElementById('nuevaRaza').value || "";

            // Obtener el valor de los nuevos puntos ingresados por el usuario
            var nuevosPuntos = document.getElementById('punto').value || "";

            // Obtener el valor de la nueva edad ingresada por el usuario
            var nuevaEdad = document.getElementById('nuevaEdad').value || "";

            // Realiza una solicitud AJAX al servlet 'SvOpciones' para editar las características del perro
            $.ajax({
                url: 'SvOpciones?nombre=' + nombre + '&nuevaRaza=' + nuevaR + '&nuevosPuntos=' + nuevosPuntos + '&nuevaEdad=' + nuevaEdad, // URL con cuatro parámetros: nombre, nuevaRaza, nuevosPuntos y nuevaEdad
                method: 'GET', // Método HTTP utilizado para la solicitud (GET en este caso)
                success: function (data) {
                    // En caso de éxito en la solicitud

                    // Recarga la página actual para reflejar los cambios
                    location.reload();
                },
                error: function () {
                    // En caso de error en la solicitud:

                    // Registra un mensaje de error en la consola (para fines de depuración)
                    console.log('Error al editar las características del perro.');
                }
            });
        } else {
            // Pedira que se ingrese un dato
        }
    }


    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrará en el modal de confirmación antes de eliminarlo.
     */
    var nombreEditar = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#editModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del botón
        var nombrePerro = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre del perro en la variable global 'nombreP'
        nombreEdit = nombrePerro;

        // Actualiza el contenido del modal con el nombre del perro
        modal.find('#nombrePerroEnModal').text(nombrePerro);
    });

    /**
     * Esta función se encarga de mostrar los detalles de un perro en una ventana modal.
     * Se dispara cuando se muestra el modal.
     */
    $('#exampleModalDetalles').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del botón
        var nombre = button.data('nombre');

        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            url: 'SvExpCanina?nombre=' + nombre, // La URL del servlet, puede variar según la configuración
            method: 'GET', // Método HTTP utilizado para la solicitud
            success: function (data) {
                // La función que se ejecuta cuando la solicitud AJAX es exitosa

                // Actualiza el contenido del modal con los detalles del perro
                $('#perro-details').html(data);
            },
            error: function () {
                // La función que se ejecuta en caso de error durante la solicitud AJAX

                // Maneja errores aquí si es necesario, por ejemplo, muestra un mensaje en la consola
                console.log('Error al cargar los detalles del perro');
            }
        });
    });


    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrará en el modal de confirmación antes de eliminarlo.
     */
    var nombreP = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#deleteModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del botón
        var nombrePerro = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre del perro en la variable global 'nombreP'
        nombreP = nombrePerro;

        // Actualiza el contenido del modal con el nombre del perro
        modal.find('#nombrePerroEnModal').text(nombrePerro);
    });


    /**
     * Esta función se encarga de eliminar un perro a través de una solicitud AJAX al servidor.
     */
    function deleteDog() {
        // Obtiene el nombre del perro desde una variable previamente definida (nombreP)
        var nombre = nombreP;

        // Registra el nombre del perro en la consola (para fines de depuración)
        console.log(nombre);

        // Realiza una solicitud AJAX al servlet 'SvEliminar' para eliminar el perro
        $.ajax({
            url: 'SvEliminar?nombre=' + nombre, // URL del servlet con el parámetro 'nombre' para la eliminación
            method: 'GET', // Método HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de éxito en la solicitud:

                // Cierra el modal de eliminación
                $('#deleteModal').modal('hide');

                // Recarga la página actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al eliminar el perro.');
            }
        });
    }


    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrará en el modal de confirmación antes de eliminarlo.
     */
    var nombreP = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#deleteModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del botón
        var nombrePerro = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre del perro en la variable global 'nombreP'
        nombreP = nombrePerro;

        // Actualiza el contenido del modal con el nombre del perro
        modal.find('#nombrePerroEnModal').text(nombrePerro);
    });


    function buscarPor(opcion) {

        // Obtener el valor del input
        var inputNombre = document.getElementById("inputNombre").value;

        // Verificar si inputNombre está vacío y asignar un valor predeterminado si es necesario
        if (inputNombre.trim() === "") {
            inputNombre = ""; // Reemplaza "ValorPredeterminado" con el valor que desees
        }

        var buscarPor = opcion;

        // Realiza una solicitud AJAX al servlet para realizar la ordenación alfabética
        $.ajax({
            url: 'SvBuscar?opcion=' + buscarPor + '&nombre=' + inputNombre,
            method: 'GET', // Utiliza POST u otro método HTTP según corresponda
            success: function (data) {
                // En caso de éxito en la solicitud:
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al realizar la búsqueda');
            }
        });
    }

    // Activa la tabla del listado de perros
    function activarTabla() {
        $("#mostrarTabla").show();
    }

    // Muestra la tabla completa
    function mostrarTabla() {
        location.reload();
    }


    // Función para mostrar el modal de mensaje cuando haya errores en al intentar ingresar datos que ya se estan registrado
    function errorModal() {
        $("#errorModal").modal("show");
    }

    // Función para mostrar el modal de mensaje cuando no se encuentren perros registrados
    function mensajeNoPerros() {
        $("#mensajeNoPerros").modal("show");
    }
    
    // Función para mostrar el modal de mensaje cuando el usuario ingrese una imagen con un nombre supere el limite de caracteres
    function mostrarLimite() {
        $("#errorLimiteModal").modal("show");
    }

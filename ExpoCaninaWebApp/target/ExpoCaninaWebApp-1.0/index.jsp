
<%@page import="com.mundo.expocaninawebapp.Serializacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mundo.expocaninawebapp.Perro"%>

<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Clase contenedora -->
<div class="container p-4">
    <div class="row">
        <img src="./img/front.png" alt=""> <!-- Imagen en la parte superior de la página web -->
        <!-- Columna izquierda para el formulario -->
        <div class="col-lg-4 col-md-4"> <!-- Clase de división en cuatro columnas -->
            <div class="card card-body"> <!-- Tarjeta de trabajo -->
                <!-- Acción que conecta con el servlet llamado SvExpCanina por metodo POST-->
                <form action="SvExpCanina" method="POST" enctype="multipart/form-data"> <!-- Esta sentencia es para subir archivos -->
                    <h3>Insertar nuevo perro</h3><br> <!-- Titulo del formulario para insertar un perro -->
                    <!-- Formulario que recibe todos los datos para insertar un nuevo perro -->
                    <div class="col-auto">
                        <label class="visually-hidden" for="nombre">Nombre</label>
                        <div class="input-group">
                            <div class="input-group-text">Nombre:</div>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="raza">Raza</label>
                        <div class="input-group">
                            <div class="input-group-text">Raza:</div>
                            <input type="text" class="form-control" id="raza" name="raza" required>
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="imagen">Imagen</label>
                        <div class="input-group">
                            <div class="input-group-text">Imagen:</div>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept=".jpg, .jpeg, .png" required>
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="puntos">Puntos</label>
                        <div class="input-group">
                            <div class="input-group-text">Puntos</div>
                            <select class="form-select" name="puntos" aria-label="Default select example" required>
                                <option value="" disabled selected>Seleccione una opción</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="edad">Edad</label>
                        <div class="input-group">
                            <div class="input-group-text">Edad:</div>
                            <input type="text" class="form-control" id="edad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números">
                        </div>
                    </div>
                    <!-- Botón de tipo submit que permite insertar un perro -->
                    <br><button type="submit" class="btn btn-success">Insertar Perro</button>
                </form> <!-- Cierre del form -->
            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-4 col-md-4 -->

        <!-- Columna del lado derecho para la tabla de datos -->
        <div class="col-lg-8 col-md-8">
            <div class="card card-body">
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Exposición canina</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Ordenamientos
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Ordenar por nombre</a></li>
                                        <li><a class="dropdown-item" href="#">Ordenar por raza</a></li>
                                        <li><a class="dropdown-item" href="#">Ordenar por puntaje</a></li>
                                        <li><a class="dropdown-item" href="#">Ordenar por edad</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                    </ul>
                                </li>
                            </ul>
                            <form class="d-flex" role="search" enctype="multipart/form-data">
                                <input class="form-control me-2" type="search" id="inputNombre" placeholder="Nombre del perro" aria-label="Search">
                                <button href="#" type="button" class="btn btn-outline-success" onclick="buscarPerro()">Buscar</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
            <br>
            <div class="card card-body"> <!-- Tarjeta de trabajo -->
                <table class="table table-dark table-striped"> <!-- Estilo de la tabla de datos -->
                    <thead>
                        <tr>
                            <!-- Titulos de la tabla de datos -->
                            <th>Nombre</th>
                            <th>Raza</th>
                            <th>Foto</th>
                            <th>Puntos</th>
                            <th>Edad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            //Crear una lista para almacenar objetos Perro
                            ArrayList<Perro> misPerros = new ArrayList<>();

                            //Obtener el contexto del servlet
                            ServletContext context = getServletContext();

                            //Cargar la lista de perros desde un archivo
                            Serializacion.leerArchivo(misPerros, context);

                            //Condicional que verifica si la lista de perros no esta vacia
                            if (!misPerros.isEmpty()) {
                                for (Perro perro : misPerros) {
                        %>                   
                        <tr>

                            <!-- Muestra los datos ingresados en la tabla -->
                            <td><%= perro.getNombre()%></td>
                            <td><%= perro.getRaza()%></td>
                            <td><%= perro.getImagen()%></td>
                            <td><%= perro.getPuntos()%></td>
                            <td><%= perro.getEdad()%></td>

                            <!-- Iconos de acciones -->
                            <td>
                                <a href="#"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalDetalles" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-eye"></i></a>
                                <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editModalConfirm" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-marker"></i></a>         
                                <a href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-trash-alt"></i></a>
                            </td>               
                        </tr>

                        <% }
                            } else {
                                // Si el ArrayList esta vacio envia un mensaje informando al usuario
                                out.println("<tr>");
                                // colspan="6" Sirve para ocupar todas las columnas de la tabla de datos
                                out.println("<td colspan='6'>No hay perros registrados</td>");
                                out.println("<tr>");
                            }
                        %>
                    </tbody>
                </table> <!-- Cierre de la etiqueta table-->
                <center>
                    <button class="btn btn-success" id="mostrarTablaCompleta" onclick="mostrarTablaCompleta()" style="display: none;">Mostrar Tabla Completa</button>
                </center>
            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-8 col-md-8 -->
    </div> <!-- Cierre de la clase row -->
</div> <!-- Cierre de la clase container p-4 -->

<!-- Modal para la visualización del perro -->
<div class="modal fade" id="exampleModalDetalles" tabindex="-1" aria-labelledby="exampleModalLabelDetalles" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelDetalles">Detalles del Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="perro-details">
                    <!-- Aquí se mostrarán los detalles del perro -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para la confirmación de eliminar un perro -->
<div class="modal fade" id="deleteModalConfirm" tabindex="-1" aria-labelledby="deleteModalLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelConfirm">¿Estás seguro de que quieres eliminar  a <span id="nombrePerroEnModal"></span>?</h5>
            </div>
            <div class="modal-body">
                <div id="perro-details" style="display: flex; justify-content: center;">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 30px;">Cancelar</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="deleteDog()">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!------------------------------------Modales para editar las caracteristicas ------------------------------------>

<!-- Modal principal para editar las caracteristicas de un perro -->
<div class="modal fade" id="editModalConfirm" tabindex="-1" aria-labelledby="editModalLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabelConfirm">Editar información de <span id="nombrePerroEnModal"></span></h5>
            </div>
            <div class="modal-body">
                <div id="perro-detalles" style="display: flex; justify-content: center;">
                    <button href="#" type="button" class="btn btn-success" data-bs-toggle="modal" style="margin-right: 30px;" data-bs-target="#editRaza" >Editar raza</button>
                    <button href="#" type="button" class="btn btn-success" data-bs-toggle="modal" style="margin-right: 30px;" data-bs-target="#editFoto" >Editar foto</button>
                    <button href="#" type="button" class="btn btn-success" data-bs-toggle="modal" style="margin-right: 30px;" data-bs-target="#editPuntos" >Editar puntos</button>
                    <button href="#" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editEdad" >Editar edad</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-right: 30px;">Cancelar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para editar la edad del perro -->
<div class="modal fade" id="editEdad" tabindex="-1" aria-labelledby="editEdadLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="miFormularioEdad">
                <div class="modal-header">
                    <h5 class="modal-title" id="editEdadLabelConfirm">Editar edad</span></h5>
                </div>
                <div class="modal-body">
                    <div id="perro-detalles" style="display: flex; justify-content: center;">
                        <label class="visually-hidden" for="edad">Edad</label>
                        <div class="input-group">
                            <div class="input-group-text">Nueva edad:</div>
                            <input type="text" class="form-control" id="nuevaEdad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right:10px;">Cancelar</button>
                    <button type="submit" class="btn btn-danger" onclick="editarCaracteristicas('miFormularioEdad')">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal para editar la raza del perro -->
<div class="modal fade" id="editRaza" tabindex="-1" aria-labelledby="editRazaLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="miFormularioRaza">
                <div class="modal-header">
                    <h5 class="modal-title" id="editRazaLabelConfirm">Editar raza</span></h5>
                </div>
                <div class="modal-body">
                    <div id="perro-detalles" style="display: flex; justify-content: center;">
                        <label class="visually-hidden" for="raza">Raza</label>
                        <div class="input-group">
                            <div class="input-group-text">Ingresa la nueva raza:</div>
                            <input type="text" class="form-control" id="nuevaRaza" name="raza" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right:10px;">Cancelar</button>
                    <button type="submit" class="btn btn-danger" onclick="editarCaracteristicas('miFormularioRaza')">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal para editar los puntos del perro -->
<div class="modal fade" id="editPuntos" tabindex="-1" aria-labelledby="editPuntosLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="miFormularioPuntos">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPuntosLabelConfirm">Editar puntos</span></h5>
                </div>
                <div class="modal-body">
                    <div id="perro-detalles" style="display: flex; justify-content: center;">
                        <label class="visually-hidden" for="puntos">Puntos</label>
                        <div class="input-group">
                            <div class="input-group-text">Nueva puntuacion:</div>
                            <select class="form-select" id="punto" name="puntos" aria-label="Default select example" required>
                                <option value="" disabled selected>Seleccione una opción</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right:10px;">Cancelar</button>
                    <button type="submit" class="btn btn-danger" onclick="editarCaracteristicas('miFormularioPuntos')">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal para editar la foto del perro -->
<div class="modal fade" id="editFoto" tabindex="-1" aria-labelledby="editFotoLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="fileUploadForm" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="editFotoLabelConfirm">Editar foto</span></h5>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <div class="input-group-text">Nueva imagen:</div>
                        <input type="file" class="form-control" id="imagen" name="imagen" accept=".jpg, .jpeg, .png" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right:10px;">Cancelar</button>
                        <div class="input-group">
                            <div class="input-group-text">Nueva imagen:</div>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept=".jpg, .jpeg, .png" required>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right: 30px;">Cancelar</button>
                    <button type="submit" class="btn btn-danger" onclick="editarFoto()">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!------------------------------------Modales para editar las caracteristicas ------------------------------------>

<!------------------------------------Scripts para editar las caracteristicas ------------------------------------>

<script>
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
</script>

<!------------------------------------////Scripts para la parte de editar las caracteristicas ------------------------------------>

<script>
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
</script>

<script>
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
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });

</script>

<script>
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
</script>

<script>
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
</script>

<script>
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
</script>

<script>
    /**
     * Función para buscar y filtrar perros en una tabla HTML.
     * Esta función se activa cuando el usuario hace clic en el botón de búsqueda.
     */
    function buscarPerro() {
        // Variable que obtiene el valor ingresado por el usuario en el campo de entrada y convertirlo a minúsculas
        var inputNombre = document.getElementById("inputNombre").value.toLowerCase();
        // Variable para rastrear si se muestran filas
        var filasMostradas = false;

        // Iterar a través de cada fila (<tr>) en el cuerpo de la tabla (<tbody>)
        $("tbody tr").each(function () {
            // Obtener el nombre del perro en la primera columna (<td>) de la fila y convertirlo a minúsculas
            var nombrePerro = $(this).find("td:first").text().toLowerCase();

            // Verificar si el nombre del perro contiene el valor ingresado por el usuario
            if (nombrePerro.includes(inputNombre)) {
                // Si es así, mostrar la fila
                $(this).show();
                filasMostradas = true; // Al menos una fila se muestra
            } else {
                // Si no, ocultar la fila
                $(this).hide();
            }
        });

        // Mostrar el botón solo si al menos una fila se muestra
        if (filasMostradas) {
            $("#mostrarTablaCompleta").show();
        } else {
            $("#mostrarTablaCompleta").hide();
        }
    }

    function mostrarTablaCompleta() {
        // Mostrar todas las filas ocultas en el cuerpo de la tabla
        $("tbody tr").show();

        // Ocultar nuevamente el botón "Mostrar Tabla Completa"
        $("#mostrarTablaCompleta").hide();

        // Limpiar el campo de búsqueda (si es necesario)
        document.getElementById("inputNombre").value = "";
    }
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
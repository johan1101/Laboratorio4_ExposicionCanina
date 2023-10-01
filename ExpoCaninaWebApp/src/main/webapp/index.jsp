
<%@page import="com.mundo.expocaninawebapp.Serializacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mundo.expocaninawebapp.Perro"%>

<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Clase contenedora -->
<div class="container p-4">
    <div class="row">
<<<<<<< HEAD
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Exposici�n canina</a>
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
                    <form class="d-flex" role="search" action="SvOpciones" method="get">
                        <input class="form-control me-2" type="search" name="nombre" id="nombre" placeholder="Nombre del perro" aria-label="Search">
                        <button href="BuscarNombre.jsp" class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>
=======
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
        <img src="./img/front.png" alt=""> <!-- Imagen en la parte superior de la p�gina web -->
        <!-- Columna izquierda para el formulario -->
        <div class="col-lg-4 col-md-4"> <!-- Clase de divisi�n en cuatro columnas -->
            <div class="card card-body"> <!-- Tarjeta de trabajo -->
                <!-- Acci�n que conecta con el servlet llamado SvExpCanina por metodo POST-->
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
                                <option value="" disabled selected>Seleccione una opci�n</option>
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
                            <input type="text" class="form-control" id="edad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo n�meros">
                        </div>
                    </div>
                    <!-- Bot�n de tipo submit que permite insertar un perro -->
                    <br><button type="submit" class="btn btn-success">Insertar Perro</button>
                </form> <!-- Cierre del form -->
            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-4 col-md-4 -->

        <!-- Columna del lado derecho para la tabla de datos -->
        <div class="col-lg-8 col-md-8"> <!-- Clase de divisi�n en ocho columnas -->
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
<<<<<<< HEAD
=======
                            <!-- <td><img src="<%= request.getContextPath()%>/imgPerros/<%= perro.getImagen()%>" style="width: 200px;" alt="Imagen de perro"></td> -->
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
                            <td><%= perro.getPuntos()%></td>
                            <td><%= perro.getEdad()%></td>

                            <!-- Iconos de acciones -->
                            <td>
                                <a href="#"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalDetalles" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-eye"></i></a>
                                <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-marker"></i></a>         
                                <a href="#" id="nombrePerro" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" data-nombre="<%=perro.getNombre()%>"><i class="fa fa-trash-alt"></i></a>
<<<<<<< HEAD
<<<<<<< HEAD
                            </td>                
=======
                            </td>               
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
=======
                            </td>               
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
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
            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-8 col-md-8 -->
    </div> <!-- Cierre de la clase row -->
</div> <!-- Cierre de la clase container p-4 -->

<!-- Modal para la visualizaci�n del perro -->
<div class="modal fade" id="exampleModalDetalles" tabindex="-1" aria-labelledby="exampleModalLabelDetalles" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelDetalles">Detalles del Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="perro-details">
                    <!-- Aqu� se mostrar�n los detalles del perro -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
=======

>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
<!-- Modal para la confirmaci�n de eliminar un perro -->
<div class="modal fade" id="deleteModalConfirm" tabindex="-1" aria-labelledby="deleteModalLabelConfirm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelConfirm">�Est�s seguro de que quieres eliminar  a <span id="nombrePerroEnModal"></span>?</h5>
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

<script>
    /**
     * Esta funci�n se encarga de mostrar los detalles de un perro en una ventana modal.
     * Se dispara cuando se muestra el modal.
     */
    $('#exampleModalDetalles').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del bot�n
        var nombre = button.data('nombre');

        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            url: 'SvExpCanina?nombre=' + nombre, // La URL del servlet, puede variar seg�n la configuraci�n
            method: 'GET', // M�todo HTTP utilizado para la solicitud
            success: function (data) {
                // La funci�n que se ejecuta cuando la solicitud AJAX es exitosa

                // Actualiza el contenido del modal con los detalles del perro
                $('#perro-details').html(data);
            },
            error: function () {
                // La funci�n que se ejecuta en caso de error durante la solicitud AJAX

                // Maneja errores aqu� si es necesario, por ejemplo, muestra un mensaje en la consola
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });
<<<<<<< HEAD
<<<<<<< HEAD
</script>

<script>
    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrar� en el modal de confirmaci�n antes de eliminarlo.
     */
    var nombreP = "";

    /**
     * Esta funci�n se encarga de mostrar el modal de confirmaci�n antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#deleteModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del bot�n
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
     * Esta funci�n se encarga de eliminar un perro a trav�s de una solicitud AJAX al servidor.
     */
    function deleteDog() {
        // Obtiene el nombre del perro desde una variable previamente definida (nombreP)
        var nombre = nombreP;

        // Registra el nombre del perro en la consola (para fines de depuraci�n)
        console.log(nombre);

        // Realiza una solicitud AJAX al servlet 'SvEliminar' para eliminar el perro
        $.ajax({
            url: 'SvEliminar?nombre=' + nombre, // URL del servlet con el par�metro 'nombre' para la eliminaci�n
            method: 'GET', // M�todo HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de �xito en la solicitud:

                // Cierra el modal de eliminaci�n
                $('#deleteModal').modal('hide');

                // Recarga la p�gina actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al eliminar el perro.');
            }
        });
    }
=======
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
=======
>>>>>>> 3b5d1f11061fd93d655e61d847a73517da01ea83
</script>

<script>
    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrar� en el modal de confirmaci�n antes de eliminarlo.
     */
    var nombreP = "";

    /**
     * Esta funci�n se encarga de mostrar el modal de confirmaci�n antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#deleteModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del bot�n
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
     * Esta funci�n se encarga de eliminar un perro a trav�s de una solicitud AJAX al servidor.
     */
    function deleteDog() {
        // Obtiene el nombre del perro desde una variable previamente definida (nombreP)
        var nombre = nombreP;

        // Registra el nombre del perro en la consola (para fines de depuraci�n)
        console.log(nombre);

        // Realiza una solicitud AJAX al servlet 'SvEliminar' para eliminar el perro
        $.ajax({
            url: 'SvEliminar?nombre=' + nombre, // URL del servlet con el par�metro 'nombre' para la eliminaci�n
            method: 'GET', // M�todo HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de �xito en la solicitud:

                // Cierra el modal de eliminaci�n
                $('#deleteModal').modal('hide');

                // Recarga la p�gina actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al eliminar el perro.');
            }
        });
    }
</script>



<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
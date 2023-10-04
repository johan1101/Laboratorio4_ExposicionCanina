
<%@page import="com.mundo.expocaninawebapp.Serializacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mundo.expocaninawebapp.Perro"%>

<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Clase contenedora -->
<div class="container p-4">
    <div class="row">
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
                            <input type="text" class="form-control" id="nombre" name="nombre" maxlength="10" required title="Solo puede ingresar 10 caracteres">
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="raza">Raza</label>
                        <div class="input-group">
                            <div class="input-group-text">Raza:</div>
                            <input type="text" class="form-control" id="raza" name="raza" maxlength="16" required title="Solo puede ingresar 10 caracteres">
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="imagen">Imagen</label>
                        <div class="input-group">
                            <div class="input-group-text">Imagen:</div>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept=".jpg, .jpeg, .png" required>
                        </div>
                    </div>

                    <script>
                        document.getElementById('imagen').addEventListener('change', function () {
                            const input = this;
                            const maxLength = 15; // L�mite de caracteres permitidos en el nombre del archivo

                            if (input.files.length > 0) {
                                const fileName = input.files[0].name;
                                if (fileName.length > maxLength) {
                                    mostrarLimite();
                                    input.value = '';
                                }
                            }
                        });
                    </script>

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
                            <input type="text" class="form-control" id="edad" name="edad" maxlength="2" required pattern="[0-9]+" title="Por favor, ingrese solo n�meros">
                        </div>
                    </div>
                    <!-- Bot�n de tipo submit que permite insertar un perro -->
                    <br><button type="submit" class="btn btn-success"">Insertar Perro</button>
                </form> <!-- Cierre del form -->
                <br>

                <%
                    //Obtener el contexto del servlet
                    ServletContext context = getServletContext();
                    ArrayList<Perro> modalError = new ArrayList<>();
                    ArrayList<Perro> modalVacio = new ArrayList<>();
                    Serializacion.leerModalError(modalError, context);
                %>
                <% if (!modalError.isEmpty()) { %>
                <script>

                    $(document).ready(function () {
                        errorModal();
                    });

                </script>                
                <% }
                    Serializacion.escribirModal(modalVacio, context);
                %> 


                <%
                    //Obtener el contexto del servlet
                    ArrayList<Perro> encontrado = new ArrayList<>();
                    ArrayList<Perro> encontradoVacio = new ArrayList<>();
                    Serializacion.leerEncontrado(encontrado, context);
                %>
                <% if (!encontrado.isEmpty()) { %>
                <script>

                    $(document).ready(function () {
                        mensajeNoPerros();
                    });

                </script>                
                <% }
                    Serializacion.escribirEncontrado(encontradoVacio, context);
                %> 

            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-4 col-md-4 -->

        <!-- Columna del lado derecho para la tabla de datos -->
        <div class="col-lg-8 col-md-8">
            <div class="card card-body">

                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#"></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="index.jsp"></a>
                                </li>
                                <div class="dropdown" style="margin-right: 30px;">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Ordenar por
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#" onclick="ordenarPor('nombre')">Ordenar por nombre</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="ordenarPor('raza')">Ordenar por raza</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="ordenarPor('puntos')" >Ordenar por puntaje</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="ordenarPor('edad')">Ordenar por edad</a></li>
                                    </ul>
                                </div>
                                <div class="dropdown" style="margin-right: 30px;">
                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Buscar
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('puntajeMayor')">Puntaje m�s alto</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('puntajeMenor')">Puntaje m�s bajo</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('edadMayor')" >Perro m�s viejo</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('edadMenor')">Perro m�s joven</a></li>
                                    </ul>
                                </div>
                            </ul>
                            <form class="d-flex" role="search" enctype="multipart/form-data">
                                <input class="form-control me-2" type="search" id="inputNombre" placeholder="Nombre del perro" aria-label="Search">
                                <button href="#" type="button" class="btn btn-outline-success" onclick="buscarPor('nombreP')">Buscar</button>
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

                            //Crear una lista para almacenar objetos Perro
                            ArrayList<Perro> buscar = new ArrayList<>();

                            //Crear una lista para almacenar objetos Perro
                            ArrayList<Perro> listaVacia = new ArrayList<>();

                            Serializacion.leerArchivoBusqueda(buscar, context);

                            if (!buscar.isEmpty()) {
                                Serializacion.leerArchivoBusqueda(misPerros, context);
                                Serializacion.escribirBusqueda(listaVacia, context);
                        %>
                    <script>
                        $(document).ready(function () {
                            activarTabla();
                        });
                    </script>
                    <%
                        } else {
                            //Cargar la lista de perros desde un archivo
                            Serializacion.leerArchivo(misPerros, context);
                        }

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
                            out.println("<td colspan='6' align='center' valign='middle'>No hay perros registrados</td>");
                            out.println("<tr>");
                        }
                    %>
                    </tbody>
                </table> <!-- Cierre de la etiqueta table-->
                <center>
                    <button class="btn btn-success" id="mostrarTabla" onclick="mostrarTabla()" style="display: none;">Mostrar Tabla Completa</button>
                </center>
            </div> <!-- Cierre de la clase card card-body -->
        </div> <!-- Cierre de la clase col-lg-8 col-md-8 -->
    </div> <!-- Cierre de la clase row -->
</div> <!-- Cierre de la clase container p-4 -->


<!----------------------------------------------------- VENTANAS MODALES ----------------------------------------------------->

<!-- Modal para la visualizaci�n del perro -->
<div class="modal fade" id="exampleModalDetalles" tabindex="-1" aria-labelledby="exampleModalLabelDetalles" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
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

<!-- Modal para la confirmaci�n de eliminar un perro -->
<div class="modal fade" id="deleteModalConfirm" tabindex="-1" aria-labelledby="deleteModalLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelConfirm">�Est�s seguro de que quieres eliminar  a <span id="nombrePerroEnModal"></span>?</h5>
            </div>
            <div class="modal-body">
                <div id="perro-details" style="display: flex; justify-content: center;">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="deleteDog()">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de mensaje para informar que no hay perros registrados en la b�squeda -->
<div class="modal fade" id="mensajeNoPerros" tabindex="-1" aria-labelledby="mensajeNoPerrosLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mensajeNoPerrosLabelConfirm">Mensaje de b�squeda</h5>
            </div>
            <div class="modal-body">
                <!-- Imagen de error en la busqueda -->
                <img src="./img/error.jpg" alt="alt" width="100%"/>
                <!-- Mensaje que informa al usuario que no se encontro el perro buscado -->
                <h5 align="center">No se encontro ning�n perro con ese nombre</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="mostrarTablaCompleta()">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de error que contiene un mensaje en caso de que el usuario intente ingresar un perro con el mismo nombre -->
<!-- o una imagen que ya esta registrada -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Error</h5>
            </div>
            <div class="modal-body">
                <!-- Imagen de error en el registro -->
                <img src="./img/errorRegistro.jpg" alt="alt" width="100%"/><br>
                <!-- Mensaje que informa al usuario que el nombre del perro o de la imagen ya estan registrados -->
                <br><h5 align="center">Los datos que intenta ingresar ya se encuentran en el sistema.</h5>
                <p align="center">Por favor verifique la informaci�n e intente nuevamente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal que informa al usuario que supero el limite de caracteres  -->
<div class="modal fade" id="errorLimiteModal" tabindex="-1" aria-labelledby="errorLimiteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="errorLimiteModalLabel">Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h6 align="center">El nombre del archivo no puede tener m�s de 15 caracteres, por favor cambia el nombre.</h6>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>


<!------------------------------------------ Modales para editar las caracteristicas ---------------------------------------------->

<!-- Modal principal para editar las caracteristicas de un perro -->
<div class="modal fade" id="editModalConfirm" tabindex="-1" aria-labelledby="editModalLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabelConfirm">Editar informaci�n de <span id="nombrePerroEnModal"></span></h5>
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
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
                            <input type="text" class="form-control" id="nuevaEdad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo n�meros">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right: 10px;">Cancelar</button>
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
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right: 10px;">Cancelar</button>
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right: 10px;">Cancelar</button>
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
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" style="margin-right: 10px;">Cancelar</button>
                    <button type="submit" class="btn btn-danger" onclick="editarFoto()">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!----------------------------------------- ///Modales para editar las caracteristicas ------------------------------------------>

<script>
    // Agrega un evento de escucha al campo de texto
    document.getElementById('nombre').addEventListener('input', function () {
        var inputText = this.value.trim(); // Obt�n el valor del campo y quita los espacios en blanco al inicio y al final
        var palabras = inputText.split(/\s+/); // Divide el valor en palabras utilizando espacios en blanco como separadores

        // Verifica si el n�mero de palabras es mayor que 10
        if (palabras.length > 10) {
            // Muestra un mensaje de error y deshabilita el env�o del formulario si se supera el l�mite
            document.getElementById('mensajeError').textContent = 'El nombre no puede tener m�s de 10 palabras.';
            document.getElementById('nombre').setCustomValidity(''); // Invalida el campo
        } else {
            // Limpia el mensaje de error y permite el env�o del formulario si no se supera el l�mite
            document.getElementById('mensajeError').textContent = '';
            document.getElementById('nombre').setCustomValidity(''); // Valida el campo
        }
    });
</script>


<!------------------------------------------- Scripts para editar ordenar la lista ---------------------------------------------->

<script>
    function ordenarPor(opcion) {

        var ordenarPor = opcion;

        // Realiza una solicitud AJAX al servlet para realizar la ordenaci�n alfab�tica
        $.ajax({
            url: 'SvEliminar?opcion=' + ordenarPor,
            method: 'POST', // Utiliza POST u otro m�todo HTTP seg�n corresponda
            success: function (data) {
                // En caso de �xito en la solicitud:
                // Puedes realizar acciones adicionales aqu� si es necesario
                console.log('Ordenaci�n alfab�tica exitosa.');
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al realizar la ordenaci�n alfab�tica.');
            }
        });
    }
</script>


<!-------------------------------------------- Scripts para editar las caracteristicas ------------------------------------------>

<script>
    function editarFoto() {

        var form = document.getElementById("fileUploadForm");

        // Verificar la validez del formulario
        if (form.checkValidity()) {

            // Obt�n el formulario
            var form = document.getElementById("fileUploadForm");

            // Construye un objeto FormData con el formulario
            var formData = new FormData(form);

            // Obtiene el nombre del perro
            var nombre = nombreEdit; // Aseg�rate de que esta variable est� definida

            // Agrega el nombre como un campo en el formData
            formData.append('nombre', nombre);

            // Realiza una solicitud AJAX al servlet para editar la foto del perro
            $.ajax({
                url: 'SvOpciones', // URL del servlet que manejar� la edici�n de la foto
                method: 'POST', // Utiliza POST para enviar datos de formulario
                data: formData, // Env�a los datos del formulario incluyendo el archivo y el nombre
                contentType: false, // Establece el tipo de contenido como false para que jQuery maneje autom�ticamente el encabezado
                processData: false, // No procesa los datos, ya que FormData lo hace autom�ticamente
                success: function (data) {
                    // En caso de �xito en la solicitud:
                    // Cierra el modal de edici�n de foto
                    $('#editFoto').modal('hide');

                    // Recarga la p�gina actual para reflejar los cambios
                    location.reload();
                },
                error: function () {
                    // En caso de error en la solicitud:
                    // Registra un mensaje de error en la consola (para fines de depuraci�n)
                    console.log('Error al editar la foto del perro.');
                }
            });
        } else {
            // Pedira que se ingrese un dato
        }
    }


    /**
     * Esta funci�n se encarga de eliminar un perro a trav�s de una solicitud AJAX al servidor.
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

            // Realiza una solicitud AJAX al servlet 'SvOpciones' para editar las caracter�sticas del perro
            $.ajax({
                url: 'SvOpciones?nombre=' + nombre + '&nuevaRaza=' + nuevaR + '&nuevosPuntos=' + nuevosPuntos + '&nuevaEdad=' + nuevaEdad, // URL con cuatro par�metros: nombre, nuevaRaza, nuevosPuntos y nuevaEdad
                method: 'GET', // M�todo HTTP utilizado para la solicitud (GET en este caso)
                success: function (data) {
                    // En caso de �xito en la solicitud

                    // Recarga la p�gina actual para reflejar los cambios
                    location.reload();
                },
                error: function () {
                    // En caso de error en la solicitud:

                    // Registra un mensaje de error en la consola (para fines de depuraci�n)
                    console.log('Error al editar las caracter�sticas del perro.');
                }
            });
        } else {
            // Pedira que se ingrese un dato
        }
    }
</script>

<!---------------------------------------Scripts para la parte de editar las caracteristicas ------------------------------------>

<script>
    /**
     * Variable global utilizada para almacenar temporalmente el nombre del perro
     * que se mostrar� en el modal de confirmaci�n antes de eliminarlo.
     */
    var nombreEditar = "";

    /**
     * Esta funci�n se encarga de mostrar el modal de confirmaci�n antes de eliminar un perro.
     * Se dispara cuando se muestra el modal.
     */
    $('#editModalConfirm').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del bot�n
        var nombrePerro = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre del perro en la variable global 'nombreP'
        nombreEdit = nombrePerro;

        // Actualiza el contenido del modal con el nombre del perro
        modal.find('#nombrePerroEnModal').text(nombrePerro);
    });


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
                console.log('Error al cargar los detalles del perro');
            }
        });
    });


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

<!------------------------------------------------- Scripts para buscar perro ----------------------------------------------->

<script>
    function buscarPor(opcion) {

        // Obtener el valor del input
        var inputNombre = document.getElementById("inputNombre").value;

        // Verificar si inputNombre est� vac�o y asignar un valor predeterminado si es necesario
        if (inputNombre.trim() === "") {
            inputNombre = ""; // Reemplaza "ValorPredeterminado" con el valor que desees
        }

        var buscarPor = opcion;

        // Realiza una solicitud AJAX al servlet para realizar la ordenaci�n alfab�tica
        $.ajax({
            url: 'SvBuscar?opcion=' + buscarPor + '&nombre=' + inputNombre,
            method: 'GET', // Utiliza POST u otro m�todo HTTP seg�n corresponda
            success: function (data) {
                // En caso de �xito en la solicitud:
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al realizar la b�squeda');
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


    // Funci�n para mostrar el modal de mensaje cuando haya errores en al intentar ingresar datos que ya se estan registrado
    function errorModal() {
        $("#errorModal").modal("show");
    }

    // Funci�n para mostrar el modal de mensaje cuando no se encuentren perros registrados
    function mensajeNoPerros() {
        $("#mensajeNoPerros").modal("show");
    }
    
    // Funci�n para mostrar el modal de mensaje cuando el usuario ingrese una imagen con un nombre supere el limite de caracteres
    function mostrarLimite() {
        $("#errorLimiteModal").modal("show");
    }

</script>

<!---------------------------------------------- ////Scripts para buscar perro ------------------------------------------------->

<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
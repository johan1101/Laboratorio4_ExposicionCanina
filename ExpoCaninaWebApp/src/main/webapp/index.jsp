
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
                            const maxLength = 15; // Límite de caracteres permitidos en el nombre del archivo

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
                            <input type="text" class="form-control" id="edad" name="edad" maxlength="2" required pattern="[0-9]+" title="Por favor, ingrese solo números">
                        </div>
                    </div>
                    <!-- Botón de tipo submit que permite insertar un perro -->
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
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('puntajeMayor')">Puntaje más alto</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('puntajeMenor')">Puntaje más bajo</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('edadMayor')" >Perro más viejo</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="buscarPor('edadMenor')">Perro más joven</a></li>
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

<!-- Modal para la visualización del perro -->
<div class="modal fade" id="exampleModalDetalles" tabindex="-1" aria-labelledby="exampleModalLabelDetalles" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
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
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="deleteDog()">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de mensaje para informar que no hay perros registrados en la búsqueda -->
<div class="modal fade" id="mensajeNoPerros" tabindex="-1" aria-labelledby="mensajeNoPerrosLabelConfirm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mensajeNoPerrosLabelConfirm">Mensaje de búsqueda</h5>
            </div>
            <div class="modal-body">
                <!-- Imagen de error en la busqueda -->
                <img src="./img/error.jpg" alt="alt" width="100%"/>
                <!-- Mensaje que informa al usuario que no se encontro el perro buscado -->
                <h5 align="center">No se encontro ningún perro con ese nombre</h5>
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
                <p align="center">Por favor verifique la información e intente nuevamente.</p>
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
                <h6 align="center">El nombre del archivo no puede tener más de 15 caracteres, por favor cambia el nombre.</h6>
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
                            <input type="text" class="form-control" id="nuevaEdad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números">
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


<!----------------------------------------- Scripts ------------------------------------------>

<script>
    <%@include file= "scripts/script.js" %>
</script>



<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
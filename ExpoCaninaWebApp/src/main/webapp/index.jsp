<%@page import="com.mundo.expocaninawebapp.Serializacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mundo.expocaninawebapp.Perro"%>
<%@include file= "templates/header.jsp" %>

    <div class="container text-left">
        <img src="./img/front.png" alt="">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card card-body"> <!-- Tarjeta de trabajo -->
                        <form action ="SvExpCanina" method = "POST" >
                            <h3>Insertar nuevo perro</h3><br>
                            <div class="col-auto">
                                <label class="visually-hidden" for="nombre">Nombre</label>
                                <div class="input-group">
                                    <div class="input-group-text">Nombre:</div>
                                    <input type="text" class="form-control" id="nombre" name="nombre" required
                                </div>
                            </div>

                            <br><div class="col-auto">
                                <label class="visually-hidden" for="raza">Raza</label>
                                <div class="input-group">
                                    <div class="input-group-text">Raza:</div>
                                    <input type="text" class="form-control" id="raza" name="raza" required
                                </div>
                            </div>

                            <br><div class="col-auto">
                                <label class="visually-hidden" for="imagen">Imagen</label>
                                <div class="input-group">
                                    <div class="input-group-text">Imagen:</div>
                                    <input type="file" class="form-control" id="imagen" name="imagen" required 
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
                                    <input type="text" class="form-control" id="edad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números" 
                                </div>
                            </div>
                        </div>
                        <br><button type="submit" class="btn btn-success">Insertar Perro</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-8 col-md-8">
        <div class="card card-body"> <!-- Tarjeta de trabajo -->
            <div class="row">
                <table class="table table-dark table-striped">
                    <thead>
                        <tr>
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
                            
                            //Obtener el arrayList de la solicitud
                            ArrayList <Perro> misPerros = new ArrayList<>();
                            ServletContext context = getServletContext();
                            Serializacion.leerArchivo(misPerros, context);
                            
                            if (misPerros != null) {
                               for (Perro perro : misPerros) {
                        %>                   
                        <tr>
                            <td><%= perro.getNombre()%></td>
                            <td><%= perro.getRaza()%></td>
                            <td><%= perro.getImagen()%></td>
                            <td><%= perro.getPuntos()%></td>
                            <td><%= perro.getEdad()%></td>
                            <td>Editar</td>               
                        </tr>
                        <% }
                        }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@include file= "templates/header.jsp" %>
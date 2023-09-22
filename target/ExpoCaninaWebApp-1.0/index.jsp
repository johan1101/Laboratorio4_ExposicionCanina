<%@include file= "templates/header.jsp" %>

    <div class="container text-left">
        <img src="./img/front.png" alt="">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card card-body"> <!-- Tarjeta de trabajo -->
                            <h3>Insertar nuevo perro</h3><br>
                            <div class="col-auto">
                                <label class="visually-hidden" for="nombre">Nombre</label>
                                <div class="input-group">
                                    <div class="input-group-text">Nombre:</div>
                                    <input type="text" class="form-control" id="nombre" name="nombre"
                                </div>
                            </div>

                            <br><div class="col-auto">
                                <label class="visually-hidden" for="raza">Raza</label>
                                <div class="input-group">
                                    <div class="input-group-text">Raza:</div>
                                    <input type="text" class="form-control" id="raza" name="raza"
                                </div>
                            </div>

                            <br><div class="col-auto">
                                <label class="visually-hidden" for="imagen">Imagen</label>
                                <div class="input-group">
                                    <div class="input-group-text">Imagen:</div>
                                    <input type="text" class="form-control" id="imagen" name="imagen"
                                </div>
                            </div>

                            <br><div class="col-auto">
                                <label class="visually-hidden" for="puntos">Puntos</label>
                                <div class="input-group">
                                    <div class="input-group-text">Puntos</div>
                                    <select class="form-select" name="puntos" aria-label="Default select example">
                                        <option selected>Seleccione</option>
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
                                    <input type="text" class="form-control" id="edad" name="edad"
                                </div>
                            </div>
                        </div>
                        <br><button type="submit" class="btn btn-success">Insertar Perro</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file= "templates/header.jsp" %>
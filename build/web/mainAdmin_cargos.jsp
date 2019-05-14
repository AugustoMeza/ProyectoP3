<%-- 
    Document   : mainAdmin_cargos
    Created on : 04-24-2019, 01:04:56 AM
    Author     : josea
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/custom.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Main Administrador - Usuarios</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#"><h5>SGP</h5></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse align-items-end" id="navbarToggler">
                <ul class="navbar-nav ml-auto">
                    <%@include file="header.jsp"%>
                </ul>
            </div>
        </nav>
                    
        <nav class="navbar border">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin.jsp">Principal</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin_empleados.jsp">Empleados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin_usuarios.jsp">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link border-bottom border-dark" href="mainAdmin_cargos.jsp">Cargos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin_areas.jsp">Áreas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Registro DB</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <br><br><br>
                   <h2 style="margin-left:15px">Cargos</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active pill-color-swap " id="v-pills-ver-tab" data-toggle="tab" href="#v-pills-ver" role="tab" 
                             aria-controls="v-pills-ver" aria-selected="true">Ver cargos</a>
                          <a class="nav-link pill-color-swap" id="v-pills-insertar-tab" data-toggle="tab" href="#v-pills-insertar" role="tab" 
                             aria-controls="v-pills-insertar" aria-selected="false">Agregar cargo</a>
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-ver" role="tabpanel" aria-labelledby="v-pills-ver-tab">
                                <div class="col-md-12 border-dark">
                                    <c:if test="${param.IngresCargo eq 'Ingreso de cargo'}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El registro fue ingresado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Eliminado eq 'Cargo eliminado'}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El registro fue eliminado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class='form-group row'>
                                                <label class="col-sm-4 col-form-label" for='inputBuscarUsuarios'>Buscar cargo </label>
                                                <div class="col-sm-8" >
                                                    <input type='text' class='form-control' id="inputBuscarUsuarios">
                                                </div>
                                            </div>
                                            <table class="table table-hover table-responsive-lg border">
                                                <thead class="thead-ligth">
                                                  <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Nombre Cargo</th>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                    <sql:query var="s2" dataSource="jdbc/mysql">
                                                        Select * from cargos
                                                    </sql:query>

                                                    <c:forEach var="cargos" items="${s2.rows}">
                                                        <tr>
                                                            <td width="20%"><c:out value="${cargos.idCargo}"></c:out></td>
                                                            <td width="50%"><c:out value="${cargos.nombreCargo}"></c:out></td>
                                                            <td width="15%">
                                                                <a href="" class="btn btn-info  d-flex justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">create</i> Editar
                                                                </a>
                                                            </td>
                                                            <td width="15%">
                                                                <a href="ProcesarAdmin.jsp?idCargoEliminar=${cargos.idCargo}" class="btn btn-danger  d-flex justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">delete_outline</i> Eliminar
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-insertar" role="tabpanel" aria-labelledby="v-pills-insertar-tab">
                                <div class="justify-content-center border-dark">
                                    <div class="col-md-6 offset-md-3 ">
                                        
                                        <form class="" name="cargo" action="ProcesarAdmin.jsp" method="POST">
                                            <div class="form-group">
                                                <label class="" for="NombreUsuario">Nombre de cargo</label>
                                                <input class="form-control" name="nombreCargo" id="nombreCargo" type="text">
                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <button class="btn btn-success " type="submit">
                                                   Agregar Cargo 
                                                </button>  
                                            </div>    
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
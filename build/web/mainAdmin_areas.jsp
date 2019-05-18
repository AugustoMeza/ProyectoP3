<%-- 
    Document   : mainAdmin_areas
    Created on : 04-24-2019, 01:05:16 AM
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
        <title>Main Administrador - Empleados</title>
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
                    <a class="nav-link" href="mainAdmin_cargos.jsp">Cargos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link border-bottom border-dark " href="mainAdmin_areas.jsp">Áreas</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <br><br><br>
                   <h2 style="margin-left:15px">Áreas</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active pill-color-swap " id="v-pills-ver-tab" data-toggle="tab" href="#v-pills-ver" role="tab" 
                             aria-controls="v-pills-ver" aria-selected="true">Ver áreas</a>
                          <a class="nav-link pill-color-swap" id="v-pills-insertar-tab" data-toggle="tab" href="#v-pills-insertar" role="tab" 
                             aria-controls="v-pills-insertar" aria-selected="false">Agregar área</a>
                        </div>
                    </div>
                    <div class="col-10 border">
                        <br>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-ver" role="tabpanel" aria-labelledby="v-pills-ver-tab">
                                <div class="col-md-12 border-dark">
                                    <c:if test="${param.IngresoArea eq 'Ingreso de area'}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El área fue ingresada satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Eliminado eq 'Area eliminada'}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El registro fue eliminado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="col-md-12">
                                        <div class='form-group row'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar areas </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                            </div>
                                        </div>
                                        <table class="table table-hover table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col" class=" "></th>
                                                <th scope="col" class=" "></th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="se" dataSource="jdbc/mysql">
                                                    select * from areas
                                                </sql:query>

                                                <c:forEach var="areas" items="${se.rows}">
                                                    <tr>
                                                        <td width="20%"><c:out value="${areas.idArea}"></c:out></td>
                                                        <td width="50%"><c:out value="${areas.nombreArea}"></c:out></td>
                                                        <td width="15%">
                                                            <a href="" class="btn btn-info d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">create</i> Editar
                                                            </a>
                                                        </td>
                                                        <td width="15%">
                                                            <a href="ProcesarAdmin.jsp?idAreaEliminar=${areas.idArea}" class="btn btn-danger  d-flex justify-content-center align-content-between">
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
                            <div class="tab-pane fade" id="v-pills-insertar" role="tabpanel" aria-labelledby="v-pills-insertar-tab">
                                <div class="justify-content-center">
                                    <h3 class="text-center">Nueva área</h3>
                                    <br>
                                    <div class="col-md-6 offset-md-3 ">
                        
                                        <form class="" name="areas" action="ProcesarAdmin.jsp" method="POST">
                                            <div class="form-group">
                                                <label class="" for="NombreUsuario">Nombre de area</label>
                                                <input class="form-control" name="nombreArea" id="nombreArea" type="text">
                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <button class="btn btn-success " type="submit">
                                                   Agregar area 
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
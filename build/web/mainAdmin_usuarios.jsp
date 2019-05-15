<%-- 
    Document   : usuarios
    Created on : 04-23-2019, 03:07:46 PM
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
                    <a  class="nav-link border-bottom border-dark" href="mainAdmin_usuarios.jsp">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin_cargos.jsp">Cargos</a>
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
                   <h2 style="margin-left:15px">Usuarios</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active pill-color-swap " id="v-pills-ver-tab" data-toggle="tab" href="#v-pills-ver" role="tab" 
                             aria-controls="v-pills-ver" aria-selected="true">Ver usuarios</a>
                          <a class="nav-link pill-color-swap" id="v-pills-insertar-tab" data-toggle="tab" href="#v-pills-insertar" role="tab" 
                             aria-controls="v-pills-insertar" aria-selected="false">Agregar usuario</a>
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-ver" role="tabpanel" aria-labelledby="v-pills-ver-tab">
                                <div class="col-md-12 border-dark">
                                    <c:if test="${param.IngresoUsuario eq 'Ingreso de usuario'}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El usuario fue ingresado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.UsuarioEliminado eq 'eliminado'}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El usuario fue eliminado satisfactoriamente
                                            <button type="button"  class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class='form-group row'>
                                                <label class="col-sm-4 col-form-label" for='inputBuscarUsuarios'>Buscar usuario: </label>
                                                <div class="col-sm-8" >
                                                    <input type='text' class='form-control' id="inputBuscarUsuarios">
                                                </div>
                                            </div>
                                            <table class="table table-hover table-responsive-lg border">
                                                <thead class="thead-dark">
                                                  <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Nombre usuario</th>
                                                    <th scope="col">Tipo usuario</th>
                                                    <th scope="col">Empleado</th>
                                                    <th scope="col"></th>
                                                    <th scope="col"></th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                    <sql:query var="s2" dataSource="jdbc/mysql">
                                                        Select 
                                                            usuarios.idUsuario as id, 
                                                            usuarios.nombreUsuario as usuario, 
                                                            tipoUsuario.nombreTipoUsuario as tipo,
                                                            empleados.nombres as nombres,
                                                            empleados.apellidos as apellidos     
                                                        from usuarios 
                                                        inner join empleados
                                                        on empleados.idEmpleado = usuarios.idEmpleado
                                                        inner join tipoUsuario
                                                        on tipoUsuario.idTipoUsuario = usuarios.tipoUsuario

                                                    </sql:query>

                                                    <c:forEach var="usuario" items="${s2.rows}">
                                                        <tr>
                                                            <td width="10%"><c:out value="${usuario.idUsuario}"></c:out></td>
                                                            <td width="15%"><c:out value="${usuario.nombreUsuario}"></c:out></td>
                                                            <td width="25%"><c:out value="${usuario.nombreTipoUsuario}"></c:out></td>
                                                            <td width="30%"><c:out value="${usuario.nombres} ${usuario.apellidos}"></c:out></td>
                                                            <td width="10%">
                                                                <a data-toggle="tooltip" title="Editar" data-placement="top"
                                                                    href="" class="btn btn-info  botones_accion justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">create</i>
                                                                </a>
                                                            </td>
                                                            <td width="10%">
                                                                <a data-toggle="tooltip" title="Eliminar" data-placement="top"
                                                                    href="ProcesarAdmin.jsp?idUsuarioEliminar=${usuario.idUsuario}" class="btn btn-danger botones_accion justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">delete_outline</i>
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
                                        <form class="" action="ProcesarAdmin.jsp">
                                            <div class="form-group">    
                                                <label class="" for="selectEmpleado">Empleado</label>
                                                <select class="form-control" id="selectEmpleado" name="selectEmpleado">
                                                    <option>-- selecionar una opción</option>
                                                    <sql:query var="s1" dataSource="jdbc/mysql">
                                                        Select * from empleados 
                                                    </sql:query>
                                                    <c:forEach var="users" items="${s1.rows}">
                                                        <option value='<c:out value="${users.idEmpleado}"></c:out>'>
                                                            <c:out value="${users.idEmpleado} - ${users.nombres} ${users.apellidos}"></c:out>
                                                        </option>
                                                    </c:forEach>    
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="" for="NombreUsuario">Nombre de usuario</label>
                                                <input class="form-control" id="nombreUsuario" name="nombreUsuario" type="text">
                                            </div>
                                            <div class="form-group">        
                                                <label class="" for="contraUsuario">Contraseña</label>
                                                <input class="form-control" id="contraUsuario" name="contraUsuario" type="password">
                                            </div>
                                            <div class="form-group">        
                                                <label class="" for="selectTipo" >Tipo de usuario</label>
                                                <select class="form-control" id="selectTipo" name="selectTipo">
                                                    <option>-- selecionar una opción</option>
                                                    <sql:query var="s0" dataSource="jdbc/mysql">
                                                        Select * from tipoUsuario 
                                                    </sql:query>
                                                    <c:forEach var="tipos" items="${s0.rows}">
                                                        <option value='<c:out value="${tipos.idTipoUsuario}"></c:out>'>
                                                            <c:out value="${tipos.idTipoUsuario} - ${tipos.nombreTipoUsuario}"></c:out>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <button class="btn btn-success ">
                                                   Añadir usuario 
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
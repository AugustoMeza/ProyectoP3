<%-- 
    Document   : mainAdmin_empleados
    Created on : 04-24-2019, 01:05:51 AM
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
        
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/js/tempusdominus-bootstrap-4.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.0-alpha14/css/tempusdominus-bootstrap-4.min.css" />
  
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
                    <a class="nav-link border-bottom border-dark" href="mainAdmin_empleados.jsp">Empleados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainAdmin_usuarios.jsp">Usuarios</a>
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
                    
                   <h2 style="margin-left:15px">Empleados</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active pill-color-swap " id="v-pills-ver-tab" data-toggle="tab" href="#v-pills-ver" role="tab" 
                             aria-controls="v-pills-ver" aria-selected="true">Ver empleados</a>
                          <a class="nav-link pill-color-swap" id="v-pills-insertar-tab" data-toggle="tab" href="#v-pills-insertar" role="tab" 
                             aria-controls="v-pills-insertar" aria-selected="false">Agregar empleado</a>
                        </div>
                    </div>
                    <div class="col-10 border">
                        <br>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-ver" role="tabpanel" aria-labelledby="v-pills-ver-tab">
                                <div class="col-md-12 border-dark">
                                    <c:if test="${param.IngresoEmpleado eq 'Ingreso de empleado'}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El empleado fue ingresado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Deshabilitado eq 'Empleado Deshabilitado'}">
                                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El empleado fue deshabilitado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Actualizado eq 'empleado actualizado'}">
                                        <div class="alert alert-info alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>El empleado fue actualizado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="col-md-12">
                                        <div class='form-group row'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar empleado </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                            </div>
                                        </div>
                                        <table class="table table-hover table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Cargo</th>
                                                <th scope="col">Area</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Telefono</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="se" dataSource="jdbc/mysql">
                                                    select 
                                                        empleados.idEmpleado, 
                                                        empleados.nombres, 
                                                        empleados.apellidos,
                                                        empleados.documentoUnico, 
                                                        empleados.email, 
                                                        empleados.telefono,
                                                        empleados.activo,
                                                        empleados.jefe,
                                                        cargos.nombreCargo, 
                                                        areas.nombreArea
                                                    from empleados 
                                                    inner join cargos on 
                                                        empleados.cargo = cargos.idCargo 
                                                    inner join areas on
                                                        areas.idArea = empleados.area
                                                </sql:query>

                                                <c:forEach var="empleados" items="${se.rows}">
                                                    <c:if test="${empleados.activo == 0}">
                                                        
                                                        <tr>
                                                            <td width="6%"><c:out value="${empleados.idEmpleado}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombres} ${empleados.apellidos}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombreArea}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombreCargo}"></c:out></td>
                                                            <td width="16%"><c:out value="${empleados.email}"></c:out></td>
                                                            <td width="6%"><c:out value="${empleados.telefono}"></c:out></td>
                                                            <td width="4">
                                                                <a href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                                   data-toggle="modal" data-target="#modal${empleados.idEmpleado}">
                                                                    <i class="material-icons mr-1">description</i>
                                                                </a>
                                                            </td>
                                                            <td width="4">
                                                                <a href="update_mainAdmin_empleados.jsp?id=${empleados.idEmpleado}" class="btn btn-primary  d-flex justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">create</i>
                                                                </a>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${empleados.activo == 1}">
                                                        <tr>
                                                            <td width="5%"><c:out value="${empleados.idEmpleado}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombres} ${empleados.apellidos}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombreArea}"></c:out></td>
                                                            <td width="20%"><c:out value="${empleados.nombreCargo}"></c:out></td>
                                                            <td width="15%"><c:out value="${empleados.email}"></c:out></td>
                                                            <td width="5%"><c:out value="${empleados.telefono}"></c:out></td>
                                                            <td width="5%">
                                                                <button  type="button" href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                                 data-toggle="modal" data-target="#modal${empleados.idEmpleado}" >
                                                                    <i class="material-icons mr-1">description</i>
                                                                </button>
                                                            </td>
                                                            <td width="5%">
                                                                <a href="update_mainAdmin_empleados.jsp?id=${empleados.idEmpleado}" class="btn btn-primary  d-flex justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">create</i>
                                                                </a>
                                                            </td>
                                                            <td width="5%">
                                                                <a href="ProcesarAdmin.jsp?idEmpleadoEliminar=${empleados.idEmpleado}" class="btn btn-danger  d-flex justify-content-center align-content-between">
                                                                    <i class="material-icons mr-1">delete_outline</i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                                          
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>   
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-insertar" role="tabpanel" aria-labelledby="v-pills-insertar-tab">
                                <div class="justify-content-center">
                                    <h3 class="text-center">Nuevo empleado</h3>
                                    <br>
                                    <div class="col-md-6 offset-md-3 ">
                        
                                        <form class="" name="empleados" action="ProcesarAdmin.jsp" method="POST">
                                            <div class="form-group">
                                                <label class="" for="nombre">Nombre de empleado</label>
                                                <input class="form-control" name="nombre" id="nombre" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label class="" for="apellido">Apellido de empleado</label>
                                                <input class="form-control" name="apellido" id="apellido" type="text">
                                            </div>
                                            <div class="form-group">        
                                                <label class="" for="selectCargo">Cargo</label>
                                                <select class="form-control" name="selectCargo" id="selectCargo">
                                                    <option>-- selecionar una opción</option>
                                                    <sql:query var="s0" dataSource="jdbc/mysql">
                                                        Select * from cargos 
                                                    </sql:query>
                                                    <c:forEach var="cargos" items="${s0.rows}">
                                                        <option value='<c:out value="${cargos.idCargo}"></c:out>'>
                                                            <c:out value="${cargos.idCargo} - ${cargos.nombreCargo}"></c:out>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">        
                                                <label class="" for="selectArea">Área</label>
                                                <select class="form-control" name="selectArea" id="selectArea">
                                                    <option>-- selecionar una opción</option>
                                                    <sql:query var="s1" dataSource="jdbc/mysql">
                                                        Select * from areas 
                                                    </sql:query>
                                                    <c:forEach var="areas" items="${s1.rows}">
                                                        <option value='<c:out value="${areas.idArea}"></c:out>'>
                                                            <c:out value="${areas.idArea} - ${areas.nombreArea}"></c:out>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="" for="NombreUsuario">Documento único de indentidad</label>
                                                <input class="form-control" name="dui" id="dui" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label class="" for="email">email</label>
                                                <input class="form-control" name="email" id="email" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label class="" for="telefono">telefono</label>
                                                <input class="form-control" name="telefono" id="telefono" type="text">
                                            </div>
                                            <div class="form-group">    
                                                <label class="" for="selectEmpleado">Jefe</label>
                                                <select class="form-control" name="selectJefe" id="selectJefe">
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
                                                <br>
                                                <button class="btn btn-success " type="submit">
                                                   Agregar empleado 
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
        
    <sql:query var="modals" dataSource="jdbc/mysql">
        select 
            empleados.idEmpleado, 
            empleados.nombres, 
            empleados.apellidos, 
            cargos.nombreCargo, 
            areas.nombreArea, 
            empleados.documentoUnico, 
            empleados.email,
            empleados.jefe,
            empleados.telefono,
            empleados.activo
        from empleados 
        inner join cargos on 
            empleados.cargo = cargos.idCargo 
        inner join areas on
            areas.idArea = empleados.area
    </sql:query>

    <c:forEach var="emp" items="${modals.rows}">
        <div class="modal fade" id="modal${emp.idEmpleado}" tabindex="-1" role="dialog"
            aria-labelledby="${emp.idEmpleado}" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="">Información de empleado</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-hover table-responsive-lg border">
                                <thead class="thead-ligth">
                                  <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Cargo</th>
                                    <th scope="col">Area</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">DUI</th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Jefe</th>
                                    <th scope="col">Activo</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td width="5%"><c:out value="${emp.idEmpleado}"></c:out></td>
                                        <td width="15%"><c:out value="${emp.nombres} ${emp.apellidos}"></c:out></td>
                                        <td width="15%"><c:out value="${emp.nombreArea}"></c:out></td>
                                        <td width="15%"><c:out value="${emp.nombreCargo}"></c:out></td>
                                        <td width="20%"><c:out value="${emp.email}"></c:out></td>
                                        <td width="5%"><c:out value="${emp.documentoUnico}"></c:out></td>
                                        <td width="5%"><c:out value="${emp.telefono}"></c:out></td>
                                        
                                        <sql:query var="selectJefe" dataSource="jdbc/mysql">
                                            select empleados.nombres, empleados.apellidos 
                                            from empleados where empleados.idEmpleado = ?
                                            <sql:param value="${emp.jefe}"/>
                                        </sql:query>
                                            
                                        <c:forEach var="jefe" items="${selectJefe.rows}">
                                            
                                            <td width="15%"><c:out value="${jefe.nombres} ${jefe.apellidos}"></c:out></td>
                                            
                                        </c:forEach>
                                        
                                        
                                        <td width="5%">
                                            <c:if test="${emp.activo == 0}">
                                                   <input type="checkbox" unchecked disabled>
                                            </c:if>
                                            <c:if test="${emp.activo == 1}">
                                                   <input type="checkbox" checked disabled>
                                            </c:if>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                </div>
            </div>
        </div>
        
        
    </c:forEach>
               
    </body>
</html>
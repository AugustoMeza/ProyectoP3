<%-- 
    Document   : mainJefeDesarrollo_casos
    Created on : 04-26-2019, 02:37:25 AM
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
        <title>Main Jefe Desarrollo - Casos</title>
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
                    <a class="nav-link" href="mainJefeDesarrollo.jsp">Principal</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainJefeDesarrollo_solicitudes.jsp">Solicitudes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="mainJefeDesarrollo_casos.jsp">Casos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainJefeDesarrollo_bitacoras.jsp">Bitácoras</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <br><br><br>
                   <h2 style="margin-left:15px">Casos</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            
                            <a class="nav-link active pill-color-swap " id="desarrollo-tab" data-toggle="tab" href="#pills-desarrollo" role="tab" 
                                  aria-controls="pills-desarrollo" aria-selected="true">En Desarrollo</a>
                            <a class="nav-link pill-color-swap " id="pills-rechazadas-tab" data-toggle="tab" href="#pills-rechazadas" role="tab" 
                                aria-controls="pills-rechazadas" aria-selected="true">En espera de revisor</a>
                            <a class="nav-link pill-color-swap" id="pills-aceptadas-tab" data-toggle="tab" href="#pills-aceptadas" role="tab" 
                               aria-controls="pills-aceptadas" aria-selected="false">Vencidos</a>
                            <a class="nav-link pill-color-swap " id="pills-rechazadas-tab" data-toggle="tab" href="#pills-rechazadas" role="tab" 
                                aria-controls="pills-rechazadas" aria-selected="true">Devueltos</a>
                            <a class="nav-link pill-color-swap" id="pills-aceptadas-tab" data-toggle="tab" href="#pills-aceptadas" role="tab" 
                               aria-controls="pills-aceptadas" aria-selected="false">Finalizados</a>
                            
                        </div>
                    </div>
                    <div class="col-10 border">
                        <br>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-desarrollo" role="tabpanel" aria-labelledby="">
                                <div class="col-md-12 border-dark">
                                    
                                    <div class="col-md-12">
                                        <div class='form-group form-inline'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar Caso </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                                <button class="btn btn-dark">Buscar</button>
                                            </div>
                                        </div>
                                        <table class="table table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                
                                                <th scope="col">Id caso</th>
                                                <th scope="col">Sol.</th>
                                                <th scope="col">Programador</th>
                                                <th scope="col">Revisor</th>
                                                <th scope="col">Creada</th>
                                                <th scope="col">Limite</th>
                                                
                                                <th scope="col" class=""></th>
                                                <th scope="col" class=""></th>
                                                
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="caso1" dataSource="jdbc/mysql">
                                                    SELECT casos.idCaso, casos.idSolicitud, 
                                                        empleados.nombres as nombresProgramador, 
                                                        empleados.apellidos as apellidosProgramador, 
                                                        (select nombres from empleados where idEmpleado = casos.idRevisor) as nombresRevisor, 
                                                        (select apellidos from empleados where idEmpleado = casos.idRevisor ) as apellidosRevisor, 
                                                        casos.fechaCreacion, casos.fechaLimite, estadoscaso.estado 
                                                    from casos 
                                                    inner join empleados on empleados.idEmpleado = casos.idProgramador 
                                                    inner join estadoscaso on estadoscaso.idEstado = casos.estado
                                                    where casos.estado = 2
                                                </sql:query>

                                                <c:forEach var="casos1" items="${caso1.rows}">
                                                    <tr>
                                                        <td width="15%"><c:out value="${casos1.idCaso}"></c:out></td>
                                                        <td width="5%"><c:out value="${casos1.idSolicitud}"></c:out></td>
                                                        <td width="20%"><c:out value="${casos1.nombres} ${casos1.apellidos}"></c:out></td>
                                                        <td width="20%"><c:out value="${casos1.nombresRevisor} ${casos1.apellidosRevisor}"></c:out></td>
                                                        <td width="15%"><c:out value="${casos1.fechaCreacion}"></c:out></td>
                                                        <td width="15%"><c:out value="${casos1.fechaLimite}"></c:out></td>
                                                        
                                                        <td width="5%">
                                                            <a href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                               data-toggle="modal" data-target="#modal${casos1.idCaso}">
                                                                <i class="material-icons mr-1">description</i> 
                                                            </a>
                                                        </td>
                                                        
                                                        <td width="5%">
                                                            <a href="" class="btn btn-primary  d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">forward</i> 
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>   
                                </div>
                            </div>
                            
                            <!--Pill Rechazadas-->
                            <div class="tab-pane fade show" id="pills-rechazadas" role="tabpanel" aria-labelledby="">
                                <div class="col-md-12 border-dark">
                                    
                                    <div class="col-md-12">
                                        <div class='form-group form-inline'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar Solicitud </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                                <button class="btn btn-dark">Buscar</button>
                                            </div>
                                        </div>
                                        <table class="table table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Solicitante</th>
                                                <th scope="col">Área</th>
                                                <th scope="col">Archivo</th>
                                                <th scope="col">Creada</th>
                                                <th scope="col" class=""></th>
                                                <th scope="col" class=""></th>
                                                
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="se2" dataSource="jdbc/mysql">
                                                    select 
                                                        solicitudes.idSolicitud,
                                                        empleados.nombres,
                                                        empleados.apellidos,
                                                        solicitudes.detalleSolicitud,
                                                        solicitudes.archivoPdf,
                                                        solicitudes.fechaSolicitud,
                                                        estadosdesolicitud.estadoSolicitud, 
                                                        areas.nombreArea
                                                    from solicitudes
                                                    inner join empleados
                                                    on empleados.idEmpleado = solicitudes.idEmpleadoSolicitante
                                                    inner join estadosDeSolicitud
                                                    on estadosdesolicitud.idEstado = solicitudes.estado
                                                    inner join areas
                                                    on solicitudes.area = areas.idArea
                                                    where solicitudes.estado = 2
                                                </sql:query>

                                                <c:forEach var="solicitudes2" items="${se2.rows}">
                                                    <tr>
                                                        <td width="10%"><c:out value="${solicitudes2.idSolicitud}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes2.nombres} ${solicitudes.apellidos}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes2.nombreArea}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes2.archivoPdf}"></c:out></td>
                                                        <td width="15%"><c:out value="${solicitudes2.fechaSolicitud}"></c:out></td>
                                                        <td width="5%">
                                                            <a href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                               data-toggle="modal" data-target="#modal${solicitudes2.idSolicitud}">
                                                                <i class="material-icons mr-1">description</i> 
                                                            </a>
                                                        </td>
                                                        
                                                        <td width="5%">
                                                            <a href="update_SolicitudJefeDesarrollo.jsp?idSolicitud=${solicitudes2.idSolicitud}" class="btn btn-warning  d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">forward</i> 
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>   
                                </div>
                            </div>
                            
                            <!--Pill Aceptadas--> 
                            <div class="tab-pane fade show" id="pills-aceptadas" role="tabpanel" aria-labelledby="">
                                <div class="col-md-12 border-dark">
                                    
                                    <div class="col-md-12">
                                        <div class='form-group form-inline'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar Solicitud </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                                <button class="btn btn-dark">Buscar</button>
                                            </div>
                                        </div>
                                        <table class="table table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Solicitante</th>
                                                <th scope="col">Área</th>
                                                <th scope="col">Archivo</th>
                                                <th scope="col">Creada</th>
                                                <th scope="col" class=""></th>
                                                <th scope="col" class=""></th>
                                                
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="se3" dataSource="jdbc/mysql">
                                                    select 
                                                        solicitudes.idSolicitud,
                                                        empleados.nombres,
                                                        empleados.apellidos,
                                                        solicitudes.detalleSolicitud,
                                                        solicitudes.archivoPdf,
                                                        solicitudes.fechaSolicitud,
                                                        solicitudes.idEmpleadoSolicitante,
                                                        estadosdesolicitud.estadoSolicitud, 
                                                        areas.nombreArea
                                                    from solicitudes
                                                    inner join empleados
                                                    on empleados.idEmpleado = solicitudes.idEmpleadoSolicitante
                                                    inner join estadosDeSolicitud
                                                    on estadosdesolicitud.idEstado = solicitudes.estado
                                                    inner join areas
                                                    on solicitudes.area = areas.idArea
                                                    where solicitudes.estado = 3
                                                </sql:query>

                                                <c:forEach var="solicitudes3" items="${se3.rows}">
                                                    <tr>
                                                        <td width="10%"><c:out value="${solicitudes3.idSolicitud}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes3.nombres} ${solicitudes.apellidos}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes3.nombreArea}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes3.archivoPdf}"></c:out></td>
                                                        <td width="15%"><c:out value="${solicitudes3.fechaSolicitud}"></c:out></td>
                                                        <td width="5%">
                                                            <a href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                               data-toggle="modal" data-target="#modal${solicitudes3.idSolicitud}">
                                                                <i class="material-icons mr-1">description</i> 
                                                            </a>
                                                        </td>
                                                        
                                                        <td width="5%">
                                                            <a title="Crear Caso" 
                                                               href="mainJefeDesarrollo_crearCaso.jsp?idSolicitudC=${solicitudes3.idSolicitud}&idEmpleado=${loginEmpleado}&idRevisor=${solicitudes3.idEmpleadoSolicitante}" 
                                                               class="btn btn-success  d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">forward</i> 
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
                    </div>
                </div>
            </div>
        </div> 
                                            
    <sql:query var="modals" dataSource="jdbc/mysql">
        select 
            solicitudes.idSolicitud,
            empleados.nombres,
            empleados.apellidos,
            solicitudes.detalleSolicitud,
            solicitudes.archivoPdf,
            solicitudes.fechaSolicitud,
            estadosdesolicitud.estadoSolicitud
        from solicitudes
        inner join empleados
        on empleados.idEmpleado = solicitudes.idEmpleadoSolicitante
        inner join estadosDeSolicitud
        on estadosdesolicitud.idEstado = solicitudes.estado
    </sql:query>

    <c:forEach var="sol" items="${modals.rows}">
        <div class="modal fade" id="modal${sol.idSolicitud}" tabindex="-1" role="dialog"
            aria-labelledby="${sol.idSolicitud}" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="">Información de solicitud</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-hover table-responsive-lg border">
                            <thead class="thead-ligth">
                              <tr>
                                <th scope="col">ID Solicitud</th>
                                <th scope="col">Solicitante</th>
                                <th scope="col">Fecha de creación</th>
                                <th scope="col">Estado</th>
                              </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td width="15%"><c:out value="${sol.idSolicitud}"></c:out></td>
                                    <td width="25%"><c:out value="${sol.nombres} ${sol.apellidos} ${emp.apellidos}"></c:out></td>
                                    <td width="25%"><c:out value="${sol.fechaSolicitud}"></c:out></td>
                                    <td width="25%"><c:out value="${sol.estadoSolicitud}"></c:out></td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-hover table-responsive-lg border">
                            <thead class="thead-ligth">
                                <tr>
                                  <th scope="col">Detalles</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><c:out value="${sol.detalleSolicitud}"></c:out></td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <button type="button" class="btn btn-info" data-dismiss="modal">Descargar Archivo</button>
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
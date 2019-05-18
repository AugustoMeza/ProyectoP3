<%-- 
    Document   : mainJefeArea_solicitudes
    Created on : 04-26-2019, 01:15:25 AM
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
        <title>Main Jefe Area - solicitudes</title>
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
                    <a class="nav-link" href="mainJefeArea.jsp">Principal</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link border-bottom border-dark" href="mainJefeArea_solicitudes.jsp">Solicitudes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainJefeArea_casos.jsp">Casos</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <br><br><br>
                   <h2 style="margin-left:15px">Solicitudes</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-2">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active pill-color-swap " id="v-pills-ver-tab" data-toggle="tab" href="#v-pills-ver" role="tab" 
                             aria-controls="v-pills-ver" aria-selected="true">Ver Solicitudes</a>
                          <a class="nav-link pill-color-swap" id="v-pills-insertar-tab" data-toggle="tab" href="#v-pills-insertar" role="tab" 
                             aria-controls="v-pills-insertar" aria-selected="false">Agregar Solicitud</a>
                        </div>
                    </div>
                    <div class="col-10 border">
                        <br>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-ver" role="tabpanel" aria-labelledby="v-pills-ver-tab">
                                <div class="col-md-12 border-dark">
                                    <c:if test="${param.IngresoSolicitud eq 'Ingreso de solicitud'}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>La solicitud fue ingresada satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Eliminada eq 'Solicitud eliminada'}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>La solicitud fue eliminado satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <c:if test="${param.Eliminada eq 'Solicitud actualizada'}">
                                        <div class="alert alert-info alert-dismissible fade show" role="alert">
                                            <strong>Éxito! </strong>La solicitud fue actualizada satisfactoriamente
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="col-md-12">
                                        <div class='form-group row'>
                                            <label class="col-md-4 col-form-label" for='inputBuscarUsuarios'>Buscar Solicitud </label>
                                            <div class="col-md-8" >
                                                <input type='text' class='form-control' id="inputBuscarUsuarios">
                                            </div>
                                        </div>
                                        <table class="table table-responsive-lg border">
                                            <thead class="thead-dark">
                                              <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Solicitante</th>
                                                <th scope="col">estado</th>
                                                <th scope="col">Archivo</th>
                                                <th scope="col">Creada</th>
                                                <th scope="col" class=""></th>
                                                <th scope="col" class=""></th>
                                                <th scope="col" class=" "></th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query var="se" dataSource="jdbc/mysql">
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
                                                    on estadosdesolicitud.idEstado = solicitudes.estado where solicitudes.idEmpleadoSolicitante = ?
                                                    <sql:param value="${loginEmpleado}"/>
                                                </sql:query>

                                                <c:forEach var="solicitudes" items="${se.rows}">
                                                    <tr>
                                                        <td width="10%"><c:out value="${solicitudes.idSolicitud}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes.nombres} ${solicitudes.apellidos}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes.estadoSolicitud}"></c:out></td>
                                                        <td width="20%"><c:out value="${solicitudes.archivoPdf}"></c:out></td>
                                                        <td width="15%"><c:out value="${solicitudes.fechaSolicitud}"></c:out></td>
                                                        <td width="5%">
                                                            <a href="" class="btn btn-info  d-flex justify-content-center align-content-between"
                                                               data-toggle="modal" data-target="#modal${solicitudes.idSolicitud}">
                                                                <i class="material-icons mr-1">description</i> 
                                                            </a>
                                                        </td>
                                                        <td width="5%">
                                                            <a href="" class="btn btn-primary  d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">create</i> 
                                                            </a>
                                                        </td>
                                                        <td width="5%">
                                                            <a href="ProcesarJefeArea.jsp?idSolicitudEliminar=${solicitudes.idSolicitud}" class="btn btn-danger  d-flex justify-content-center align-content-between">
                                                                <i class="material-icons mr-1">delete_forever</i> 
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
                                    <h3 class="text-center">Nueva solicitud</h3>
                                    <p>* Si desea subir un archivo PDF con la información del caso, puede hacerlo luego de mandar una corta descripción desde este formulario</p>
                                    <div class="col-md-10 offset-md-1 ">
                                        <sql:query var="areaE" dataSource="jdbc/mysql">
                                            SELECT empleados.area from empleados where idEmpleado = ?
                                            <sql:param value="${loginEmpleado}"/>
                                        </sql:query>
                                        <c:forEach var="empleado" items="${areaE.rows}">
                                            <c:set var="areaEmpleado" scope="page" value="${empleado.area}" />
                                        </c:forEach>
                        
                                        <form class="" name="solicitud" action="ProcesarJefeArea.jsp?idSolicitante=${loginEmpleado}&area=${areaEmpleado}" method="POST">
                                            <div class="form-group">
                                                <label class="" for="NombreUsuario">Detalles</label>
                                                <textarea required rows="6" class="form-control" name="detalles" id="detalles" type="text">
                                                </textarea>
                                            </div>
                                            <div class="form-group">
                                                <br>
                                                <button class="btn btn-success float-right " type="submit">
                                                   Enviar solicitud 
                                                </button>
                                                <br><br>
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
                        
                        <c:if test="${empty sol.archivoPdf}">
                             <a href="mainJefeArea_subirPdf.jsp?idSolicitud=${sol.idSolicitud}" type="button" class="btn btn-info" >Subir Archivo</a>
                        </c:if>
                        <c:if test="${not empty sol.archivoPdf}">
                            <a href="mainJefeArea_subirPdf.jsp?idSolicitud=${sol.idSolicitud}" type="button" class="btn btn-success"> Agregar nuevo archivo</a>
                            <a href="verPdf.jsp?pdf=${sol.archivoPdf}" type="button" class="btn btn-info">Ver archivo</a>
                        </c:if>
                        
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
<%-- 
    Document   : mainEmpleado_observacion
    Created on : 05-17-2019, 03:39:05 PM
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
        
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
        <title>Main Programador - Crear Bitacoras</title>
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
                    <a class="nav-link d-flex justify-content-center align-content-between"
                       href="mainEmpleado_casos.jsp">
                        <i class="material-icons mr-1">keyboard_backspace</i>Atrás</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row col-lg-12">
                    <div class="col-lg-6">
                        <h5>Casos</h5>
                        <h4>Caso - ${param.idCaso}</h4>
                        <hr>
                        <h5 class="">Elementos del caso</h5>
                        <table class="table table-responsive-lg border">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">N</th>
                                    <th scope="col">Id</th>
                                    <th scope="col">Descripción</th>
                                    
                                </tr>
                            </thead>
                            
                            <c:set value="${0}" var="contador"/> 
                            <sql:query var="elementos" dataSource="jdbc/mysql">
                                SELECT * FROM elementoscaso where idCaso = ?
                                <sql:param value="${param.idCaso}" />
                            </sql:query>

                            <c:forEach var="elemento" items="${elementos.rows}">
                                <tr>
                                    <td>${contador + 1}</td>
                                    <td>${elemento.idElemento}</td>
                                    <td>${elemento.descripcionElemento}</td>
                                                                        
                                </tr>
                                <c:set var="contador" value="${contador + 1}"></c:set>
                            </c:forEach>
                            
                        </table>
                        
                    </div>
                    <div class="col-lg-6">
                        <c:set value="${0}" var="contador2"/> 
                        <c:forEach var="el" items="${elementos.rows}">
   
                            <sql:query var="bitacoras" dataSource="jdbc/mysql">
                                SELECT * FROM bitacoraselementos where idElemento = ?
                                <sql:param value="${el.idElemento}" />
                            </sql:query>

                            <c:forEach var="bitacora" items="${bitacoras.rows}">
                                <c:set var="contador2" value="${contador2 + 1}"></c:set>
                            </c:forEach>
                        </c:forEach>
                        <h4 class="">Progreso ${(contador2/contador)*100}%</h4>
                        
                        <c:choose>
                            <c:when test="${(contador2/contador)*100 ge 75}">
                                <div class="progress" >
                                    <div class="progress-bar progress-bar-striped bg-success "
                                         role="progressbar" style="width: ${(contador2/contador)*100}%" aria-valuenow="${(contador2/contador)*100}" 
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </c:when>
                            <c:when test="${(contador2/contador)*100 gt 49 && (contador2/contador)*100 lt 75}">
                                <div class="progress" >
                                    <div class="progress-bar progress-bar-striped bg-warning "
                                         role="progressbar" style="width: ${(contador2/contador)*100}%" aria-valuenow="${(contador2/contador)*100}" 
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="progress" >
                                    <div class="progress-bar progress-bar-striped bg-danger "
                                         role="progressbar" style="width: ${(contador2/contador)*100}%" aria-valuenow="${(contador2/contador)*100}" 
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <hr style="margin-top:24px">
                        
                        <sql:query var="empleados" dataSource="jdbc/mysql">
                            Select casos.idRevisor, empleados.apellidos, empleados.nombres 
                            from casos
                            inner join empleados on empleados.idEmpleado = casos.idRevisor 
                            where idCaso = ?
                            <sql:param value="${param.idCaso}" />
                        </sql:query>
                            
                        
                        <a href="mainEmpleado_agregarObservacion.jsp?idCaso=${param.idCaso}" style="color:white" class="btn btn-primary">Agregar Observación</a>
                           
                        <!--Observaciones del empleado -->
                        <sql:query var="observaciones" dataSource="jdbc/mysql">
                        Select 
                            observacionesCaso.idObservacion,
                            observacionesCaso.idCaso,
                            empleados.nombres, empleados.apellidos,
                            observacionesCaso.detalles,
                            observacionesCaso.tipoObservacion,
                            observacionesCaso.fecha
                            from observacionesCaso
                            inner join empleados on empleados.idEmpleado = observacionesCaso.idRevisor 
                            where idCaso = ?
                            <sql:param value="${param.idCaso}" />
                        </sql:query>
                        
                        <hr>
                        <h5>Observaciones de revisor</h5>
                        <table class="table table-responsive-lg border">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Revisor</th>
                                    <th scope="col">Detalles</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Tipo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="observacion" items="${observaciones.rows}">
                                   <tr>
                                        
                                        <td width="15%">${observacion.nombres} ${observacion.apellidos}</td>
                                        <td width="5%">${observacion.fecha}</td>
                                        <td width="60%">${observacion.detalles}</td>
                                        <td width="5%">${observacion.tipoObservacion}</td>
                                    </tr> 
                                </c:forEach>
                                
                            </tbody>
                        </table>
 
                    </div>
                </div>
                          
            </div>
        </div> 
    </body>
</html>

<script>

</script>
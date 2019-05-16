<%-- 
    Document   : mainProgramador_bitacoras.jsp
    Created on : 05-15-2019, 05:33:49 PM
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
                       href="mainJefeDesarrollo_casos.jsp">
                        <i class="material-icons mr-1">keyboard_backspace</i>Atrás</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row col-lg-12">
                    <div class="col-lg-6">
                        <h5>Bitácoras</h5>
                        <h4>Caso - ${param.idCaso}</h4>
                        <hr>
                        <h5 class="">Elementos del caso</h5>
                        <table class="table table-responsive-lg border">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">N</th>
                                    <th scope="col">Id</th>
                                    <th scope="col">Descripción</th>
                                    <th></th>
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
                                    
                                    
                                    <sql:query var="bitacorasElementos" dataSource="jdbc/mysql">
                                        SELECT count(*) as cantidad FROM bitacoraselementos where idElemento = ?
                                        <sql:param value="${elemento.idElemento}" />
                                    </sql:query>

                                    <c:forEach var="be" items="${bitacorasElementos.rows}">
                                        <c:if test="${be.cantidad eq 1}">
                                            <td><a href="ProcesarProgramador.jsp?idElementoIngresado=${elemento.idElemento}&idProgramador=${loginEmpleado}&idCaso=${param.idCaso}" class="btn btn-danger"><i class="material-icons mr-1">clear</i></a></td>
                                        </c:if>
                                        <c:if test="${be.cantidad eq 0}">
                                            <td><a href="ProcesarProgramador.jsp?idElementoNuevo=${elemento.idElemento}&idProgramador=${loginEmpleado}&idCaso=${param.idCaso}" class="btn btn-success"><i class="material-icons mr-1">add_box</i></a></td>
                                        </c:if>
                                    </c:forEach>
                                    
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
                        <h5>Bitácoras del caso</h5>
                        
                        <table class="table table-hover table-responsive-lg border">
                            <thead class="thead-ligth">
                                <tr class="bg-info" style="color:white">
                                    <th scope="col">bitácora</th>
                                    <th scope="col">Elemento</th>
                                    <th scope="col">Programador</th>
                                    <th scope="col">Fecha</th>
                                   
                              </tr>
                            </thead>
                            <tbody>
                                
                                <sql:query var="bit" dataSource="jdbc/mysql">
                                    select 
                                    bitacoraselementos.idBitacora,
                                    bitacoraselementos.idElemento,
                                    casos.idCaso,
                                    empleados.nombres, 
                                    empleados.apellidos,
                                    bitacoraselementos.fechacreacion

                                    from casos 
                                    inner join elementoscaso
                                    on elementoscaso.idCaso = casos.idCaso
                                    inner join bitacoraselementos
                                    on bitacoraselementos.idElemento = elementoscaso.idElemento
                                    inner join empleados
                                    on empleados.idEmpleado = bitacoraselementos.idProgramador
                                    where casos.idCaso = ?
                                    <sql:param value="${param.idCaso}"/>
                                </sql:query>
                                <c:forEach var="bitacoras" items="${bit.rows}">
                                    <tr>
                                        <td width="15%"><c:out value="${bitacoras.idBitacora}"></c:out></td>
                                        <td width="15%"><c:out value="${bitacoras.idElemento}"></c:out></tapellidosRevisord>
                                        <td width="40%"><c:out value="${bitacoras.nombres} ${bitacoras.apellidos}"></c:out></td>
                                        <td width="30%"><c:out value="${bitacoras.fechaCreacion}"></c:out></td>
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

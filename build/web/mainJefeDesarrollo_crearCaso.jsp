<%-- 
    Document   : mainJefeDesarrollo_crearCaso
    Created on : 05-14-2019, 05:16:07 PM
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
    
        <title>Main Jefe Desarrollo - Crear Caso</title>
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
                       href="mainJefeDesarrollo_solicitudes.jsp">
                        <i class="material-icons mr-1">keyboard_backspace</i>Atrás</a>
                </li>
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row col-lg-12">
                    
                    <div class="col-lg-8 offset-lg-2">
                        <h4>Información caso</h4>
                        <hr>
                        <form action="ProcesarJefeDesarrollo.jsp" method="POST">
                            <div class="form-group sr-only">
                                <input value="${param.idEmpleado}" name="idJefeDesarrollo" id="idJefeDesarrollo">
                                <input value="${param.idSolicitudC}" name="idSolicitudCaso" id="idSolicitudCaso">
                                <input value="${param.idRevisor}" name="idRevisor" id="idRevisor">
                            </div>
                            <div class="form-group">
                                <label>Detalles del caso</label>
                                <textarea required class="form-control" rows="5" id="detalleCaso" name='detalleCaso'></textarea>
                            </div>
                            <div class="row">
                                <div class="form-group col">
                                    <label>Porgramador a cargo</label>
                                    <select required class="form-control" id="idProgramador" name="idProgramador">
                                        <option value=""> -- Seleccione un programador</option>
                                        <sql:query var="programadores" dataSource="jdbc/mysql" >
                                            Select * from empleados where jefe = ?
                                            <sql:param value="${loginEmpleado}" />
                                        </sql:query>
                                        <c:forEach var="programador" items="${programadores.rows}">
                                            <option value="${programador.idEmpleado}">${programador.nombres} ${programador.apellidos}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col">
                                    <label>Fecha límite</label>
                                    <input required class="form-control"  type="text" id="fechaLimite" name="fechaLimite">
                                </div>
                            </div>
                               
                            <div class="form-group ">
                                <br>
                                <button class="btn btn-success float-right">Crear caso</button>
                            </div>
                            
                        </form> 
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>

<script>
    $('#fechaLimite').datepicker({
        uiLibrary: 'bootstrap4',
         format: 'yyyy-mm-dd'
    });
</script>

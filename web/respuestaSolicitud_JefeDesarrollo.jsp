<%-- 
    Document   : respuestaSolicitud_JefeDesarrollo
    Created on : 05-14-2019, 04:34:23 PM
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
        <title>Main Jefe Desarrollo - Respuesta Solicitud</title>
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
                    <a class="nav-link" href="mainJefeDesarrollo_solicitudes.jsp">Atrás</a>
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
                <div class="row col-lg-12">
                    
                    <div class="col-lg-8 offset-lg-2">
                        <form action="ProcesarJefeDesarrollo.jsp" method="POST">
                            <h4>Respuesta de Solicitud</h4>
                            <hr>
                            <div class="form-group sr-only">
                                <input  value="${param.idSolicitud}" id="idSolicitudRespuesta" name="idSolicitudRespuesta">
                                <input value="${param.idEmpleado}" id="idEmpleado" name="idEmpleado">
                            </div>
                            <div class="form-group">
                                <label>Respuesta</label>
                                <textarea required class="form-control" id="respuesta" name="respuesta" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Estado de la solicitud</label>
                                <select class="form-control" id="estado" name="estado">
                                    <option required value="">-- Seleccionar una opción --</option>
                                    <option value="2">Rechazar Solicitud</option>
                                    <option value="3">Aceptar Solicitud</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-info float-right" type="submit">
                                    Responder Solicitud
                                </button>  
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>

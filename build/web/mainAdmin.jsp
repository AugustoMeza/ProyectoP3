

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/custom.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>Main Administrador</title>
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
                    <a class="nav-link" href="#">Empleados</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cargos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Áreas</a>
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
                    <h2 style="margin-left:15px">Administrador</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-3">
                            <img class="card-img-top" src="https://picsum.photos/id/274/780/100" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Ultimas consultas a la base de datos</h5>
                                <table class="table">
                                    <thead>
                                      <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Consulta</th>
                                        <th scope="col">Hora</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <th scope="row">1</th>
                                        <td>SELECT * FROM empleados</td>
                                        <td>2019-04-21 16:50:00</td>
                                      </tr>
                                      <tr>
                                        <th scope="row">1</th>
                                        <td>SELECT * FROM usuarios</td>
                                        <td>2019-04-21 17:10:00</td>
                                      </tr>
                                      <tr>
                                        <th scope="row">1</th>
                                        <td>SELECT * FROM areas</td>
                                        <td>2019-04-21 17:50:00</td>
                                      </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-3 rounded">
                        <div class="card border-dark mb-3" >
                            <div class="card-header">Empleados</div>
                            <div class="card-body">
                                <h5 class="card-title">Generar un reporte de empleados</h5>
                                <a href="#" class="btn btn-dark">Generar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 rounded">
                        <div class="card border-dark mb-3" >
                            <div class="card-header">Usuarios</div>
                            <div class="card-body">
                                <h5 class="card-title">Generar un reporte de usuarios</h5>
                                <a href="#" class="btn btn-dark">Generar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 rounded">
                        <div class="card border-dark mb-3" >
                            <div class="card-header">Casos</div>
                            <div class="card-body">
                                <h5 class="card-title">Generar un reporte de casos creados</h5>
                                <a href="#" class="btn btn-dark">Generar</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 rounded">
                        <div class="card border-dark mb-3" >
                            <div class="card-header">Solicitudes</div>
                            <div class="card-body">
                                <h5 class="card-title">Generar reporte de solicitudes creadas</h5>
                                <a href="#" class="btn btn-dark">Generar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>      

    </body>
</html>
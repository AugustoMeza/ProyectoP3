<%-- 
    Document   : mainProgramador
    Created on : 04-20-2019, 01:21:42 AM
    Author     : josea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/custom.css">
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        
        <title>Main Programador</title>
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
                    <a class="nav-link active" href="mainProgramador.jsp">Principal</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="mainProgramador_casos.jsp">Casos</a>
                </li>
                
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <h2 style="margin-left:15px">Developer Dashboard</h2>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <hr class="col-lg-12">
                
                         
                <!--Casos -->
                <div class="row col-lg-12">
                    <h5 class="">Casos</h5>
                    
                </div>
                <div class="row col-lg-12">
                    <div class="col-lg-3">
                        <div class="col-lg-6 offset-lg-3 shadow-sm border-bottom cuadro_informativo1">
                            <sql:query var="caso_2" dataSource="jdbc/mysql">
                                SELECT count(*) as cantidad FROM casos WHERE estado = 2 and idProgramador = ?
                                <sql:param value="${loginEmpleado}"/>
                            </sql:query>
                            <c:forEach var="caso_desarrollo" items="${caso_2.rows}">
                                <p><c:out value="${caso_desarrollo.cantidad}"></c:out></p>
                            </c:forEach>
                        </div>
                        <p class="offset-lg-3">Asginados en desarrollo</p>
                    </div>
                    <div class="col-lg-3 ">
                        <div class="col-lg-6 offset-lg-3 shadow-sm border-bottom cuadro_informativo2">
                            <sql:query var="caso_3" dataSource="jdbc/mysql">
                                SELECT count(*) as cantidad FROM casos WHERE estado = 6 and idProgramador = ?
                                <sql:param value="${loginEmpleado}"/>
                            </sql:query>
                            <c:forEach var="caso_finalizado" items="${caso_3.rows}">
                                <p><c:out value="${caso_finalizado.cantidad}"></c:out></p>
                            </c:forEach>
                        </div>
                        <p class="offset-lg-3">Finalizados</p>
                    </div>
                    <div class="col-lg-3">
                        <div class="col-lg-6 offset-lg-3 shadow-sm border-bottom cuadro_informativo3">
                            <sql:query var="caso_4" dataSource="jdbc/mysql">
                                SELECT count(*) as cantidad FROM casos WHERE estado = 4 and idProgramador = ?
                                <sql:param value="${loginEmpleado}"/>
                            </sql:query>
                            <c:forEach var="caso_vencido" items="${caso_4.rows}">
                                <p><c:out value="${caso_vencido.cantidad}"></c:out></p>
                            </c:forEach>
                        </div>
                        <p class="offset-lg-3">Vencidos</p>
                    </div>
                    <div class="col-lg-3">
                        <div class="col-lg-6 offset-lg-3 shadow-sm border-bottom cuadro_informativo4">
                            <sql:query var="caso_1" dataSource="jdbc/mysql">
                                SELECT count(*) as cantidad FROM casos WHERE estado = 5 and idProgramador = ?
                                <sql:param value="${loginEmpleado}"/>
                            </sql:query>
                            <c:forEach var="caso_espera" items="${caso_1.rows}">
                                <p><c:out value="${caso_espera.cantidad}"></c:out></p>
                            </c:forEach>
                        </div>
                        <p class="offset-lg-3">Devueltos</p>
                    </div>
                </div>
                <hr>
                <br>
                <div class="row col-lg-12">
                    <div class="col-lg-3">
                        <div class="col-lg-6 offset-lg-3 shadow-sm border-bottom cuadro_informativo1">
                            <sql:query var="caso_2" dataSource="jdbc/mysql">
                                SELECT count(*) as cantidad FROM casos WHERE estado = 3 and idProgramador = ?
                                <sql:param value="${loginEmpleado}"/>
                            </sql:query>
                            <c:forEach var="caso_desarrollo" items="${caso_2.rows}">
                                <p><c:out value="${caso_desarrollo.cantidad}"></c:out></p>
                            </c:forEach>
                        </div>
                        <p class="offset-lg-3">En espera de revisión</p>
                    </div>
                    <div class="col-lg-3 ">
                        
                    </div>
                    <div class="col-lg-3">
                        
                    </div>
                    <div class="col-lg-3">
                        
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>


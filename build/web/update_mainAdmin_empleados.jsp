<%-- 
    Document   : update_mainAdmin_empleados
    Created on : 05-01-2019, 04:57:01 PM
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
                    <a class="nav-link d-flex justify-content-center align-content-between primary" href="mainAdmin_empleados.jsp">
                        <i class="material-icons mr-1">keyboard_backspace</i>Atrás</a>
                </li>
               
            </ul>
        </nav>
        
        <br>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                   <br><br><br>
                   <h2 style="margin-left:15px">Empleados - Actualizar registro</h2>
                   <br>
                   
                </div>
            </div>
        </div>
        <div class="container">
            <div class="container-responsive">
                <div class="row">
                    <div class="col-md-6 offset-md-3 ">
                        <sql:query var="select" dataSource="jdbc/mysql">
                            Select * from empleados where idEmpleado = ${param.id}
                        </sql:query>
                        <c:forEach var="empleado" items="${select.rows}">
                            <form class="" name="empleado" action="ProcesarAdmin.jsp" method="POST">
                                <div class="form-group">
                                    <label class="" for="">ID de empleado</label>
                                    <input class="form-control" name="idEmpleado" id="idEmpleado" type="text" disable
                                           value="${empleado.idEmpleado}">
                                </div>
                                <div class="form-group">
                                    <label class="" for="">Nombre de empleado</label>
                                    <input class="form-control" name="nombreU" id="nombreU" type="text" 
                                           value="${empleado.nombres}">
                                </div>
                                <div class="form-group">
                                    <label class="" for="">Apellido de empleado</label>
                                    <input class="form-control" name="apellido" id="apellido" type="text"
                                           value="${empleado.apellidos}">
                                </div>
                                <div class="form-group">        
                                    <label class="" for="selectCargo">Cargo</label>
                                    <select class="form-control" name="selectCargo" id="selectCargo">
                                        <option>-- selecionar una opción --</option>
                                        <sql:query var="s0" dataSource="jdbc/mysql">
                                            Select * from cargos 
                                        </sql:query>
                                        <c:forEach var="cargos" items="${s0.rows}">
                                            <c:if test="${cargos.idCargo == empleado.cargo}">
                                               <option selected value='<c:out value="${cargos.idCargo}"></c:out>'>
                                                <c:out value="${cargos.idCargo} - ${cargos.nombreCargo}"></c:out>
                                            </option> 
                                            </c:if>
                                            <c:if test="${cargos.idCargos != empleado.cargo}">
                                               <option  value='<c:out value="${cargos.idCargo}"></c:out>'>
                                                <c:out value="${cargos.idCargo} - ${cargos.nombreCargo}"></c:out>
                                            </option> 
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">        
                                    <label class="" for="selectArea">Área</label>
                                    <select class="form-control" name="selectArea" id="selectArea">
                                        <option>-- selecionar una opción --</option>
                                        <sql:query var="s1" dataSource="jdbc/mysql">
                                            Select * from areas 
                                        </sql:query>
                                        <c:forEach var="areas" items="${s1.rows}">
                                            <c:if test="${areas.idArea == empleado.area}">
                                                <option selected value='<c:out value="${areas.idArea}"></c:out>'>
                                                    <c:out value="${areas.idArea} - ${areas.nombreArea}"></c:out>
                                                </option>
                                            </c:if>
                                            <c:if test="${areas.idArea != empleado.area}">
                                                <option  value='<c:out value="${areas.idArea}"></c:out>'>
                                                    <c:out value="${areas.idArea} - ${areas.nombreArea}"></c:out>
                                                </option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="" for="">Documento único de indentidad</label>
                                    <input class="form-control" name="dui" id="dui" type="text"
                                           value="${empleado.documentoUnico}">
                                </div>
                                <div class="form-group">
                                    <label class="" for="email">email</label>
                                    <input class="form-control" name="email" id="email" type="text"
                                            value="${empleado.email}">
                                </div>
                                <div class="form-group">
                                    <label class="" for="telefono">telefono</label>
                                    <input class="form-control" name="telefono" id="telefono" type="text"
                                            value="${empleado.telefono}">
                                </div>
                                <div class="form-group">    
                                    <label class="" for="selectEmpleado">Jefe</label>
                                    <select class="form-control" name="selectJefe" id="selectJefe">
                                        <option>-- selecionar una opción --</option>
                                        <sql:query var="s1" dataSource="jdbc/mysql">
                                            Select * from empleados 
                                        </sql:query>
                                        <c:forEach var="users" items="${s1.rows}">
                                            <c:if test="${users.idEmpleado == empleado.jefe}">
                                                <option selected value='<c:out value="${users.idEmpleado}"></c:out>'>
                                                <c:out value="${users.idEmpleado} - ${users.nombres} ${users.apellidos}"></c:out>
                                            </option>
                                            </c:if>
                                            <c:if test="${users.idEmpleado != empleado.jefe}">
                                                <option value='<c:out value="${users.idEmpleado}"></c:out>'>
                                                <c:out value="${users.idEmpleado} - ${users.nombres} ${users.apellidos}"></c:out>
                                            </option>
                                            </c:if>
                                            
                                        </c:forEach>    
                                    </select>
                                </div>
                                <div class="form-group">    
                                    <label class="" for="">Activo</label>
                                    <select class="form-control" name="selectActivo" id="selectActivo">
                                        <option value="">-- selecionar una opción --</option>
                                        <c:if test="${empleado.activo == 0}">
                                            <option value="1"> Si</option>
                                            <option selected value="0"> No</option>
                                        </c:if>
                                        <c:if test="${empleado.activo == 1}">
                                            <option selected value="1"> Si</option>
                                            <option value="0"> No</option>
                                        </c:if>
                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                    <br>
                                    <button class="btn btn-info " type="submit">
                                       Actualizar datos 
                                    </button>  
                                </div>    
                            </form>
                                
                        </c:forEach>

                </div>
            </div>
        </div>        
    </body>
</html>
<%-- 
    Document   : ProcesarAdmin
    Created on : 04-24-2019, 01:03:58 AM
    Author     : josea
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <!-- Insert de los areas -->     
    <c:if test="${not empty param.nombreArea}">
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into areas (nombreArea) values (?)
        <sql:param value="${param.nombreArea}"/>
        </sql:update>
        <c:redirect url="mainAdmin_areas.jsp">
            <c:param name="IngresoArea" value="Ingreso de area"/>
        </c:redirect>
    </c:if>    
        
    <!-- Insert de los cargos -->    
    <c:if test="${not empty param.nombreCargo}">
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into cargos (nombreCargo) values (?)
        <sql:param value="${param.nombreCargo}"/>
        </sql:update>
        <c:redirect url="mainAdmin_cargos.jsp">
            <c:param name="IngresCargo" value="Ingreso de cargo"/>
        </c:redirect>
    </c:if>
        
    <!-- Insert de los empleados --> 
    <c:if test="${not empty param.nombre}">
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into empleados (nombres, apellidos, cargo, area, documentoUnico, email, telefono, jefe, activo)
        values (?,?,?,?,?,?,?,?,?)
        <sql:param value="${param.nombre}"/>
        <sql:param value="${param.apellido}"/>
        <sql:param value="${param.selectCargo}"/>
        <sql:param value="${param.selectArea}"/>
        <sql:param value="${param.dui}"/>
        <sql:param value="${param.email}"/>
        <sql:param value="${param.telefono}"/>
        <sql:param value="${param.selectJefe}"/>
        <sql:param value="${1}"/>
        </sql:update>
        <c:redirect url="mainAdmin_empleados.jsp">
            <c:param name="IngresoEmpleado" value="Ingreso de empleado"/>
        </c:redirect>
    </c:if>
        
    <!-- Insert de los usuarios --> 
    <c:if test="${not empty param.nombreUsuario}">
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into usuarios (nombreUsuario, passwordUsuario, tipoUsuario, idEmpleado)
        values (?,?,?,?)
        <sql:param value="${param.nombreUsuario}"/>
        <sql:param value="${param.contraUsuario}"/>
        <sql:param value="${param.selectTipo}"/>
        <sql:param value="${param.selectEmpleado}"/>
        </sql:update>
        <c:redirect url="mainAdmin_usuarios.jsp">
            <c:param name="IngresoUsuario" value="Ingreso de usuario"/>
        </c:redirect>
    </c:if>   

        
     <!-- Delete Cargo -->  
     <c:if test="${not empty param.idCargoEliminar}">
         <sql:update var="eliminar" dataSource="jdbc/mysql">
             delete from cargos where idCargo = ?
             <sql:param value="${param.idCargoEliminar}" />
         </sql:update>
        <c:redirect url="mainAdmin_cargos.jsp">
            <c:param name="Eliminado" value="Cargo eliminado"/>
        </c:redirect>
     </c:if>
             
    <!-- Delete Area -->  
     <c:if test="${not empty param.idAreaEliminar}">
         <sql:update var="eliminar" dataSource="jdbc/mysql">
             delete from areas where idArea = ?
             <sql:param value="${param.idAreaEliminar}" />
         </sql:update>
        <c:redirect url="mainAdmin_areas.jsp">
            <c:param name="Eliminado" value="Area eliminada"/>
        </c:redirect>
     </c:if>
             
     <!-- Delete usuario -->  
     <c:if test="${not empty param.idUsuarioEliminar}">
         <sql:update var="eliminar" dataSource="jdbc/mysql">
             delete from usuarios where idUsuario = ?
             <sql:param value="${param.idUsuarioEliminar}" />
         </sql:update>
        <c:redirect url="mainAdmin_usuarios.jsp">
            <c:param name="UsuarioEliminado" value="eliminado"/>
        </c:redirect>
     </c:if>
             
     <!-- Delete Empleado (inhabilitar) -->  
     <c:if test="${not empty param.idEmpleadoEliminar}">
         <sql:update var="update" dataSource="jdbc/mysql">
             update empleados set empleados.activo = 0 where idEmpleado = ? 
             <sql:param value="${param.idEmpleadoEliminar}" />
         </sql:update>
        <c:redirect url="mainAdmin_empleados.jsp">
            <c:param name="Deshabilitado" value="Empleado Deshabilitado"/>
        </c:redirect>
     </c:if>
             
             
    </body>
</html>

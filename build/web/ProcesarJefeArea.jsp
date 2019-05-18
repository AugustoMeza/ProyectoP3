<%-- 
    Document   : ProcesarJefeArea
    Created on : 04-26-2019, 01:38:06 AM
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
        <title>JSP Procesamiento de JefeArea</title>
    </head>
    <body>
    <jsp:useBean id="EnviarEmail" scope="page" class="com.proyectop3.SendEmail"/>    
        
    <!-- Insert de solicitudes -->     
    <c:if test="${not empty param.idSolicitante}">
        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate var="fechaActual" value="${now}" pattern="YYYY-MM-dd" />
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into solicitudes (idEmpleadoSolicitante, detalleSolicitud, archivoPdf, fechaSolicitud, estado, area) values (?,?,?,?,?,?)
        <sql:param value="${param.idSolicitante}"/>
        <sql:param value="${param.detalles}"/>
        <sql:param value=""/>
        <sql:param value="${now}"/>
        <sql:param value="1"/>
        <sql:param value="${param.area}"/>
        </sql:update>
        <c:redirect url="mainJefeArea_solicitudes.jsp">
            <c:param name="IngresoSolicitud" value="Ingreso de solicitud"/>
        </c:redirect>
    </c:if>
        
    <!-- Delete solicitud--> 
     <c:if test="${not empty param.idSolicitudEliminar}">
         <sql:update var="delete" dataSource="jdbc/mysql">
             delete from solicitudes where idSolicitud = ? 
             <sql:param value="${param.idSolicitudEliminar}" />
         </sql:update>
        <c:redirect url="mainJefeArea_solicitudes.jsp">
            <c:param name="Eliminada" value="Solicitud Eliminada"/>
        </c:redirect>
     </c:if>
             
    <!-- Update solicitud--> 
     <c:if test="${not empty param.idEmpleadoEliminar}">
         <sql:update var="update" dataSource="jdbc/mysql">
             update empleados set empleados.activo = 0 where idEmpleado = ? 
             <sql:param value="${param.idEmpleadoEliminar}" />
         </sql:update>
        <c:redirect url="mainAdmin_empleados.jsp">
            <c:param name="Deshabilitado" value="Empleado Deshabilitado"/>
        </c:redirect>
     </c:if>

    <!-- Asignacion de empleado revisor -->     
    <c:if test="${not empty param.idCaso && not empty param.idEmpleadoR}">
        
        <sql:update var="AsignarEmpleado" dataSource="jdbc/mysql">
        update casos set idRevisor = ? where idCaso = ?
        <sql:param value="${param.idEmpleadoR}"/>
        <sql:param value="${param.idCaso}"/>

        </sql:update>
        
         <c:set var="enviarC" 
                value="${EnviarEmail.SendMailCasoAsigando(param.idCaso,EnviarEmail.getEmailFromEmpleado(param.idEmpleadoR))}"/>
        <c:redirect url="mainJefeArea_bitacoras.jsp">
            <c:param name="idCaso" value="${param.idCaso}"/>
        </c:redirect>
    </c:if>
    </body>
</html>

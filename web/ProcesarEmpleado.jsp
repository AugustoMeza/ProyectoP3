<%-- 
    Document   : ProcesarEmpleado
    Created on : 05-17-2019, 03:40:34 PM
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
        <title>Procesar empleado</title>
    </head>
    <body>
        <jsp:useBean id="now" class="java.util.Date" />
        <jsp:useBean id="EnviarEmail" scope="page" class="com.proyectop3.SendEmail"/>    
        <!-- Ingresar Observación -->
        <c:if test="${not empty param.idCaso && not empty param.detalles}">
            
            <c:set var="estado" value=" " />
            
            <c:if test="${param.estadoCaso eq 2}">
                <c:set var="estado" value="${'Devuelto'} " />
                
                <sql:update var="obs" dataSource="jdbc/mysql">
                    insert into observacionesCaso (idCaso, idRevisor, detalles, fecha, tipoObservacion)
                    values (?,?,?,?,?)
                        <sql:param value="${param.idCaso}"/>
                        <sql:param value="${param.idRevisor}"/>
                        <sql:param value="${param.detalles}"/>
                        <sql:param value="${now}"/>
                        <sql:param value="${estado}"/>
                </sql:update>
                
                    <!-- Actualizando el estado a Devuelto-->
                <sql:update var="cambio" dataSource="jdbc/mysql">
                update casos set estado = ? where idCaso = ?
                    <sql:param value="${5}"/>
                    <sql:param value="${param.idCaso}"/>
                </sql:update>
                
                <c:set var="enviarC1" 
                value="${EnviarEmail.SendMailCasoDevuelto(param.idCaso,EnviarEmail.getEmailFromEmpleado(param.idRevisor),param.detalles)}"/>
                
                <c:redirect url="mainEmpleado_observacion.jsp">
                    <c:param name="idCaso" value="${param.idCaso}" />
                </c:redirect>
            </c:if>
                
            <c:if test="${param.estadoCaso eq 3}">
                <c:set var="estado" value="${'Finalizado'}" />
                <sql:update var="obs" dataSource="jdbc/mysql">
                insert into observacionesCaso (idCaso, idRevisor, detalles, fecha, tipoObservacion)
                values (?,?,?,?,?)
                    <sql:param value="${param.idCaso}"/>
                    <sql:param value="${param.idRevisor}"/>
                    <sql:param value="${param.detalles}"/>
                    <sql:param value="${now}"/>
                    <sql:param value="${estado}"/>
                    
                </sql:update>
                
                <!-- Actualizando el estado a Finalizado-->
                <sql:update var="cambio" dataSource="jdbc/mysql">
                update casos set estado = ? where idCaso = ?
                    <sql:param value="${6}"/>
                    <sql:param value="${param.idCaso}"/>
                </sql:update>
                
                <c:set var="enviarC2" 
                value="${EnviarEmail.SendMailCasoFinalizado(param.idCaso,EnviarEmail.getEmailFromEmpleado(param.idRevisor))}"/>
                
                <c:redirect url="mainEmpleado_observacion.jsp">
                    <c:param name="idCaso" value="${param.idCaso}" />
                </c:redirect>
                </c:if>
               
        </c:if>
        
        <!-- Update observacion-->
        
        <!-- Eliminar Observacion -->
    </body>
</html>

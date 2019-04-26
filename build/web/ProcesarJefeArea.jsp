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
        <!-- Insert de solicitudes -->     
    <c:if test="${not empty param.idSolicitante}">
        <sql:update var="insertar" dataSource="jdbc/mysql">
        insert into solicitudes (idEmpleadoSolicitante, detalleSolicitud, archivoPdf) values (?,?,?)
        <sql:param value="${param.idSolicitante}"/>
        <sql:param value="${param.detalles}"/>
        <sql:param value="${param.archivo}"/>
        </sql:update>
        <c:redirect url="mainJefeArea_solicitudes.jsp">
            <c:param name="IngresoSolicitud" value="Ingreso de solicitud"/>
        </c:redirect>
    </c:if>
        
    </body>
</html>

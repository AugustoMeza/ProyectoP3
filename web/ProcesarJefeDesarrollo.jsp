<%-- 
    Document   : ProcesarJefeDesarrollo
    Created on : 05-14-2019, 05:58:51 PM
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
        <title>Procesar Jefe Desarrollo</title>
    </head>
    <body>
        <jsp:useBean id="now" class="java.util.Date" />
        <jsp:useBean id="Caso" scope="page" class="com.proyectop3.Casos"/>
        <jsp:useBean id="EnviarEmail" scope="page" class="com.proyectop3.SendEmail"/>
        
        <fmt:formatDate var="fechaActual" value="${now}" pattern="YYYY-MM-dd" />

        <!-- Responder solicitud en espera-->    
        <c:if test="${not empty param.idSolicitudRespuesta}">
            <sql:update var="cambioEstado" dataSource="jdbc/mysql">
                update solicitudes set estado = ? where idSolicitud = ?
                <c:if test="${param.estado eq 2}">
                    <sql:param value="2" />
                    <c:set var="enviarC" 
                value="${EnviarEmail.SendMailSolicitudRechazada(param.idSolicitudRespuesta,EnviarEmail.getEmailFromEmpleado(param.idEmpleado))}"/> 
                </c:if>
                <c:if test="${param.estado eq 3}">
                    <sql:param value="3" />
                    <c:set var="enviarC" 
                value="${EnviarEmail.SendMailSolicitudAprobada(param.idSolicitudRespuesta,EnviarEmail.getEmailFromEmpleado(param.idEmpleado))}"/> 
                </c:if>
                <sql:param value="${param.idSolicitudRespuesta}" />
            </sql:update>

            <sql:update var="insertarRespuesta" dataSource="jdbc/mysql">
                insert into respuestadesolicitudes (idSolicitud, idJefeDesarrollo, respuesta, fecha) values (?,?,?,?)
                <sql:param value="${param.idSolicitudRespuesta}"/>
                <sql:param value="${param.idEmpleado}"/>
                <sql:param value="${param.respuesta}"/>
                <sql:param value="${now}"/>
            </sql:update>
            
                
                
                
                    
            <c:redirect url="mainJefeDesarrollo.jsp">

            </c:redirect>

        </c:if>
            
            
        <!-- Update solicitud rechazada -->    
        <c:if test="${not empty param.idSolicitudRespuestaUpdate}">
            <sql:update var="cambioEstado" dataSource="jdbc/mysql">
                update solicitudes set estado = ? where idSolicitud = ?
                <sql:param value="${param.estado}" />
                <sql:param value="${param.idSolicitudRespuestaUpdate}" />

            </sql:update>

            <sql:update var="insertarRespuesta" dataSource="jdbc/mysql">
                update respuestadesolicitudes set respuesta=?, fecha=? 
                where idSolicitud = ?

                <sql:param value="${param.respuesta}"/>
                <sql:param value="${now}"/>
                <sql:param value="${param.idSolicitudRespuestaUpdate}"/>
            </sql:update>

            <c:redirect url="mainJefeDesarrollo.jsp">

            </c:redirect>

        </c:if>    
            
            
        <!-- Insertar Caso de solicitud aceptada -->    
        <c:if test="${not empty param.idSolicitudCaso}">
            <sql:query var="areas" dataSource="jdbc/mysql">
                SELECT solicitudes.area, areas.nombreArea from solicitudes 
                inner join areas
                on solicitudes.area = areas.idArea
                where solicitudes.idSolicitud = ?
                <sql:param value="${param.idSolicitudCaso}" />
            </sql:query>
            
            <c:forEach var="area" items="${areas.rows}">
                <c:set value="${area.nombreArea}" var="areaCaso" />
            </c:forEach>
            
            <sql:update var="cambioEstado" dataSource="jdbc/mysql">
                insert into casos (idCaso, idSolicitud, idJefeDesarrollo, 
                idProgramador, idRevisor, fechaCreacion, fechaLimite, detalleCaso,
                estado, archivoPdf) values (?,?,?,?,?,?,?,?,?,?)
                <sql:param value="${Caso.generarCodigo(areaCaso, now)}" />
                <sql:param value="${param.idSolicitudCaso}" />
                <sql:param value="${param.idJefeDesarrollo}" />
                <sql:param value="${param.idProgramador}" />
                <sql:param value="${param.idRevisor}" />
                <sql:param value="${now}" />
                <sql:param value="${param.fechaLimite}" />
                <sql:param value="${param.detalleCaso}" />
                <sql:param value="${2}" />
                <sql:param value="" />

            </sql:update>

            <c:redirect url="mainJefeDesarrollo.jsp">
                
            </c:redirect>
        </c:if>
                
        <!-- Insertar elementos de caso -->    
        <c:if test="${not empty param.n1}">
                                    
            <sql:update var="InsertElementos" dataSource="jdbc/mysql">
                insert into elementoscaso (descripcionElemento, idCaso) 
                values (?,?)
                
                <sql:param value="${param.n1}" />
                <sql:param value="${param.idCaso}" />

            </sql:update>

            <c:redirect url="mainJefeDesarrollo_crearElementosCaso.jsp" >
                <c:param value="ElementoAgregado" name="ElementoAgregado"/>
                <c:param value="${param.idCaso}" name="idCaso"/>
            </c:redirect>
        </c:if> 
    </body>
</html>

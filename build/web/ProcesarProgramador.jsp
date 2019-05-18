<%-- 
    Document   : ProcesarProgramador
    Created on : 05-16-2019, 12:53:23 AM
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
        <title>Procesar Programador</title>
    </head>
    <body>
        <jsp:useBean id="now" class="java.util.Date" />
        <jsp:useBean id="EnviarEmail" scope="page" class="com.proyectop3.SendEmail"/>
        
        <!-- Agregar bitacora -->
        <c:if test="${not empty param.idElementoNuevo}">
            <sql:update var="insertBitacora" dataSource="jdbc/mysql">
                insert into bitacoraselementos 
                (idElemento, idProgramador, fechaCreacion)
                values (?,?,?)
                <sql:param  value="${param.idElementoNuevo}"/>
                <sql:param  value="${param.idProgramador}"/>
                <sql:param  value="${now}"/>
            </sql:update>
            
            <c:redirect url="mainProgramador_bitacoras.jsp">
                <c:param name="idCaso" value="${param.idCaso}" /> 
            </c:redirect>
                
        </c:if>
        
        
        <!-- Eliminar bitacora -->
        <c:if test="${not empty param.idElementoIngresado}">
            <sql:update var="deleteBitacora" dataSource="jdbc/mysql">
                delete from bitacoraselementos where idElemento = ? and idProgramador = ?
                
                <sql:param  value="${param.idElementoIngresado}"/>
                <sql:param  value="${param.idProgramador}"/>
            </sql:update>
            
            <c:redirect url="mainProgramador_bitacoras.jsp">
                <c:param name="idCaso" value="${param.idCaso}" /> 
            </c:redirect>
        </c:if>
                
        <!-- Cambiar estado en desarrollo -> esperando revisor -->
        <c:if test="${param.cambiarEstado eq 2}">
            <sql:update var="updEstado" dataSource="jdbc/mysql">
                update casos set casos.estado = ? where idCaso = ?
                <sql:param  value="${3}"/>
                <sql:param  value="${param.idCaso}"/>
  
            </sql:update>
                
                
            <sql:query var="revisor" dataSource="jdbc/mysql">
                select idRevisor from casos where idCaso = ?
                <sql:param value="${param.idCaso}"/>
            </sql:query>
                <c:forEach var="rev" items="${revisor.rows}">
                    <c:set var="enviarC" 
                value="${EnviarEmail.SendMailCasoRevision(param.idCaso,EnviarEmail.getEmailFromEmpleado(rev.idRevisor))}"/>
                </c:forEach>    
                 
            
            <c:redirect url="mainProgramador.jsp">
                <c:param name="idCaso" value="${param.idCaso}" /> 
            </c:redirect>
        </c:if>
        
    </body>
</html>

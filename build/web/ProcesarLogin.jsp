<%-- 
    Document   : ProcesarLogin
    Created on : 04-19-2019, 08:04:14 PM
    Author     : josea
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:useBean id="beanUser" scope="page" class="com.proyectop3.Usuarios"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de procesamiento de datos</title>
    </head>
    <body>
        <c:if test="${ empty param.user or empty param.pass}">
            <c:redirect url="index.jsp" >
                    <c:param name="errMsg" value="Error de login" />
            </c:redirect>
        </c:if>
        
        <c:if test="${not empty param.user and not empty param.pass}">

            <sql:query var="selectQ" dataSource="jdbc/mysql">
                select usuarios.idUsuario, usuarios.tipoUsuario, usuarios.idEmpleado, empleados.nombres as nombres,
                empleados.apellidos as apellidos from usuarios inner join empleados on empleados.idEmpleado = usuarios.idEmpleado
                where nombreUsuario ='${param.user}'
                and passwordUsuario ='${param.pass}'
            </sql:query>
            
            <c:if test="${selectQ.rowCount gt 0}">
                <c:forEach items="${selectQ.rows}" var="r">
                    <c:choose>
                      
                      <c:when test="${r.tipoUsuario eq 1}">
                        <c:set scope="session" var="loginUser" value="${r.idUsuario}"/>
                        <c:set scope="session" var="loginUserName" value="${param.user}"/>
                        <c:set scope="session" var="loginEmpleadoNombre" value="${r.nombres} ${r.apellidos}"/>
                        <c:set scope="session" var="loginTipo" value="${r.tipoUsuario}"/>
                        <c:set scope="session" var="loginEmpleado" value="${r.idEmpleado}"/>
                        <c:redirect url="mainAdmin.jsp"/>
                      </c:when>
                      
                      
                      <c:when test="${r.tipoUsuario eq 2}">
                        <c:set scope="session" var="loginUser" value="${r.idUsuario}"/>
                        <c:set scope="session" var="loginUserName" value="${param.user}"/>
                        <c:set scope="session" var="loginEmpleadoNombre" value="${r.nombres} ${r.apellidos}"/>
                        <c:set scope="session" var="loginTipo" value="${r.tipoUsuario}"/>
                        <c:set scope="session" var="loginEmpleado" value="${r.idEmpleado}"/>
                        <c:redirect url="mainJefeDesarrollo.jsp"/>
                      </c:when>
                      
                      
                      <c:when test="${r.tipoUsuario eq 3}">
                        <c:set scope="session" var="loginUser" value="${r.idUsuario}"/>
                        <c:set scope="session" var="loginUserName" value="${param.user}"/>
                        <c:set scope="session" var="loginEmpleadoNombre" value="${r.nombres} ${r.apellidos}"/>
                        <c:set scope="session" var="loginTipo" value="${r.tipoUsuario}"/>
                        <c:set scope="session" var="loginEmpleado" value="${r.idEmpleado}"/>
                        <c:redirect url="mainJefeArea.jsp"/>
                      </c:when>
                      
                      
                      <c:when test="${r.tipoUsuario eq 4}">
                        <c:set scope="session" var="loginUser" value="${r.idUsuario}"/>
                        <c:set scope="session" var="loginUserName" value="${param.user}"/>
                        <c:set scope="session" var="loginEmpleadoNombre" value="${r.nombres} ${r.apellidos}"/>
                        <c:set scope="session" var="loginTipo" value="${r.tipoUsuario}"/>
                        <c:set scope="session" var="loginEmpleado" value="${r.idEmpleado}"/>
                        <c:redirect url="mainProgramador.jsp"/>
                      </c:when>
                      
                      
                      <c:when test="${r.tipoUsuario eq 5}">
                        <c:set scope="session" var="loginUser" value="${r.idUsuario}"/>
                        <c:set scope="session" var="loginUserName" value="${param.user}"/>
                        <c:set scope="session" var="loginEmpleadoNombre" value="${r.nombres} ${r.apellidos}"/>
                        <c:set scope="session" var="loginTipo" value="${r.tipoUsuario}"/>
                        <c:set scope="session" var="loginEmpleado" value="${r.idEmpleado}"/>
                        <c:redirect url="mainEmpleado.jsp"/>
                      </c:when>
                      
                      <c:otherwise>
                        <c:redirect url="index.jsp">
                          <c:param name="errMsg" value="Usuario o contraseña incorrectos" />
                        </c:redirect>
                      </c:otherwise>
                    </c:choose>

                  </c:forEach>
            </c:if>
                
            <c:if test="${selectQ.rowCount lt 1}">
                <c:redirect url="index.jsp">
                    <c:param name="errMsg" value="Usuario o contraseña incorrectos" />
                </c:redirect>
            </c:if>
        </c:if>
    </body>
</html>

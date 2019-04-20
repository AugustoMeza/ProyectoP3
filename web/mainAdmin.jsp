
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Main Admin!</h1>
        <%@include file="header.jsp" %>
        El tipo de usuario es: <c:out value="${loginUser}"></c:out>
        El nombre de usuario es: <c:out value="${loginUserName}"></c:out>
        El tipoUsuario de usuario es: <c:out value="${loginTipo}"></c:out>
        El idEmpleado de usuario es: <c:out value="${loginEmpleado}"></c:out>
    </body>
</html>
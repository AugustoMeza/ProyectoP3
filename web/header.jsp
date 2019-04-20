<%-- 
    Document   : header
    Created on : 04-20-2019, 12:19:15 AM
    Author     : josea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${empty sessionScope['loginUser']}">
            <c:redirect url="index.jsp" />
        </c:if>
 
    <a href="logout.jsp">Logout 
        <c:out value="${sessionScope['loginUser']}" />
    </a>
    </body>
</html>

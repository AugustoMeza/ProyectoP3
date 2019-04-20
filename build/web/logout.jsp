<%-- 
    Document   : logout
    Created on : 04-20-2019, 12:20:44 AM
    Author     : josea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged out</title>
    </head>
    <body>
        <%
            session.removeAttribute("loginUser");
            
        %>
        
        <c:if test="${empty sessionScope['loginUser']}">
            <c:redirect url="index.jsp" />
        </c:if>
            
    </body>
</html>
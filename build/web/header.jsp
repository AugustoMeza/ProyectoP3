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
        <title>Header</title>
        <link rel="stylesheet" href="css/custom.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    </head>
    <body>
        <c:if test="${empty sessionScope['loginUser']}">
            <c:redirect url="index.jsp" />
        </c:if>
 
        <li>
            <a class="nav-link align-items-center" href="usuarioProfile.jsp">
                <button class="btn btn-sm btn-outline-light  d-flex justify-content-center align-content-between">
                    <i class="material-icons mr-1">account_box</i> Usuario: 
                    <c:out value="${sessionScope['loginEmpleadoNombre']}"/>
                    
                </button>
            </a>
        </li>
        <li>
            
           <a class="nav-link align-items-center d-flex justify-content-center align-content-between" href="logout.jsp">
               <button class="btn btn-sm btn-outline-light  d-flex justify-content-center align-content-between"> 
                    <i class="material-icons mr-1">power_settings_new</i>
                    Cerrar Sesión
                </button>
           </a>
        </li>
        
    </body>
</html>

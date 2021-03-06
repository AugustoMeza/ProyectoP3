<%-- 
    Document   : index.jsp
    Created on : 04-19-2019, 03:48:21 PM
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
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Index</title>
    </head>
    <body>
        <c:if test="${not empty loginUser and not empty loginTipo}">
            <c:redirect url="errorPage.jsp" >
                    <c:param name="errMsg" value="Error de login" />
            </c:redirect>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#"><h5>SGP</h5></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse align-items-end" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item float-right ">
                  <a class="nav-link" href="index.jsp">Ayuda <span class="sr-only">(current)</span></a>
                </li>
              </ul>
            </div>
        </nav>
        
        <div class="container container-responsive container-main">
                       
            <div class="row justify-content-center align-items-center">    
                <div class="col-md-3">
                    <form action="ProcesarLogin.jsp" method="">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input required class="form-control" type="text" name="user">
                        </div> 
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input required class="form-control" type="password" name="pass">
                        </div> 
                        <div class="form-group">
                            <button class="btn btn-info float-right  rounded-bottom">Iniciar sesión</button>
                        </div> 
                    </form>
                </div>
            </div> 
            <!-- Mensaje de error-->
            <c:if test="${not empty param.errMsg}">
                <br>
                <div class="row justify-content-center align-items-center">
                    <div class="alert alert-danger alert-dismissible fade show col-md-3" role="alert">
                    <strong>Error!</strong> Usuario o contraseña incorrectos.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                </div> 
                </div>

            </c:if>
        </div>
    </body>
</html>
<script>
    window.onload = function() {
        if(!window.location.hash) {
            window.location = window.location + '#loaded';
            window.location.reload();
        }
    }
</script>

<%-- 
    Document   : list
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <style>
            .fakeimg {
                height: 200px;
                background: #aaa;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <title>Web Hotelli</title>
    </head>
    <body>
       <div class="jumbotron text-center" style="margin-bottom:0">
            <h1>Web Hotelli</h1>
            <p>Tu Hotel Ideal</p> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.htm">Inicio</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/reservacion/list.htm">Reservaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/habitacion/list.htm">Habitaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/categoria/list.htm">Categorías</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/usuario/list.htm">Usuarios</a>
                    </li> 
                </ul>
            </div>  
        </nav>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Planta</th>
                    <th>Numeraci&oacute;n</th>
                    <th>Categor&iacute;a</th>
                    <th>Estado</th>
                    <th>
                        <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/habitacion/create.htm">
                            <i class="fa fa-plus" style="font-size:20px;color:white"></i></a>
                        
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.habitaciones}" var="habitacion">
                    <tr>
                        <td>
                            ${habitacion.getPlanta()}
                        </td>
                        <td>
                            ${habitacion.getNumeracion()}
                        </td>
                        <td>
                            ${habitacion.getCategoriaId().getNombre()}
                        </td>
                        <td>
                            ${habitacion.getStrEstado()}
                        </td>
                        <td>
                             <a class="btn btn-success" href="${pageContext.request.contextPath}/habitacion/retrieve/${habitacion.getHabitacionId()}.htm">
                                <i class="fa fa-eye" style="font-size:15px;color:white"></i></a>
                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/habitacion/update/${habitacion.getHabitacionId()}.htm">
                                <i class="fa fa-edit" style="font-size:15px;color:white"></i></a>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/habitacion/delete/${habitacion.getHabitacionId()}.htm">
                                <i class="fa fa-trash" style="font-size:15px;" ></i></a>       
                           
                          
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/index.htm">
            <i class="fa fa-angle-double-left" style="font-size:15px;" ></i> Atr&aacute;s</a>
       
    </body>
</html>

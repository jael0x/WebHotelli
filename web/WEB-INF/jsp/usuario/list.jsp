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
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            <a class="nav-link" href="${pageContext.request.contextPath}/habitacion/list.htm">Habitaciones</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/usuario/list.htm">Categorías</a>
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
                    <th>Nombre</th>
                    <th>C&eacute;dula</th>
                    <th>Tel&eacute;fono</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/usuario/create.htm">Crear</a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.usuarios}" var="usuario">
                    <tr>
                        <td>
                            ${usuario.getNombre()}
                        </td>
                        <td>
                            ${usuario.getCedula()}
                        </td>
                        <td>
                            ${usuario.getTelefono()}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/usuario/retrieve/${usuario.getUsuarioId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/usuario/update/${usuario.getUsuarioId()}.htm">Editar</a> |
                            <a href="${pageContext.request.contextPath}/usuario/delete/${usuario.getUsuarioId()}.htm">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/index.htm" style="text-decoration: none; color: black">Atr&aacute;s</a>
        </button>
    </body>
</html>

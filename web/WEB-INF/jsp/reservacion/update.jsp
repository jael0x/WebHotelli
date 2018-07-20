<%-- 
    Document   : update
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/habitacion/list.htm">Habitaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/categoria/list.htm">Categorías</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/usuario/list.htm">Usuarios</a>
                    </li> 
                </ul>
            </div>  
        </nav>
        <h1>Editar Categor&iacute;a</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/categoria/update.htm" method="POST" commandName="categoria">
            <fieldset>
                <label>Nombre: </label>
                <frm:input path="nombre" 
                           value="${categoria.getNombre()}"
                           placeholder="Nombre de la Categoría"/>
                <br>
                <label>Precio Inicial: </label>
                <frm:input type="number" 
                           path="precioInicial" 
                           value="${categoria.getPrecioInicial()}"
                           step="0.01"
                           min="1"/>
                <br>
                <label>Precio por Usuario: </label>
                <frm:input type="number" 
                           path="precioUsuario" 
                           value="${categoria.getPrecioUsuario()}" 
                           step="0.01"
                           min="1"/>
                <br>
                <label>Usuarios M&aacute;ximos: </label>
                <frm:input type="number" 
                           path="maxUsuarios" 
                           value="${categoria.getMaxUsuarios()}"
                           min="1"/>
                <frm:hidden path="categoriaId"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/categoria/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Actualizar</button>
            </div>
        </frm:form>
    </body>
</html>

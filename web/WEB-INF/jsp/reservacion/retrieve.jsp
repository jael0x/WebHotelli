<%-- 
    Document   : retrieve
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Categor&iacute;a</title>
    </head>
    <body>
        <h1>Datos de la Categor&iacute;a ${categoria.getNombre()}</h1>
        <hr>
        <fieldset>
            <label>Precio Inicial: </label>
            <span>${categoria.getPrecioInicial()}</span>
            <br>
            <label>Precio por Usuario: </label>
            <span>${categoria.getPrecioUsuario()}</span>
            <br>
            <label>Usuarios M&aacute;ximos: </label>
            <span>${categoria.getMaxUsuarios()}</span>
        </fieldset>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/categoria/list.htm" style="text-decoration: none; color: black"/>Atr&aacute;s</a>
    </button>
</body>
</html>

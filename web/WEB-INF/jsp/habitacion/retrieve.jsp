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
        <title>Ver Habitaci&oacute;n</title>
    </head>
    <body>
        <h1>Datos de la Habitaci&oacute;n ${habitacion.getNumeracion()}</h1>
        <hr>
        <fieldset>
            <label>Planta: </label>
            <span>${habitacion.getPlanta()}</span>
            <br>
            <label>Categor&iacute;a: </label>
            <span>${habitacion.getCategoriaId().getNombre()}</span>
            <br>
            <label>Estado: </label>
            <span>${habitacion.getStrEstado()}</span>
        </fieldset>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/habitacion/list.htm" style="text-decoration: none; color: black"/>Atr&aacute;s</a>
    </button>
</body>
</html>

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
        <title>Ver Usuario</title>
    </head>
    <body>
        <h1>Datos del Usuario ${usuario.getNombre()}</h1>
        <hr>
        <fieldset>
            <label>Nombre: </label>
            <span>${usuario.getNombre()}</span>
            <br>
            <label>C&eacute;dula: </label>
            <span>${usuario.getCedula()}</span>
            <br>
            <label>Tel&eacute;fono: </label>
            <span>${usuario.getTelefono()}</span>
        </fieldset>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/usuario/list.htm" style="text-decoration: none; color: black"/>Atr&aacute;s</a>
    </button>
</body>
</html>

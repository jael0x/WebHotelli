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
        <title>Actualizar Habitaci&oacute;n</title>
    </head>
    <body>
        <h1>Actualizar Estado de la Habitaci&oacute;n ${habitacion.getNumeracion()}</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/habitacion/update.htm" method="POST" commandName="habitacion">
            <fieldset>
                <label>Planta: </label>
                <span>${habitacion.getPlanta()}</span>
                <br>
                <label>Categor&iacute;a: </label>
                <span>${habitacion.getCategoriaId().getNombre()}</span>
                <br>
                <label>Estado: </label>
                <frm:select path="estado" items="${listEstado}"/>
                <frm:hidden path="habitacionId"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/habitacion/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Actualizar</button>
            </div>
        </frm:form>
    </body>
</html>

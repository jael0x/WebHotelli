<%-- 
    Document   : delete
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Habitaci&oacute;n</title>
    </head>
    <body>
        <h1>Desea eliminar la Habitaci&oacute;n ${habitacion.getNumeracion()}</h1>
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
        <frm:form action="${pageContext.request.contextPath}/habitacion/delete.htm" method="POST" commandName="habitacion">
            <frm:hidden path="habitacionId"/>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/habitacion/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Eliminar</button>
            </div>
        </frm:form>
    </body>
</html>

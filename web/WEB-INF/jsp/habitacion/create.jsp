<%-- 
    Document   : create
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Habitaci&oacute;n</title>
    </head>
    <body>
        <h1>Registrar Habitaci&oacute;n</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/habitacion/create.htm" method="POST" commandName="habitacion">
            <fieldset>
                <label>Planta: </label>
                <frm:input type="number" path="planta" min="1" max="99"/>
                <br>
                <label>Numeraci&oacute;n: </label>
                <frm:input type="number" path="intNumeracion" min="1" max="99"/>
                <br>
                <label>Categor&iacute;a: </label>
                <frm:select path="intCategoria">
                    <frm:option value="0" label="--Seleccione--"/>
                    <frm:options items="${listCategoria}"
                                 itemLabel="nombre"
                                 itemValue="categoriaId"/>
                </frm:select>
                <br>
                <label>Estado: </label>
                <frm:select path="estado" items="${listEstado}"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/habitacion/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Guardar</button>
            </div>
        </frm:form>
    </body>
</html>

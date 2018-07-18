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
        <title>Editar Usuario</title>
    </head>
    <body>
        <h1>Editar Usuario</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/usuario/update.htm" method="POST" commandName="usuario">
            <fieldset>
                <label>Nombre: </label>
                <frm:input path="nombre" 
                           value="${usuario.getNombre()}"
                           placeholder="Nombre del Usuario"/>
                <br>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" 
                           value="${usuario.getCedula()}"
                           placeholder="Cédula del Usuario"/>
                <br>
                <label>Tel&eacute;dula: </label>
                <frm:input path="telefono" 
                           value="${usuario.getTelefono()}"
                           placeholder="Teléfono del Usuario"/>
                <br>
                <frm:hidden path="usuarioId"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/usuario/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Actualizar</button>
            </div>
        </frm:form>
    </body>
</html>

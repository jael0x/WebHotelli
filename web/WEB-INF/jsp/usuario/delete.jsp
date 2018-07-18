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
        <title>Eliminar Usuario</title>
    </head>
    <body>
        <h1>Desea eliminar al Usuario ${usuario.getNombre()}</h1>
        <hr>
        <fieldset>
            <label>C&eacute;dula </label>
            <span>${usuario.getCedula()}</span>
            <br>
            <label>Tel&eacute;fono: </label>
            <span>${usuario.getTelefono()}</span>
        </fieldset>
        <frm:form action="${pageContext.request.contextPath}/usuario/delete.htm" method="POST" commandName="usuario">
            <frm:hidden path="usuarioId"/>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/usuario/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Eliminar</button>
            </div>
        </frm:form>
    </body>
</html>

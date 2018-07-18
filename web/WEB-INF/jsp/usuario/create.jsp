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
        <title>Registrar Usuario</title>
    </head>
    <body>
        <h1>Registrar Usuario</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/usuario/create.htm" method="POST" commandName="usuario">
            <fieldset>
                <label>Nombre: </label>
                <frm:input path="nombre" 
                           placeholder="Nombre del Usuario"/>
                <br>
                <label>C&eacute;dula: </label>
                <frm:input path="cedula" 
                           placeholder="Cédula del Usuario"/>
                <br>
                <label>Tel&eacute;fono: </label>
                <frm:input path="telefono" 
                           placeholder="Teléfono del Usuario"/>
            </fieldset>
                <div>
                    <button type="reset">
                        <a href="${pageContext.request.contextPath}/usuario/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                    </button>
                    <button type="submit">Guardar</button>
                </div>
        </frm:form>
    </body>
</html>

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
        <title>Eliminar Categor&i&iacute;a</title>
    </head>
    <body>
        <h1>Desea eliminar la Categor&iacute;a ${categoria.getNombre()}</h1>
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
        <frm:form action="${pageContext.request.contextPath}/categoria/delete.htm" method="POST" commandName="categoria">
            <frm:hidden path="categoriaId"/>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/categoria/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Eliminar</button>
            </div>
        </frm:form>
    </body>
</html>

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
        <title>Editar Categor&iacute;a</title>
    </head>
    <body>
        <h1>Editar Categor&iacute;a</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/categoria/update.htm" method="POST" commandName="categoria">
            <fieldset>
                <label>Nombre: </label>
                <frm:input path="nombre" 
                           value="${categoria.getNombre()}"
                           placeholder="Nombre de la Categoría"/>
                <br>
                <label>Precio Inicial: </label>
                <frm:input type="number" 
                           path="precioInicial" 
                           value="${categoria.getPrecioInicial()}"
                           step="0.01"
                           min="1"/>
                <br>
                <label>Precio por Usuario: </label>
                <frm:input type="number" 
                           path="precioUsuario" 
                           value="${categoria.getPrecioUsuario()}" 
                           step="0.01"
                           min="1"/>
                <br>
                <label>Usuarios M&aacute;ximos: </label>
                <frm:input type="number" 
                           path="maxUsuarios" 
                           value="${categoria.getMaxUsuarios()}"
                           min="1"/>
                <frm:hidden path="categoriaId"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/categoria/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Actualizar</button>
            </div>
        </frm:form>
    </body>
</html>

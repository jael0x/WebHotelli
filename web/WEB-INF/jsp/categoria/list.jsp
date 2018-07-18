<%-- 
    Document   : list
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categor&iacute;as</title>
    </head>
    <body>
        <h1>Listado de Categor&iacute;as</h1>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Precio Inicial</th>
                    <th>Precio por Usuario</th>
                    <th>Usuarios M&aacute;ximos</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/categoria/create.htm">Crear</a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.categorias}" var="categoria">
                    <tr>
                        <td>
                            ${categoria.getNombre()}
                        </td>
                        <td>
                            ${categoria.getPrecioInicial()}
                        </td>
                        <td>
                            ${categoria.getPrecioUsuario()}
                        </td>
                        <td>
                            ${categoria.getMaxUsuarios()}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/categoria/retrieve/${categoria.getCategoriaId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/categoria/update/${categoria.getCategoriaId()}.htm">Editar</a> |
                            <a href="${pageContext.request.contextPath}/categoria/delete/${categoria.getCategoriaId()}.htm">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="reset">
            <a href="${pageContext.request.contextPath}/index.htm" style="text-decoration: none; color: black">Atr&aacute;s</a>
        </button>
    </body>
</html>

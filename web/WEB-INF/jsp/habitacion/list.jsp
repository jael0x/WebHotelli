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
        <title>Habitaciones</title>
    </head>
    <body>
        <h1>Listado de Habitaciones</h1>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Planta</th>
                    <th>Numeraci&oacute;n</th>
                    <th>Categor&iacute;a</th>
                    <th>Estado</th>
                    <th>
                        <a href="${pageContext.request.contextPath}/habitacion/create.htm">Crear</a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.habitaciones}" var="habitacion">
                    <tr>
                        <td>
                            ${habitacion.getPlanta()}
                        </td>
                        <td>
                            ${habitacion.getNumeracion()}
                        </td>
                        <td>
                            ${habitacion.getCategoriaId().getNombre()}
                        </td>
                        <td>
                            ${habitacion.getStrEstado()}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/habitacion/retrieve/${habitacion.getHabitacionId()}.htm">Ver</a> |
                            <a href="${pageContext.request.contextPath}/habitacion/update/${habitacion.getHabitacionId()}.htm">Actualizar</a> |
                            <a href="${pageContext.request.contextPath}/habitacion/delete/${habitacion.getHabitacionId()}.htm">Eliminar</a>
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

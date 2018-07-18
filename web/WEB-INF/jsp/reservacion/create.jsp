<%-- 
    Document   : create
    Created on : 07/2018
    Author     : JAEL ARMAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Reservaci&oacute;n</title>
    </head>
    <body>
        <h1>Registrar Reservaci&oacute;n</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/reservacion/create.htm" method="POST" commandName="reservacion">
            <fieldset>
                <label>Usuario: </label>
                <frm:select path="idusuario">
                    <frm:option value="0" label="--Seleccione--"/>
                    <frm:options items="${listUsuario}"
                                 itemLabel="nombre"
                                 itemValue="usuarioId"/>
                </frm:select>
                <br>
                <!--                <label>Categor&iacute;a: </label>
                <frm:select path="idcategoria">
                    <frm:option value="0" label="--Seleccione--"/>
                    <frm:options items="${listCategoria}"
                                 itemLabel="nombre"
                                 itemValue="categoriaId"/>
                </frm:select>
                <br>-->
                <c:forEach items="${listPlantas}" var="planta">
                    <h3>Planta ${planta.num}</h3>
                    <c:forEach items="${listHabitaciones}" var="habitacion">
                        <c:if test = "${habitacion.getPlanta() == planta.num}">
                            
                        </c:if>
                    </c:forEach>
                </c:forEach>
                <label>Precio Inicial: </label>
                <frm:input type="number" 
                           path="precioInicial" 
                           step="0.01"
                           min="1"/>
                <br>
                <label>Precio por Usuario: </label>
                <frm:input type="number" 
                           path="precioUsuario" 
                           step="0.01"
                           min="1"/>
                <br>
                <label>Usuarios M&aacute;ximos: </label>
                <frm:input type="number" 
                           path="maxUsuarios" 
                           min="1"/>
            </fieldset>
            <div>
                <button type="reset">
                    <a href="${pageContext.request.contextPath}/reservacion/list.htm" style="text-decoration: none; color: black"/>Cancelar</a>
                </button>
                <button type="submit">Guardar</button>
            </div>
        </frm:form>
    </body>
</html>

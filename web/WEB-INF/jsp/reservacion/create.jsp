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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <style>
            .fakeimg {
                height: 200px;
                background: #aaa;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Web Hotelli</title>
    </head>
    <body>
        <div class="jumbotron text-center" style="margin-bottom:0">
            <h1>Web Hotelli</h1>
            <p>Tu Hotel Ideal</p> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.htm">Inicio</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/reservacion/list.htm">Reservaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/habitacion/list.htm">Habitaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/categoria/list.htm">Categorías</a>
                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/usuario/list.htm">Usuarios</a>
                    </li> 
                </ul>
            </div>  
        </nav>
                    <h1>Registrar Reservaci&oacute;n</h1>
        <hr>
        <frm:form action="${pageContext.request.contextPath}/reservacion/create.htm" method="POST" commandName="reservacion">
            <fieldset class="container">
                <div class="row">
                    <div class="col">
                        <label>Usuario: </label>
                        <frm:select path="idusuario">
                            <frm:option value="0" label="--Seleccione--"/>
                            <frm:options items="${listUsuario}"
                                         itemLabel="nombre"
                                         itemValue="usuarioId"/>
                        </frm:select>
                        <br>
                        <label>Fecha de Entrada: </label>
                        <frm:input type="date" path="strFechaEntrada"/>
                        <br>
                        <label>Fecha de Salida: </label>
                        <frm:input type="date" path="strFechaSalida"/>
                        <br>
                        <label>Número de Usuarios: </label>
                        <frm:input type="number" 
                                   path="numUsuarios" 
                                   min="1"
                                   max=""/>
                        <br>
                        <label>Pagada: </label>
                        <frm:checkbox path="pagada"/>
                    </div>
                    <div class="col btn-group-toggle" data-toggle="buttons">
                        <c:forEach items="${listPlantas}" var="planta">
                            <h5>Planta ${planta.intValue()}</h5>
                            <c:forEach items="${listHabitaciones}" var="habitacion">
                                <c:if test = "${habitacion.getPlanta() == planta.intValue()}">
                                    <c:choose>
                                        <c:when test="${habitacion.getEstado() == 1}">
                                            <span class="btn btn-info">
                                                <label>${habitacion.getNumeracion()}</label>
                                                <frm:radiobutton path="idhabitacion" value="${habitacion.getHabitacionId()}" />
                                                <p>${habitacion.getCategoriaId().getNombre()}</p>
                                            </span>
                                        </c:when>    
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${habitacion.getEstado() == 2}">
                                                    <span class="btn btn-secondary">
                                                        <label>${habitacion.getNumeracion()}</label>
                                                        <input type="radio" disabled checked>
                                                        <p>${habitacion.getCategoriaId().getNombre()}</p>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="btn btn-danger">
                                                        <label disabled>${habitacion.getNumeracion()}</label>
                                                        <input type="radio" disabled>
                                                        <p>${habitacion.getCategoriaId().getNombre()}</p>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </div>
                </div>
            </fieldset>
                    
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/reservacion/list.htm">
                    <i class="fa fa-times" style="font-size:25px;" ></i></a>
                    
                    <button type="submit" class="btn btn-primary" href="${pageContext.request.contextPath}/reservacion/list.htm">
                    <i  class="fa fa-floppy-o " style="font-size:25px;" ></i></button>
                    
            
        </div>
    </frm:form>
</body>
</html>

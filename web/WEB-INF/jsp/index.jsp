<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Hotelli</title>
    </head>

    <body>
        <h1>Web Hotelli</h1>
        <div>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/reservacion/list.htm" style="text-decoration: none; color: black">Listado de Reservaciones</a>
            </button>
            <br><br>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/habitacion/list.htm" style="text-decoration: none; color: black">Listado de Habitaciones</a>
            </button>
            <br><br>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/categoria/list.htm" style="text-decoration: none; color: black">Listado de Categor&iacute;as</a>
            </button>
            <br><br>
            <button type="reset">
                <a href="${pageContext.request.contextPath}/usuario/list.htm" style="text-decoration: none; color: black">Listado de Usuarios</a>
            </button>
        </div>
    </body>
</html>

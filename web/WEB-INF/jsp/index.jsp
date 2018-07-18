<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

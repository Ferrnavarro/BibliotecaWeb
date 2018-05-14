<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="usuarios" class="sv.edu.udb.beans.Usuario"/>
<%
    HttpSession sesionUsuario = request.getSession();
     if (sesionUsuario.getAttribute("tipo").equals(3)) {
     }else{
           response.sendRedirect("index.jsp");

 }
%>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>N°</th>
            <th>Carnet</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Telefono</th>
            <th>Tipo de usuario</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${usuarios.listaUsuarios}" varStatus="status" var="user">
            <tr>
                <td>${status.count}</td>
                <td>${user.carnet}</td>
                <td>${user.nombre}</td>
                <td>${user.apellido}</td>
                <td>${user.correo}</td>
                <td>${user.telefono}</td>
                
                <c:choose>
                    <c:when test="${user.tipo == 1}">
                        <td><span class="label label-warning">Alumno</span></td>
                    </c:when>
                    <c:when test="${user.tipo == 2}">
                        <td><span class="label label-success">Maestro</span></td>
                    </c:when>
                    <c:when test="${user.tipo == 3}">
                        <td><span class="label label-primary">Bibliotecario</span></td>
                    </c:when>
                    <c:otherwise>
                        <td><span class="label label-danger">Desconocido</span></td>
                    </c:otherwise>
                </c:choose>
                
                <td><a class="btn btn-default btn-circle" href="verUsuario.jsp?id=${user.carnet}"><i class="fa fa-edit"></i></a>
                    <a class="btn btn-default btn-circle" href="usuarios.jsp?eliminar=${user.carnet}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    <!--<tr>
        <td colspan="8"></td>
        <div class="alert alert-danger">No hay usuarios registrados. <a href="nuevoUsuario.jsp" class="alert-link">Ingresar nuevo</a></div>
    </tr>-->
    </tbody>
</table>
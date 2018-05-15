<%-- 
    Document   : listaLibros
    Created on : 05-14-2018, 09:54:35 PM
    Author     : Anthony
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ejemplar" class="sv.edu.udb.beans.Ejemplar"/>
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
            <th>ID Ejempalr</th>
            <th>ID Documento</th>
            <th>Titulo</th>
            <th>Estado</th>
            <th>Ubicacion</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${ejemplar.listaEjemplar}" varStatus="status" var="doc">
            <tr>
                <td>${doc.idejemplar}</td>
                <td>${doc.iddocumento}</td>
                <td>${doc.titulo}</td>
                    <c:choose>
                    <c:when test="${doc.idestado == 1}">
                        <td><span class="label label-warning">Prestado</span></td>
                    </c:when>
                    <c:when test="${doc.idestado == 2}">
                        <td><span class="label label-success">Reservado</span></td>
                    </c:when>
                    <c:when test="${doc.idestado == 3}">
                        <td><span class="label label-primary">Disponible</span></td>
                    </c:when>
                    </c:choose>
                    <td>${doc.ubicacion}</td>

                <td><a class="btn btn-default btn-circle" href="verEjemplar.jsp?id=${doc.idejemplar}"><i class="fa fa-edit"></i></a>
                        <a class="btn btn-default btn-circle" href="ejemplar.jsp?eliminar=${doc.idejemplar}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
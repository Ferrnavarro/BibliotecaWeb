<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="revistas" class="sv.edu.udb.beans.Revistas"/>
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
            <th>ID Documento</th>
            <th>ID Revista</th>
            <th>ISNN</th>
            <th>Ejemplares</th>
            <th>Cotenido</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${revistas.listaRevistas}" varStatus="status" var="doc">
            <tr>
                <td>${doc.idDocumento}</td>
                <td>${doc.idRevista}</td>
                <td>${doc.ISNN}</td>
                <td>${doc.ejemplares}</td>
                <td>${doc.contenido}</td>     
                
                <td><a class="btn btn-default btn-circle" href="verRevista.jsp?id=${doc.idRevista}"><i class="fa fa-edit"></i></a>
                    <a class="btn btn-default btn-circle" href="revistas.jsp?eliminar=${doc.idRevista}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
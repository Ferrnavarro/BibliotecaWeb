<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="documentos" class="sv.edu.udb.beans.Documentos"/>
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
            <th>ID</th>
            <th>Edición</th>
            <th>ID Editorial</th>
            <th>Descripción</th>
            <th>Notas</th>
            <th>Titulo</th>
            <th>Idioma</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${documentos.listaDocumentos}" varStatus="status" var="doc">
            <tr>
                <td>${doc.idDocumento}</td>
                <td>${doc.edicion}</td>
                <td>${doc.idImprenEdi}</td>
                <td>${doc.descripcion}</td>
                <td>${doc.notas}</td>
                <td>${doc.titulo}</td>       
                <c:choose>
                    <c:when test="${doc.idIdioma == 0}">
                        <td><span class="label label-warning">Español</span></td>
                    </c:when>
                    <c:when test="${doc.idIdioma == 1}">
                        <td><span class="label label-success">Ingles</span></td>
                    </c:when>
                    <c:when test="${doc.idIdioma == 2}">
                        <td><span class="label label-primary">Frances</span></td>
                    </c:when>
                </c:choose>
                
                <td><a class="btn btn-default btn-circle" href="verDocumento.jsp?id=${doc.idDocumento}"><i class="fa fa-edit"></i></a>
                    <a class="btn btn-default btn-circle" href="documentos.jsp?eliminar=${doc.idDocumento}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
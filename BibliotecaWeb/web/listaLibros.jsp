<%-- 
    Document   : listaLibros
    Created on : 05-14-2018, 09:54:35 PM
    Author     : Anthony
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="libro" class="sv.edu.udb.beans.Libros"/>
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
            <th>ID Libro</th>
            <th>ISBN</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${libro.listaLibros}" varStatus="status" var="doc">
            <tr>
                <td>${doc.iddocumento}</td>
                <td>${doc.idlibro}</td>
                <td>${doc.isbn}</td>
                
                
                <td><a class="btn btn-default btn-circle" href="verLibro.jsp?id=${doc.idlibro}"><i class="fa fa-edit"></i></a>
                    <a class="btn btn-default btn-circle" href="libros.jsp?eliminar=${doc.idlibro}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
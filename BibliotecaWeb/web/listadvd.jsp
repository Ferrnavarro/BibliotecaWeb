<%-- 
    Document   : listaDvd
    Created on : 05-14-2018, 09:54:35 PM
    Author     : Anthony
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dvd" class="sv.edu.udb.beans.dvd"/>
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
            <th>ID DVD</th>
            <th>ISAN</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${dvd.listadvds}" varStatus="status" var="doc">
            <tr>
                <td>${doc.iddocumento}</td>
                <td>${doc.iddvd}</td>
                <td>${doc.isan}</td>
                
                
                <td><a class="btn btn-default btn-circle" href="verdvd.jsp?id=${doc.iddvd}"><i class="fa fa-edit"></i></a>
                    <a class="btn btn-default btn-circle" href="dvd.jsp?eliminar=${doc.iddvd}"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
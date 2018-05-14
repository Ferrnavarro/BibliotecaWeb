<%-- 
    Document   : salir.jsp
    Created on : 05-07-2018, 04:47:08 PM
    Author     :
--%>

<%@ page session="true" %>
<%
    HttpSession sesionUsuario = request.getSession();
    sesionUsuario.invalidate();
        response.sendRedirect("login.jsp");

    
%>

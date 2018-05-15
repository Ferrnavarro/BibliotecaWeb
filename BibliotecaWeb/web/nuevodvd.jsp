<%-- 
    Document   : nuevodvd
    Created on : 05-14-2018, 09:57:12 PM
    Author     : Anthony
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dvd" class="sv.edu.udb.beans.dvd"/>
<jsp:useBean id="documentos" class="sv.edu.udb.beans.Documentos"/>
<%
    HttpSession sesionUsuario = request.getSession();
     if (sesionUsuario.getAttribute("tipo").equals(3)) {
     }else{
           response.sendRedirect("index.jsp");
 }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Biblioteca</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

    <body>
        <div id="wrapper">
            <jsp:include page="navbar.jsp"/>
            
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                        <h3 class="page-header">Nuevo Dvd</h3>
                        
                            <c:if test="${!empty param.btnEnviar}">
                                <jsp:setProperty name="dvd" property="*"/>
                                
                                <c:if test="${!dvd.lleno}">
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        Todos los campos son obligatorios.
                                    </div>
                                </c:if>
                                <c:if test="${dvd.lleno}">
                                    <c:set var = "existe" value = "${dvd.existe}"/>
                                    <c:choose>
                                        <c:when test="${!existe}">
                                            <c:set var = "ingreso" value = "${dvd.ingreso}"/>
                                            <c:choose>
                                                <c:when test="${ingreso}">
                                                    <div class="alert alert-success alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    Datos ingresados exitosamente. <a href="dvd.jsp" class="alert-link">Volver a la lista</a></div>
                                                </c:when>
                                                <c:when test="${!ingreso}">
                                                    <div class="alert alert-danger alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    Ha ocurrido un error al ingresar.</div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${existe}">
                                            <div class="alert alert-danger alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            El dvd ingresada ya está registrado.</div>
                                        </c:when>
                                    </c:choose>
                                </c:if>
                            </c:if>
                        
                        <form class="form-horizontal" role="form" action="nuevodvd.jsp" method="POST">
                            <div class="col-md-12">
                                <div class="col-md-12">

						<div class="form-group">
                                            <label class="col-md-2 control-label">ID Documento: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="iddocumento" id="iddocumento">
                                                    <c:forEach items="${documentos.listaDocumentos}" varStatus="status" var="doc">
                                                    <option value="${doc.iddocumento}">${doc.idDocumento}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
 
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">ISAN </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="isan" id="isan" placeholder="Ingresar isan" required/>
                                            </div>
                                        </div>
       
                                            
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Nuevo Dvd">                       
                                        </div>
                                    </div>
                                </div>
                        </form>    
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        
            
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    </body>
</html>

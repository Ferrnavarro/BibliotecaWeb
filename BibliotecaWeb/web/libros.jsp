<%-- 
    Document   : libros
    Created on : 05-14-2018, 09:43:19 PM
    Author     : Anthony
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="libro" class="sv.edu.udb.beans.Libros"/>

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

    <title>Mantenimiento Libros</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <div id="wrapper">
        <jsp:include page="navbar.jsp"/>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">Mantenimiento Libros</h2>

                        <h3 class="sub-header">Listado de Libros 
                            <a  class="btn btn-info btn-xs" href="nuevoLibro.jsp">Nuevo Libros <i class="fa fa-plus-circle"></i></a>
                        </h3>
                        
                        <c:if test="${!empty param.eliminar}">
                            <jsp:setProperty name="libro" property="idlibro" param="eliminar"/>
                            <c:set var = "existe" value = "${libro.existe}"/>
                            <c:if test="${!existe}">
                                <c:set var = "msg" value = "El Documento a eliminar no existe"/>
                                <c:set var = "tipo" value = "danger"/>
                            </c:if>
                            <c:if test="${existe}">
                                <c:set var = "eliDoc" value = "${libro.eliminar}"/>
                                <c:choose>
                                    <c:when test="${eliUser}">
                                        <c:set var = "msg" value = "Datos eliminados exitosamente"/>
                                        <c:set var = "tipo" value = "success"/>
                                    </c:when>
                                    <c:when test="${!eliDoc}">
                                        <c:set var = "msg" value = "Ha ocurrido in error al eliminar."/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:when>
                                </c:choose>
                            </c:if>
                            <div class="alert alert-${tipo} alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
                        </c:if>
                        
                        <div class="table-responsive">
                            <jsp:include page="listaLibros.jsp"/>

                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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



<%-- 
    Document   : index
    Created on : 04-22-2018, 11:48:40 AM
    Author     : 
--%>
<%
 HttpSession sesionUsuario = request.getSession();
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="devolucion" class="sv.edu.udb.beans.Prestamo"/> 
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
    <link href="css/custom.css" rel="stylesheet">
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
                            <h2 class="page-header">Devoluciones</h2>
                            
                            <c:if test="${!empty param.dev}">
                                <jsp:setProperty name="devolucion" property="idPrestamo" param="dev"/>
                                <c:set var="existe" value="${devolucion.existe}"/>
                                <c:choose>
                                    <c:when test="${existe}">
                                        <c:set var="devuelto" value="${devolucion.devolver}"/>
                                        <c:choose>
                                            <c:when test="${devuelto}">
                                                <c:set var = "msg" value = "Ejemplar devuelto exitosamente"/>
                                                <c:set var = "tipo" value = "success"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var = "msg" value = "Hubo un error al devolver"/>
                                                <c:set var = "tipo" value = "danger"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${!existe}">
                                        <c:set var = "msg" value = "No se encontró el registro del prestamo"/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:when>
                                </c:choose>
                                <div class="alert alert-${tipo} alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    ${msg}
                                </div>
                            </c:if>
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Usuario</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="alert alert-danger hidden" id="msgUsuario" role="alert">lblError</div>
                                    <div class="col-md-8">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Carnet: </label>
                                                <div class="col-md-5 input-group">
                                                    <input type="text" class="form-control" name="carnet" id="txtCarnet" 
                                                           value="" placeholder="Carnet"/>
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-default" name="btnUsuario" id="btnUsuario" value="dev">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Nombre: </label>
                                                <div class="col-md-8 no-width-padding">
                                                    <input type="text" class="form-control" name="nombre" id="txtNombre" 
                                                           value="" placeholder="Nombre" readonly/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="list-group no-height-margin">
                                            <li class="list-group-item list-group-item-success" id="containerMora">
                                                <strong>Mora</strong>
                                                <span class="badge" id="lblMora">$0.00</span>
                                            </li>
                                            <li class="list-group-item">
                                                <strong>Prestamos activos</strong>
                                                <span class="badge" id="lblPrestamos">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div id="tblPrestamos">
                                
                            </div>
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
    <!--Funciones AJAX con Java Servlets-->
    <script src="js/biblioInfo.js"></script>
    </body>
</html>

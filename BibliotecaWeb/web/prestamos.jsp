<%-- 
    Document   : index
    Created on : 04-22-2018, 11:48:40 AM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="prestamo" class="sv.edu.udb.beans.Prestamo"/> 
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
                            <h2 class="page-header">Prestamos</h2>
                            
                            <c:if test="${!empty param.btnEnviar}">
                                <c:choose>
                                    <c:when test="${param.txtCarnetP.length() > 0}">
                                        <c:choose>
                                            <c:when test="${param.txtIdEjP.length() > 0}">
                                                <jsp:setProperty name="prestamo" property="idUsuario" param="txtCarnetP"/>
                                                <jsp:setProperty name="prestamo" property="idEjemplar" param="txtIdEjP"/>
                                                <c:set var = "valido" value = "${prestamo.prestamoValido}"/>
                                                <c:choose>
                                                    <c:when test="${valido == 1}">
                                                        <c:set var = "msg" value = "No se encontro el carnet del usuario ingresado"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:when>
                                                    <c:when test="${valido == 2}">
                                                        <c:set var = "msg" value = "El usuario posee mora"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:when>
                                                    <c:when test="${valido == 3}">
                                                        <c:set var = "msg" value = "El usuario ha realizado la máxima cantidad de prestamos posibles"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:when>
                                                    <c:when test="${valido == 4}">
                                                        <c:set var = "msg" value = "No se encontro el id del ejemplar ingresado"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:when>
                                                    <c:when test="${valido == 5}">
                                                        <c:set var = "msg" value = "El ejemplar ingresado no esta disponible"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var = "realizado" value = "${prestamo.ingresarPrestamo}"/>
                                                        <c:choose>
                                                            <c:when test="${realizado}">
                                                                <c:set var = "msg" value = "Prestamo ingresado exitosamente"/>
                                                                <c:set var = "tipo" value = "success"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var = "msg" value = "Error al ingresar prestamo"/>
                                                                <c:set var = "tipo" value = "danger"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var = "msg" value = "Seleccione un ejemplar"/>
                                                <c:set var = "tipo" value = "danger"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var = "msg" value = "Seleccione un usuario"/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:otherwise>
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
                                                        <button type="button" class="btn btn-default" name="btnUsuario" id="btnUsuario">
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
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Ejemplar</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="alert alert-danger hidden" id="msgEjemplar" role="alert">lblError</div>
                                    <div class="col-md-8">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="idEjemplar">Id: </label>
                                                <div class="col-md-5 input-group">
                                                    <input type="text" class="form-control" name="idEjemplar" id="txtIdEjemplar" 
                                                           value="" placeholder="Id"/>
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-default" name="btnEjemplar" id="btnEjemplar">
                                                            <i class="fa fa-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="titulo">Título: </label>
                                                <div class="col-md-8 no-width-padding">
                                                    <input type="text" class="form-control" name="titulo" id="txtTitulo" 
                                                           value="" placeholder="Título" readonly/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="list-group no-height-margin">
                                            <li class="list-group-item list-group-item-success" id="contDisp"><strong id="lblDisp">Disponible</strong> <span class="fa fa-check-circle-o" id="iconEjemplar"></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Enviar Prestamo</h4>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline" action="prestamos.jsp" method="POST">
                                        <div class="form-group">
                                            <label class="control-label" for="txtCarnet">Carnet: </label>
                                            <input type="text" class="form-control" name="txtCarnetP" id="txtCarnetP" value="" placeholder="Carnet" readonly/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="txtIdEj">Id Ejemplar: </label>
                                            <input type="text" class="form-control" name="txtIdEjP" id="txtIdEjP" value="" placeholder="Id Ejemplar" readonly/>
                                        </div>
                                        <input type="submit" class="btn btn-primary btn-sm" name="btnEnviar" value="Enviar"/>
                                    </form>
                                </div>
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

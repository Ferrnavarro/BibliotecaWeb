<%-- 
    Document   : index
    Created on : 04-22-2018, 11:48:40 AM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="alumno" class="sv.edu.udb.beans.TipoUsuario"/> 
<jsp:useBean id="maestro" class="sv.edu.udb.beans.TipoUsuario"/> 

<jsp:setProperty name="alumno" property="id" value="1"/>
<jsp:setProperty name="maestro" property="id" value="2"/>
${alumno.iniciar()} ${maestro.iniciar()}
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
                            <h2 class="page-header">Mantenimiento Tipo Usuarios</h2>
                            
                            <c:if test="${!empty param.btnEnviarAlumno}">
                                <c:choose>
                                    <c:when test="${param.maxlibros.length() > 0 && param.maxdias.length() > 0}">
                                        <jsp:setProperty name="alumno" property="strMaxDias" param="maxdias"/>
                                        <jsp:setProperty name="alumno" property="strMaxLibros" param="maxlibros"/>
                                        <c:choose>
                                            <c:when test="${alumno.numValido()}">
                                                <c:set var = "modif" value = "${alumno.setMax()}"/>
                                                <c:choose>
                                                    <c:when test="${modif}">
                                                        <c:set var = "msg" value = "Datos actualizados exitosamente"/>
                                                        <c:set var = "tipo" value = "success"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var = "msg" value = "Error al modificar"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var = "msg" value = "Ingrese solamente valores numéricos mayores a cero"/>
                                                <c:set var = "tipo" value = "danger"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var = "msg" value = "Todos los campos son obligatorios"/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="alert alert-${tipo} alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    ${msg}
                                </div>
                            </c:if>
                            
                            <c:if test="${!empty param.btnEnviarMaestro}">
                                <c:choose>
                                    <c:when test="${param.maxlibros.length() > 0 && param.maxdias.length() > 0}">
                                        <jsp:setProperty name="maestro" property="strMaxDias" param="maxdias"/>
                                        <jsp:setProperty name="maestro" property="strMaxLibros" param="maxlibros"/>
                                        <c:choose>
                                            <c:when test="${maestro.numValido()}">
                                                <c:set var = "modif" value = "${maestro.setMax()}"/>
                                                <c:choose>
                                                    <c:when test="${modif}">
                                                        <c:set var = "msg" value = "Datos actualizados exitosamente"/>
                                                        <c:set var = "tipo" value = "success"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var = "msg" value = "Error al modificar"/>
                                                        <c:set var = "tipo" value = "danger"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var = "msg" value = "Ingrese solamente valores numéricos mayores a cero"/>
                                                <c:set var = "tipo" value = "danger"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var = "msg" value = "Todos los campos son obligatorios"/>
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
                                    <h4 class="panel-title">Alumno</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-9">
                                        <form class="form-horizontal" action="tipo.jsp" method="POST">
                                            <div class="form-group">
                                                <label class="control-label col-md-4" for="maxlibros">Max. libros a prestar:</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="maxlibros" id="txtMaxLibros" 
                                                           value="" placeholder="Max. libros" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4" for="maxdias">Max. días por prestamo:</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="maxdias" id="txtMaxDias" 
                                                           value="" placeholder="Max. días" required/>
                                                </div>
                                            </div>
                                            <input type="submit" name="btnEnviarAlumno" value="Enviar" class="btn btn-primary pull-right"/>
                                        </form>
                                    </div>
                                    <div class="col-md-3">
                                        <ul class="list-group">
                                            <li class="list-group-item list-group-item-info"><strong>Valores actuales</strong></li>
                                            <li class="list-group-item">Max. libros: ${alumno.maxLibros}</li>
                                            <li class="list-group-item">Max. días: ${alumno.maxDias}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                                        
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Maestro</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-9">
                                        <form class="form-horizontal" action="tipo.jsp" method="POST">
                                            <div class="form-group">
                                                <label class="control-label col-md-4" for="maxlibros">Max. libros a prestar:</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="maxlibros" id="txtMaxLibros" 
                                                           value="" placeholder="Max. libros" required/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4" for="maxdias">Max. días por prestamo:</label>
                                                <div class="col-md-8">
                                                    <input type="text" class="form-control" name="maxdias" id="txtMaxDias" 
                                                           value="" placeholder="Max. días" required/>
                                                </div>
                                            </div>
                                            <input type="submit" name="btnEnviarMaestro" value="Enviar" class="btn btn-primary pull-right"/>
                                        </form>
                                    </div>
                                    <div class="col-md-3">
                                        <ul class="list-group">
                                            <li class="list-group-item list-group-item-info"><strong>Valores actuales</strong></li>
                                            <li class="list-group-item">Max. libros: ${maestro.maxLibros}</li>
                                            <li class="list-group-item">Max. días: ${maestro.maxDias}</li>
                                        </ul>
                                    </div>
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

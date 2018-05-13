<%-- 
    Document   : nuevoUsuario
    Created on : 04-22-2018, 07:34:02 PM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="tipos" class="sv.edu.udb.beans.TipoUsuario"/> 
<jsp:useBean id="usuario" class="sv.edu.udb.beans.Usuario"/> 

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
                        <h3 class="page-header">Nuevo Usuario</h3>
                        
                            <c:if test="${!empty param.btnEnviar}">
                                <jsp:setProperty name="usuario" property="*"/>
                                
                                <c:if test="${!usuario.lleno}">
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        Todos los campos son obligatorios.
                                    </div>
                                </c:if>
                                <c:if test="${usuario.lleno}">
                                    <c:set var = "existe" value = "${usuario.existe}"/>
                                    <c:choose>
                                        <c:when test="${!existe}">
                                            <c:set var = "ingreso" value = "${usuario.ingreso}"/>
                                            <c:choose>
                                                <c:when test="${ingreso}">
                                                    <div class="alert alert-success alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    Datos ingresados exitosamente. <a href="usuarios.jsp" class="alert-link">Volver a la lista</a></div>
                                                </c:when>
                                                <c:when test="${!ingreso}">
                                                    <div class="alert alert-danger alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    Ha ocurrido in error al ingresar.</div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${existe}">
                                            <div class="alert alert-danger alert-dismissable">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            El carnet ingresado ya está registrado.</div>
                                        </c:when>
                                    </c:choose>
                                </c:if>
                            </c:if>
                        
                        <form class="form-horizontal" role="form" action="nuevoUsuario.jsp" method="POST">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Carnet: </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="carnet" id="txtCarnet" 
                                               value="" placeholder="Carnet" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Nombre: </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="nombre" id="txtNombre" 
                                               value="" placeholder="Nombre" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Apellido: </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="apellido" id="txtApellido"
                                               value="" placeholder="Apellido" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Correo: </label>
                                    <div class="col-md-10">
                                        <input type="email" class="form-control" name="correo" id="txtCorreo" 
                                               value="" placeholder="Correo" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Teléfono: </label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="telefono" id="txtTelefono" 
                                               value="" placeholder="22222222" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Contraseña: </label>
                                    <div class="col-md-10">
                                        <input type="password" class="form-control" name="pass" id="txtPass" 
                                               value="" placeholder="**********" required/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Tipo de Usuario: </label>
                                    <div class="col-md-10">
                                        <select class="form-control" name="tipo">
                                        <c:forEach items="${tipos.tipos}" varStatus="status" var="tipo">
                                            <option value="${tipo.id}">${tipo.tipo}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Enviar">                       
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
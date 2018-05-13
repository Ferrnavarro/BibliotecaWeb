<%-- 
    Document   : login
    Created on : 05-06-2018, 06:00:55 PM
    Author     : 
--%>

<%@page import="sv.edu.udb.beans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>

<c:if test="${not empty param.carnet && not empty param.pass}">
    <jsp:useBean id="inicio" class="sv.edu.udb.beans.Usuario" scope="request"/>
    <jsp:setProperty name="inicio" property="carnet" param="carnet"/>
    <jsp:setProperty name="inicio" property="pass" param="pass"/>
    <c:set var="exito" value="${inicio.sesion}" />
    
    <c:choose>
        <c:when test="${exito == false}">
            <if test="${inicio != null}">
                <c:remove var="inicio" />
            </if>       
            <%
                response.sendRedirect("login.jsp?error=true");
            %>
        </c:when>
        <c:when test="${exito == true}">
            <%
                HttpSession sesionUsuario = request.getSession();
                sesionUsuario.setAttribute("carnet", inicio.getCarnet()); 
                sesionUsuario.setAttribute("mora", inicio.getMora());
                response.sendRedirect("index.jsp");
            %>
        </c:when>
    </c:choose>
</c:if>


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
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Biblioteca</a>
                </div>
                <!-- /.navbar-header -->
                <div class="navbar-collapse">
                    <ul class="nav navbar-top-links navbar-right">
                        <li><a href="#">Regresar <i class="fa fa-arrow-right fa-fw"></i></a></li>
                    </ul>
                </div>
                
                
                <!-- /.navbar-top-links -->
            </nav>
            
            <!-- Page Content -->
            <div id="page-wrapper" style="margin-left: 0px; padding-top: 50px">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <c:if test="${param.error}">
                                <div class="alert alert-danger alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <strong>Error</strong> Datos incorrectos.
                                </div>
                            </c:if>
                            <h3>Inicio de Sesión</h3>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form action="login.jsp" method="POST">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Carnet: </label>
                                            <input type="text" class="form-control" id="carnet" name="carnet" required="true">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Cotraseña: </label>
                                            <input type="password" class="form-control" id="pass" name="pass" required="true">
                                        </div>
                                        <button type="submit" class="btn btn-primary center-block">Ingresar</button>
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


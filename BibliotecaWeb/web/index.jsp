<%-- 
    Document   : index
    Created on : 04-22-2018, 11:48:40 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    HttpSession sesionUsuario = request.getSession();
    if (sesionUsuario.getAttribute("carnet").equals("")) {
            response.sendRedirect("login.jsp");
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
                            <h2 class="page-header">Información del usuario</h2>
                            <div class="col-md-12">
                                <h4>Datos personales</h4>
                                <dl class="dl-horizontal">
                                    <dt>Carnet:</dt><dd><%= sesionUsuario.getAttribute("carnet") %></dd>
                                    <dt>Nombre:</dt><dd><%= sesionUsuario.getAttribute("nombre") %></dd>
                                    <dt>Correo:</dt><dd><%= sesionUsuario.getAttribute("correo") %></dd>
                                    <dt>Teléfono:</dt><dd><%= sesionUsuario.getAttribute("telefono") %></dd>
                                </dl>
                                
                                <h4>Prestamos actuales</h4>
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
    </body>
</html>

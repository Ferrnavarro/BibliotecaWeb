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
<%@ include file="conexion.jsp"%>
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
                            <h2 class="page-header">Consultar catalogo</h2>
                            
                            
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Consultar</h4>
                                </div>
                                <div class="panel-body">
                                    
                                    <div class="col-md-12">
                                        <form class="form-horizontal" method="post" action="listaEjemplares.jsp">
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Titulo </label>
                                                <div class="col-md-8 input-group">
                                                    <input type="text" class="form-control" name="titulo" id="txtTitulo" 
                                                           value="" placeholder="Titulo"/>
                                                    <div class="input-group-btn">
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Autor </label>
                                                <div class="col-md-8 input-group">
                                                    <input type="text" class="form-control" name="txtAutor" id="txtAutor" 
                                                           value="" placeholder="Autor" />
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Material </label>
                                                <div class="col-md-8 input-group">
                                                    <select class ="form-control" name ="material" id ="tMaterial">
                                                        <option value ="1">Libro</option>
                                                        <option value ="2">Tesis</option>
                                                        <option value ="3">DVD</option>
                                                        <option value ="4">Revista</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2" for="carnet">Idioma </label>
                                                <div class="col-md-8 input-group">
                                                    <select class ="form-control" name ="idioma" id ="idioma">
                                                                  <%
                                                    st = con.prepareStatement("select * from idioma");
                                                    rs = st.executeQuery();
                                                    while (rs.next()) {
                                                %>
                                               
                                                <option value="<%=rs.getInt("idIdioma")%>"><%=rs.getString("Idioma")%></option>
                                                    
                                                 <%
                                                }
                                                    con.close();
                                                %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class ="col-md-3"></div>
                                                <div class="col-md-6 input-group">
                                                    <input type="submit" class="btn btn-primary btn-block" name="enviar" id="enviar" 
                                                           value="Buscar " placeholder="Autor" />
                                                </div>
                                            </div>        
                                        </form>
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

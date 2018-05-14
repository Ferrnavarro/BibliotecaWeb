<%-- 
    Document   : verUsuario
    Created on : 04-22-2018, 04:17:04 PM
    Author     : 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usuario" class="sv.edu.udb.beans.Usuario"/> 
<jsp:useBean id="tipos" class="sv.edu.udb.beans.TipoUsuario"/> 
<%
    HttpSession sesionUsuario = request.getSession();
    if (sesionUsuario.getAttribute("tipo").equals(3)) {
     }else{
           response.sendRedirect("index.jsp");
 }
%>
<!DOCTYPE html>

<jsp:setProperty name="usuario" property="carnet" param="id"/>
<c:set var = "existe" value = "${usuario.existe}"/>

<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mantenimiento Usuarios</title>

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

                        <h3 class="page-header">Datos de Usuario</h3>
                        
                        <c:if test="${!empty param.btnEnviar}">
                            <jsp:setProperty name="usuario" property="*"/>

                            <c:if test="${!usuario.lleno}">
                                <c:set var = "msg" value = "Todos los campos son obligatorios"/>
                                <c:set var = "tipo" value = "danger"/>
                            </c:if>
                            <c:if test="${usuario.lleno}">
                                <c:set var = "existe" value = "${usuario.existe}"/>
                                <jsp:setProperty name="usuario" property="*"/>
                                <c:choose>
                                    <c:when test="${existe}">
                                        <c:set var = "modif" value = "${usuario.modif}"/>
                                        <c:choose>
                                            <c:when test="${modif}">
                                                <c:set var = "msg" value = "Datos modificados exitosamente"/>
                                                <c:set var = "tipo" value = "success"/>
                                            </c:when>
                                            <c:when test="${!modif}">
                                                <c:set var = "msg" value = "Ha ocurrido un error al modificar"/>
                                                <c:set var = "tipo" value = "danger"/>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:when test="${!existe}">
                                        <c:set var = "msg" value = "No se encontró el usuario a modificar"/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:when>
                                </c:choose>
                            </c:if>
                            <div class="alert alert-${tipo} alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
                        </c:if>
                        
                        <c:if test="${!empty param.btnResPass}">
                            <jsp:setProperty name="usuario" property="pass" param="txtPass"/>
                            <c:choose>
                                <c:when test="${param.txtPass.length() > 0}">
                                    <c:set var = "modifP" value = "${usuario.modPass}"/>
                                    <c:choose>
                                        <c:when test="${modifP}">
                                            <c:set var = "msg" value = "Contraseña reestablecida"/>
                                            <c:set var = "tipo" value = "success"/>
                                        </c:when>
                                        <c:when test="${!modifP}">
                                            <c:set var = "msg" value = "Error al reestablecer contraseña"/>
                                            <c:set var = "tipo" value = "danger"/>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                                <c:when test="${param.txtPass.length() <= 0}">
                                    <c:set var = "msg" value = "Ingrese una contraseña válida"/>
                                    <c:set var = "tipo" value = "danger"/>
                                </c:when>
                            </c:choose>
                            <div class="alert alert-${tipo} alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>       
                        </c:if>
                    
                        <c:choose>
                            <c:when test="${existe}">
                                <form class="form-horizontal" role="form" action="verUsuario.jsp?id=${usuario.carnet}" method="POST">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Carnet: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="carnet" id="txtCarnet" 
                                                       value="${usuario.carnet}" placeholder="Carnet" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Nombre: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="nombre" id="txtNombre" 
                                                       value="${usuario.nombre}" placeholder="Nombre" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Apellido: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="apellido" id="txtApellido"
                                                       value="${usuario.apellido}" placeholder="Apellido" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Correo: </label>
                                            <div class="col-md-10">
                                                <input type="email" class="form-control" name="correo" id="txtCorreo" 
                                                       value="${usuario.correo}" placeholder="Correo" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Teléfono: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="telefono" id="txtTelefono" 
                                                       value="${usuario.telefono}" placeholder="22222222" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Tipo de Usuario: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="tipo">
                                                <c:forEach items="${tipos.tipos}" varStatus="status" var="tipo">
                                                    <option value="${tipo.id}" ${tipo.id == usuario.tipo ? 'selected' : ''}>${tipo.tipo}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Enviar">                       
                                        </div>
                                    </div>
                                </form>
                                
                                <h4>Reestablecer contraseña</h4>
                                <form class="form-inline" action="verUsuario.jsp?id=${usuario.carnet}" method="POST">
                                    <div class="form-group">
                                        <label>Nueva Contraseña:</label>
                                        <input type="password" class="form-control" name="txtPass" placeholder="●●●●●●●●●●●" required/>
                                    </div>
                                    <input type="submit" class="btn btn-primary" name="btnResPass" value="Enviar"/>
                                </form>
                            </c:when>
                            <c:when  test="${!existe}">
                                <div class="alert alert-danger">No se encontró el usuario. <a href="usuarios.jsp" class="alert-link">Regresar</a></div>
                            </c:when>
                        </c:choose>
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

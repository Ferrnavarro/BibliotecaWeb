<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="documentos" class="sv.edu.udb.beans.Documentos"/> 
<jsp:useBean id="editorial" class="sv.edu.udb.beans.Editorial"/>
<jsp:useBean id="idioma" class="sv.edu.udb.beans.Idioma"/> 


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
                        <h3 class="page-header">Nuevo Documento</h3>
                        
                            <c:if test="${!empty param.btnEnviar}">
                                <jsp:setProperty name="documentos" property="*"/>
                                
                                <c:if test="${!documentos.lleno}">
                                    <div class="alert alert-danger alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        Todos los campos son obligatorios.
                                    </div>
                                </c:if>
                                <c:if test="${documentos.lleno}">
                                    <c:set var = "existe" value = "${documentos.existe}"/>
                                    <c:choose>
                                        <c:when test="${!existe}">
                                            <c:set var = "ingreso" value = "${documentos.ingreso}"/>
                                            <c:choose>
                                                <c:when test="${ingreso}">
                                                    <div class="alert alert-success alert-dismissable">
                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                    Datos ingresados exitosamente. <a href="documentos.jsp" class="alert-link">Volver a la lista</a></div>
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
                                            El Documento ingresado ya está registrado.</div>
                                        </c:when>
                                    </c:choose>
                                </c:if>
                            </c:if>
                        
                        <form class="form-horizontal" role="form" action="nuevoDocumento.jsp" method="POST">
                            <div class="col-md-12">
                                <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Edición: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="edicion" id="edicion" placeholder="Edicion" required/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Imprenta Editorial: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="idImprenEdi" id="idImprenEdi">
                                                <c:forEach items="${editorial.editorial}" varStatus="status" var="edit">
                                                    <option value="${edit.idImprenEdi}">${edit.lugar}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Descripción: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="descripcion" id="descripcion" placeholder="Descripcion" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Notas: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="notas" id="notas" placeholder="Notas" required/>
                                            </div>
                                        </div>
                                            
                                            <div class="form-group">
                                            <label class="col-md-2 control-label">Titulo: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="titulo" id="titulo" placeholder="Titulo" required/>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Idioma: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="idIdioma" id="idIdioma">
                                                <c:forEach items="${idioma.idiomas}" varStatus="status" var="idiom">
                                                    <option value="${idiom.idIdioma}">${idiom.idioma}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Nuevo Documento">                       
                                        </div>
                                    </div>
                                </div>
                        </form>    
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="documentos" class="sv.edu.udb.beans.Documentos"/> 
<jsp:useBean id="editorial" class="sv.edu.udb.beans.Editorial"/>
<jsp:useBean id="idioma" class="sv.edu.udb.beans.Idioma"/> 
<%
    HttpSession sesionUsuario = request.getSession();
    if (sesionUsuario.getAttribute("tipo").equals(3)) {
     }else{
           response.sendRedirect("index.jsp");

 }
%>
<!DOCTYPE html>

<jsp:setProperty name="documentos" property="idDocumento" param="id"/>
<c:set var = "existe" value = "${documentos.existe}"/>

<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mantenimiento Documentos</title>

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

                        <h3 class="page-header">Datos del Documento</h3>
                        
                        <c:if test="${!empty param.btnEnviar}">
                            <jsp:setProperty name="documentos" property="*"/>

                            <c:if test="${!documentos.lleno}">
                                <c:set var = "msg" value = "Todos los campos son obligatorios"/>
                                <c:set var = "tipo" value = "danger"/>
                            </c:if>
                            <c:if test="${documentos.lleno}">
                                <c:set var = "existe" value = "${documentos.existe}"/>
                                <jsp:setProperty name="documentos" property="*"/>
                                <c:choose>
                                    <c:when test="${existe}">
                                        <c:set var = "modif" value = "${documentos.modif}"/>
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
                                        <c:set var = "msg" value = "No se encontró el Documento a modificar"/>
                                        <c:set var = "tipo" value = "danger"/>
                                    </c:when>
                                </c:choose>
                            </c:if>
                            <div class="alert alert-${tipo} alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${msg}
                            </div>
                        </c:if>

                    
                        <c:choose>
                            <c:when test="${existe}">
                                <form class="form-horizontal" role="form" action="verDocumento.jsp?id=${documentos.idDocumento}" method="POST">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">ID: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="idDocumento" id="txtID" 
                                                       value="${documentos.idDocumento}" placeholder="ID" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Edición: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="edicion" id="txtEdicion" 
                                                       value="${documentos.edicion}" placeholder="Edicion" required/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Imprenta Editorial: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="idEditorial">
                                                <c:forEach items="${editorial.editorial}" varStatus="status" var="edit">
                                                    <option value="${edit.idImprenEdi}" ${edit.idImprenEdi == documentos.idImprenEdi ? 'selected' : ''}>${edit.lugar}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Descripción: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="descripcion" id="txtDescripcion" 
                                                       value="${documentos.descripcion}" placeholder="Descripcion" required/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Notas: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="notas" id="txtNotas" 
                                                       value="${documentos.notas}" placeholder="Notas" required/>
                                            </div>
                                        </div>
                                            
                                            <div class="form-group">
                                            <label class="col-md-2 control-label">Titulo: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="titulo" id="txtTitulo" 
                                                       value="${documentos.titulo}" placeholder="Titulo" required/>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Idioma: </label>
                                            <div class="col-md-10">

                                                <select class="form-control" name="idIdioma">
                                                <c:forEach items="${idioma.idiomas}" varStatus="status" var="idiom">
                                                    <option value="${idiom.idIdioma}">${idiom.idioma}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                            
                                            
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Modificar Documento">                       
                                        </div>
                                    </div>
                                </form>
                                
                            </c:when>
                            <c:when  test="${!existe}">
                                <input type="text" class="form-control" name="idDocumento" id="txtID" 
                                                       value="${documentos.idDocumento}" placeholder="ID" readonly/>
                                <div class="alert alert-danger">No se encontró el Documento. <a href="documentos.jsp" class="alert-link">Regresar</a></div>
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


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="revistas" class="sv.edu.udb.beans.Revistas"/> 
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

<jsp:setProperty name="revistas" property="idRevista" param="id"/>
<c:set var = "existe" value = "${revistas.existe}"/>

<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mantenimiento Revista</title>

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

                        <h3 class="page-header">Datos de la revista</h3>
                        
                        <c:if test="${!empty param.btnEnviar}">
                            <jsp:setProperty name="revistas" property="*"/>

                            <c:if test="${revistas.lleno}">
                                <c:set var = "existe" value = "${revistas.existe}"/>
                                <jsp:setProperty name="revistas" property="*"/>
                                <c:choose>
                                    <c:when test="${existe}">
                                        <c:set var = "modif" value = "${revistas.getModiff(revistas.idRevista)}"/>
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
                                <form class="form-horizontal" role="form" action="verRevista.jsp?id=${revistas.idRevista}" method="POST">
                                    <div class="col-md-12">
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">ID Documento: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="iddocumento" id="iddocumento" 
                                                       value="${revistas.retornariddoc(revistas.idRevista)}" placeholder="Edicion" required/>
                                            </div>
                                        </div>
                                        
      
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">ID Revista: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="idrevista" id="idrevista" 
                                                       value="${revistas.idRevista}" placeholder="ID" readonly/>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">ISSN: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="issn" id="issn" 
                                                       value="${revistas.retornarissn(revistas.idRevista)}" placeholder="Edicion" required/>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Ejemplares: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="ejemplares" id="ejemplares" 
                                                       value="${revistas.retornarejemplares(revistas.idRevista)}" placeholder="Edicion" required/>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">Contenido: </label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" name="contenido" id="contenido" 
                                                       value="${revistas.retornarecontenido(revistas.idRevista)}" placeholder="Descripcion" required/>
                                            </div>
                                        </div>
                                            
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-primary pull-right" name="btnEnviar" value="Modificar Documento">                       
                                        </div>
                                    </div>
                                </form>
                                
                            </c:when>
                            <c:when  test="${!existe}">
                                <input type="text" class="form-control" name="idRevista" id="txtID" 
                                                       value="${documentos.idDocumento}" placeholder="ID" readonly/>
                                <div class="alert alert-danger">No se encontró el Documento. <a href="revistas.jsp" class="alert-link">Regresar</a></div>
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

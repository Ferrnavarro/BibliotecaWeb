<%-- 
    Document   : usuarios
    Created on : 04-22-2018, 11:43:56 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="conexion.jsp"%>
<%
    HttpSession sesionUsuario = request.getSession();
     if (sesionUsuario.getAttribute("tipo").equals(3)) {
     }else{
           response.sendRedirect("index.jsp");
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
        <%  
            String consulta;
             consulta="select documentos.idDocumento,documentos.Titulo,documentos.Descripcion,documentos.Notas,idioma.Idioma,documentos.Edicion,autor.Nombre  \n";
            
            
             if(request.getParameter("material").equals("1"))
             {
             consulta+=",libro.ISBN ";    
             consulta+= " from documentos inner join libro on documentos.idDocumento = libro.idDocumento \n";
             }else if(request.getParameter("material").equals("4"))
             {
                 consulta+=",revistas.contenido,revistas.ejemplares,revistas.ISSN ";
                consulta+=" from documentos  inner join revistas on revistas.idDocumento = documentos.idDocumento \n";
             }else if(request.getParameter("material").equals("2"))
             {
                 consulta+=" from documentos inner join tesis on documentos.idDocumento = tesis.idDocumento \n";
             }else if(request.getParameter("material").equals("3"))
             {
                 consulta+=", dvd.ISAN ";
                 consulta+=" from documentos inner join DVD on dvd.idDocumento=documentos.idDocumento \n";
             }
                 
             consulta+=" inner join Idioma on idioma.idIdioma=documentos.IdIdioma \n" +
            "inner join autordocumento on documentos.idDocumento = autordocumento.idDocumento \n" +
            "inner join autor on autordocumento.idautor=autor.idAutor ";
             consulta+=" where documentos.Titulo like '%"+request.getParameter("titulo")+"%' and autor.Nombre like '%"+request.getParameter("txtAutor")+"%' and idioma.idIdioma='"+request.getParameter("idioma")+"';";
           
//        }
//        else
//        {
//            consulta="select documentos.Titulo,documentos.Descripcion,documentos.Notas,idioma.Idioma,documentos.Edicion from documentos inner join Idioma on idioma.idIdioma=documentos.IdIdioma";
//        }
        
        st = con.prepareStatement(consulta);
        rs = st.executeQuery();
                                                  
            %>
            
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">Listado de Resultados</h2>

                        <h3 class="sub-header">
                            Resultados 
                        </h3>
                        
                        
                        
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                    <th>Id</th>
                                    <th>Titulo</th>
                                    <th>Autor</th>
                                    <th>Descripcion</th>
                                    <th>Edicion</th>
                                    <th>Notas</th>
                                    
                                    
                                    <% 
                                     if(request.getParameter("material").equals("1")) {
                                         %>
                                         <th>ISBN</th>
                                         <%
                                     }else if(request.getParameter("material").equals("4"))
                                       {
                                           %>
                                         <th>Contenido</th>
                                         <th>Ejemplares</th>
                                         <th>ISSN</th>
                                       <%}else if(request.getParameter("material").equals("3"))
                                        {
                                        %> 
                                         <th>ISAN</th>
                                        <%
                                        }
                                        %>
                                         <th>Ver ejemplares</th>
                                        </tr>
                                </thead>
                                <tbody> 
                                    <%
                                       
                                     while (rs.next()) {  
                                      %>
                                         <tr>
                                        <td><%=rs.getInt("idDocumento") %></td> 
                                        <td><%=rs.getString("Titulo")%></td>
                                        <td><%=rs.getString("Nombre") %></td>
                                        <td><%=rs.getString("Descripcion") %> </td>
                                        <td><%=rs.getString("Edicion")%></td>
                                        <td><%=rs.getString("Notas")%></td>
                                        <%
                                            if(request.getParameter("material").equals("1"))
                                            {
                                                %>
                                                <td><%=rs.getString("ISBN")%></td>        
                                                    
                                          <%  }else if(request.getParameter("material").equals("4"))
                                        {
                                            %>
                                                <td><%=rs.getString("Contenido")%></td>  
                                                <td><%=rs.getString("ejemplares")%></td>  
                                                <td><%=rs.getString("ISSN")%></td>  
                                            <%
                                        }else if(request.getParameter("material").equals("3"))
                                            {
                                                %>
                                                <td><%=rs.getString("ISAN")%></td>
                                                <%
                                            }
                                            %>
                                            <td><a href="ejemplares?id=<%=rs.getString("idDocumento")%>" class = "btn btn-default">Ver Ejemplares</a></td>
                                  <%   }
                                     %>
                                     
                                         </tr>
                                </tbody>
                            </table>
                        </div>
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

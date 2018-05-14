<%-- 
    Document   : navbar
    Created on : 04-22-2018, 11:42:28 AM
    Author     : 
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 HttpSession sesionUsuario = request.getSession();
  
%>
    <c:set var="exito" value="${tipo}" />

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">Biblioteca</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= sesionUsuario.getAttribute("carnet") %>
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="salir.jsp"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesión</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">

                <li>
                    <a href="index.jsp"><i class="fa fa-home fa-fw"></i> Inicio</a>
                </li>
                <li>
                    <a href="consulta.jsp"><i class="fa fa-search fa-fw"></i> Consulta</a>
                </li>
                <c:if test="${tipo==3}">
                    <li>
                    <a href="#"><i class="fa fa-edit fa-fw"></i> Mantenimientos<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="usuarios.jsp">Usuarios</a>
                        </li>
                        <li>
                            <a href="tipo.jsp">Tipo de usuario</a>
                        </li>
                        <li>
                            <a href="documentos.jsp">Documentos</a>
                        </li>
                        <li>
                            <a href="libros.jsp">Libros</a>
                        </li>
                        <li>
                            <a href="revistas.jsp">Revistas</a>
                        </li>
                        <li>
                            <a href="dvds.jsp">DVDs</a>
                        </li>
                        <li>
                            <a href="tesis.jsp">Tesis</a>
                        </li>
                    </ul>
                </li>
                </c:if>                
                <li>
                    <a href="prestamos.jsp"><i class="fa fa-book fa-fw"></i> Prestamos</a>
                </li>
                <li>
                    <a href="devoluciones.jsp"><i class="fa fa-clipboard fa-fw"></i> Devoluciones</a>
                </li>
                <li>
                    <a href="estadisticas.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Estadísticas</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

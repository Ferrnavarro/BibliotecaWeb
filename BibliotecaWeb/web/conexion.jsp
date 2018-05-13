<%@page language="java" import="java.sql.*"%>
<%
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/biblioteca", "root", "");
%>

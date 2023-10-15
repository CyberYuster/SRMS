<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>

<%
String jdbcurl="jdbc:mysql://localhost:3306/srms";
String username="root";
String password="";

try{
Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection(jdbcurl,username,password);
application.setAttribute("connection",conn);
}catch(Exception e){
	e.printStackTrace();
}
%>
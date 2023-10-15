<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
//int id=(int)request.getSession().getAttribute("uid");
	String sql="select COUNT(*) from users where softdelete=?";
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setInt(1,1);
	ResultSet data=pst.executeQuery();
	while(data.next()){
		out.println(data.getString(1));
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
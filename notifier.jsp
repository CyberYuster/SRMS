<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->

<%
try{
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
	//Connection conn=(Connection)application.getAttribute("connection");
//logged user id
int id=(int)request.getSession().getAttribute("uid");
	String sql="select COUNT(*) from transaction where receiver_id=? and notifyUser=?";
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setInt(1,id);
	pst.setInt(2,1);
	ResultSet data=pst.executeQuery();
	while(data.next()){
		out.println(data.getString(1));
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
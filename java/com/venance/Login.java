package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			String username=request.getParameter("username");
			String password=request.getParameter("password");
//			hashed password
			String pass=PasswordEncryption.PasswordHashing(password);
			
			String sql="select * from users where username=? and password=?";
			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");

			PreparedStatement pst=DBConnection.getConnection().prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2,pass);
			ResultSet rst=pst.executeQuery();
			if(rst.next()) {
				String fullname=rst.getString("fullname");
//				setting logged username
				request.getSession().setAttribute("user",fullname);
//				setting logged user id
				int id=rst.getInt("id");
				request.getSession().setAttribute("uid", id);
				response.sendRedirect("Dashboad.jsp");
			}else {
				request.setAttribute("error", "Invalid Credentials please try again");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

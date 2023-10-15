package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullname=request.getParameter("fullname");
			String username=request.getParameter("username");
			String password=request.getParameter("pass");
			String course=request.getParameter("course");
			String DOB=request.getParameter("date");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
//			String description=request.getParameter("");
//			String image=request.getParameter("");
			
//			Encrypted password value
			String pass=PasswordEncryption.PasswordHashing(password);
			
			String sql="insert into users(fullname,username,password,course,dob,email,phone,gender) values(?,?,?,?,?,?,?,?)";
//			PreparedStatement pt=DBConnection.getConnection().prepareStatement(sql);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/srms","root","");
			PreparedStatement pt=conn.prepareStatement(sql);
			pt.setString(1, fullname);
			pt.setString(2, username);
			pt.setString(3, pass);
			pt.setString(4, course);
			pt.setString(5, DOB);
			pt.setString(6, email);
			pt.setString(7, phone);
			pt.setString(8, gender);
			int data=pt.executeUpdate();
			if(data>0) {
				request.setAttribute("success", "Successfully registered a data");
				request.getRequestDispatcher("Register_Student.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "Registration failed please try again !!!");
				request.getRequestDispatcher("Register_Student.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

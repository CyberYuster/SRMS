package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String update="update users set fullname=?,username=?,course=?,dob=?,email=?,phone=?,gender=?,description=? where id=?";
			String fullname=request.getParameter("fullname");
			String username=request.getParameter("username");
			String course=request.getParameter("course");
			String dob=request.getParameter("dob");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
			String description=request.getParameter("description");
//			int uid=Integer.parseInt(request.getParameter("user_profile_id"));
			int uid=(int)request.getSession().getAttribute("uid");		
			PreparedStatement ps=DBConnection.getConnection().prepareStatement(update);
			ps.setString(1, fullname);
			ps.setString(2, username);
			ps.setString(3, course);
			ps.setString(4, dob);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, gender);
			ps.setString(8, description);
			ps.setInt(9, uid);
			int data=ps.executeUpdate();
			if(data>0) {
				request.setAttribute("success", "Successfully updated data");
				request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "not able to update the data");
				request.getRequestDispatcher("StudentProfile.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
@MultipartConfig
public class EditItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditItems() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("itemname");
			String desc=request.getParameter("descs");
			int id=Integer.parseInt(request.getParameter("myitem"));
			String sql="update items set pname=?,ptext=? where id=?";
			
			PreparedStatement p=DBConnection.getConnection().prepareStatement(sql);
			p.setString(1, name);
			p.setString(2,desc);
			p.setInt(3, id);
			int data=p.executeUpdate();
			String ids="ViewItems.jsp?id="+id;
			if(data>0) {
				
				request.setAttribute("success", "data updated Successfully");
				request.getRequestDispatcher(ids).forward(request, response);
//				response.sendRedirect("ViewItems.jsp");
				System.out.println("successfully updated");
			}else {
				request.setAttribute("error", "unable to update data");
				request.getRequestDispatcher("ViewItems.jsp?id='"+ids+"'").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

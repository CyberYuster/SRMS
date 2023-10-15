package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String datas=request.getParameter("id");
		
			int id=Integer.parseInt(datas);
			System.out.println("id value at doGet is : "+id);
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql="update items set softdelete=? where id=?";
		PreparedStatement pst=DBConnection.getConnection().prepareStatement(sql);
		pst.setInt(1, -1);
		pst.setInt(2, id);
		int success=pst.executeUpdate();
		if(success>0) {
			request.setAttribute("success", "successfully deleted an item");
			request.getRequestDispatcher("UserItems.jsp").forward(request, response);
		}else {
			request.setAttribute("error", "unable deleted an item");
			request.getRequestDispatcher("UserItems.jsp").forward(request, response);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

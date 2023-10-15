package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;

public class MakeNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MakeNotification() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//			logged user id
			int senderid=(int)request.getSession().getAttribute("uid");
			int productid=Integer.parseInt(request.getParameter("products"));
			int receiverid=Integer.parseInt(request.getParameter("users"));
//			System.out.println("id for receiving user is : "+receiverid);
			String sql="insert into transaction(sender_id,pid,receiver_id,notifyUser) values(?,?,?,?)";
			PreparedStatement pst=DBConnection.getConnection().prepareStatement(sql);
			pst.setInt(1, senderid);
			pst.setInt(2, productid);
			pst.setInt(3, receiverid);
			pst.setInt(4, 1);
			int data=pst.executeUpdate();
			if(data>0) {
				request.setAttribute("success", "message sent Successfull !!!");
				request.getRequestDispatcher("UserItems.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "error on sending message !!!");
				request.getRequestDispatcher("UserItems.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

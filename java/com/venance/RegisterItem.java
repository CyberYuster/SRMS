package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
@MultipartConfig
public class RegisterItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		String sql="insert into items(pname,ptext,userId) values(?,?,?)";
		String name=request.getParameter("itemname");
		String description=request.getParameter("subject");
		
		
//        String filelname=request.getParameter("FileUpload");
		int datas=(int)request.getSession().getAttribute("uid");
		
		PreparedStatement pmt=DBConnection.getConnection().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		pmt.setString(1, name);
		pmt.setString(2, description);
		pmt.setInt(3, datas);
		//pmt.setString(4, fileName);
		
		int data=pmt.executeUpdate();
		if(data>0) {
			Part filePart = request.getPart("FileUpload");
	        String fileName = filePart.getSubmittedFileName();
			int generatedKey=0;
			ResultSet keys=pmt.getGeneratedKeys();
			if(keys.next()) {
				System.out.println("automatic id is generated");
				generatedKey=keys.getInt(1);
				String sqls="update items set file=? where id=?";
				PreparedStatement pmts=DBConnection.getConnection().prepareStatement(sqls);
				pmts.setString(1, generatedKey+fileName);
				pmts.setInt(2, generatedKey);
				int success=pmts.executeUpdate();
				if(success>0) {
					request.setAttribute("success", "Successfully registered a data");

					String uploadDir="itemsdata";	
						File folder=new File(uploadDir);
						if(!folder.exists()) {
							folder.mkdirs();
						}
						
						File outputFile=new File(folder,generatedKey+fileName);
						System.out.println("filname is :"+generatedKey+fileName);
						InputStream inputs=filePart.getInputStream();
						Files.copy(inputs,outputFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
						
						System.out.println("data successfully registered to "+outputFile.getAbsolutePath());
						request.getRequestDispatcher("Register_Item.jsp").forward(request, response);
				}else {
					System.out.println("not able to save image data to the database");
				}
				}else {
					System.out.println("automatic id not generated");
				}
			
		}else {
			request.setAttribute("error", "Registration failed please try again !!!");
			request.getRequestDispatcher("Register_Item.jsp").forward(request, response);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

}

package com.venance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
@MultipartConfig
public class EditItemFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditItemFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String folderpath="itemsdata";
			
		int itemids=Integer.parseInt(request.getParameter("id"));	
		String filename="select * from items where id=?";
		PreparedStatement pm=DBConnection.getConnection().prepareStatement(filename);
		pm.setInt(1, itemids);
		ResultSet rs=pm.executeQuery();
		if(rs.next()) {
			String file_name=rs.getString("file");
			 response.setContentType("*/*");
			 Path filepath=Paths.get(folderpath,file_name);
//				InputStream inputs=getServletContext().getResourceAsStream(folderpath+file_name);
			 InputStream inputs=Files.newInputStream(filepath);
				OutputStream outputs=response.getOutputStream();
				if(inputs==null) {
					response.setStatus(HttpServletResponse.SC_NOT_FOUND);
					return;
				}else {
					byte[] buffer=new byte[1024];
					int bytesRead;
					while((bytesRead=inputs.read(buffer))!=-1) {
						outputs.write(buffer, 0, bytesRead);
					}
				}
				
		}else {
			System.out.println("unable to retrieve data from items table");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int itemID=Integer.parseInt(request.getParameter("itemids"));
			String getPreviousData="select * from items where id ='"+itemID+"'";
			PreparedStatement pss=DBConnection.getConnection().prepareStatement(getPreviousData);
			ResultSet rr=pss.executeQuery();
			if(rr.next()) {
				String previousFile=rr.getString("file");
				String updateItemFile="update items set file=? where id=?";
				Part partFile=request.getPart("files");
				String filename=itemID+partFile.getSubmittedFileName();
				PreparedStatement ps=DBConnection.getConnection().prepareStatement(updateItemFile);
				ps.setString(1, filename);
				ps.setInt(2, itemID);
				int success=ps.executeUpdate();
				String viewitems="ViewItems.jsp?id="+itemID;
				if(success>0) {
         FilesEditing edits=new FilesEditing();
         edits.updations("itemsdata", previousFile, filename,partFile);
         request.setAttribute("success", "successfully updated the file");
         
         
         request.getRequestDispatcher(viewitems).forward(request, response);
				}else {
					request.setAttribute("error", "not able to update the file");
					 request.getRequestDispatcher(viewitems).forward(request, response);
					System.out.println("Error on updating items files");
				}
			}else {
				System.out.println("data was unable to retrieve");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

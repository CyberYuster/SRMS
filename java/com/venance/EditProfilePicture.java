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
import java.sql.Statement;
@MultipartConfig
public class EditProfilePicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditProfilePicture() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int profileid=Integer.parseInt(request.getParameter("id"));
//			int profileid=(int)request.getSession().getAttribute("uid");
			String getprofilename="select * from users where id=?";
			PreparedStatement pst=DBConnection.getConnection().prepareStatement(getprofilename);
			pst.setInt(1, profileid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				String filename=rs.getString("profile_img");
				String folder="profile_pictures";
				Path filepath=Paths.get(folder,filename);
				InputStream inputs=Files.newInputStream(filepath);
				OutputStream outputs=response.getOutputStream();
				if(inputs==null) {
				
					return;
				}else {
					byte[] buffer=new byte[1024];
					int bytesread;
					while((bytesread=inputs.read(buffer))!=-1) {
						outputs.write(buffer,0,bytesread);
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=(int)request.getSession().getAttribute("uid");
			String existprofile="select * from users where id=?";
			PreparedStatement ps=DBConnection.getConnection().prepareStatement(existprofile);
			ps.setInt(1, id);
			ResultSet rst=ps.executeQuery();
			if(rst.next()) {
				String presentProfileImage=rst.getString("profile_img");
				String sql="update users set profile_img=? where id=?";
				PreparedStatement p=DBConnection.getConnection().prepareStatement(sql);
				Part filepart=request.getPart("image");
				String filename=id+filepart.getSubmittedFileName();
				p.setString(1, filename);
				p.setInt(2, id);
				
				int success=p.executeUpdate();
				
				if(success>0) {
					File folder=new File("profile_pictures");
					if(!folder.exists()) {
						folder.mkdirs();
					}
					
					FilesEditing fedit=new FilesEditing();
					fedit.updations("profile_pictures", presentProfileImage, filename, filepart);
//			success	message to the page
					/*
					 * request.setAttribute("success","successfuly updated the profile image");
					 * request.getRequestDispatcher("StudentProfile.jsp").forward(request,
					 * response);
					 */
				}else {
					System.out.println("not able to update the profile picture");
					/*
					 * request.setAttribute("error","unable to update the profile image");
					 * request.getRequestDispatcher("StudentProfile.jsp").forward(request,
					 * response);
					 */
				}
			}else {
				System.out.println("retrieving of data was impossible");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

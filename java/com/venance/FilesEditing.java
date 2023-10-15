package com.venance;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.http.Part;

public class FilesEditing {
public void updations(String folderpath,String existingFile,String newFile,Part partFile) {
	Path oldfile=Paths.get(folderpath,existingFile);
	Path newfile=Paths.get(folderpath,newFile);
	
	if(Files.exists(oldfile)) {
		try {
			Files.delete(oldfile);
			InputStream inputs=partFile.getInputStream();
			Files.copy(inputs,newfile,StandardCopyOption.REPLACE_EXISTING);
			System.out.println("files replaced successfully");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}else {
		 
		try {
			InputStream inputs = partFile.getInputStream();
			Files.copy(inputs,newfile,StandardCopyOption.REPLACE_EXISTING);
			System.out.println("files replaced successfully");
			System.out.println(existingFile + "does not exists in folder "+folderpath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
}

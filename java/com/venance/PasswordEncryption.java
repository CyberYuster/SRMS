package com.venance;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {
public static String PasswordHashing(String password) {
	try {
//		get instance for 
		MessageDigest digest=MessageDigest.getInstance("SHA-256");
//		Get password bytes and hash them
		byte[] encodedHash=digest.digest(password.getBytes(StandardCharsets.UTF_8));
//		convert the byte array to hexadecimal String
		StringBuilder hexString=new StringBuilder();
		
		for(byte b: encodedHash) {
			String hex=Integer.toHexString(0xff & b);
			if(hex.length()==1)hexString.append('0');
			hexString.append(hex);
		}
		return hexString.toString();
	}catch(NoSuchAlgorithmException e) {
		e.printStackTrace();
		return null;
	}	
}
/*
 * public static void main(String[] args) {
 * System.out.println("hashed hello is : "+PasswordHashing("hello")); }
 */
}

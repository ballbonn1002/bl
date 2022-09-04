package com.cubesofttech.service;

import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import com.cubesofttech.system.Constant;
import com.cubesofttech.util.MD5;

@Service
public class LoginService {

	
	@Autowired
	private JavaMailSender mailSender;

	public String generateMD5(String password) throws NoSuchAlgorithmException {
		return MD5.getInstance().hashData(password.getBytes());
	}


	public void sendmail(String key, String emails){
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("no-reply@cubesofttech.com");
		message.setTo(emails);
		message.setSubject("Password Reset");
		message.setText("Hello,\r\n"
				+ " \r\n"
				+ "You recently requested to reset your password. Click on the link below to change your password.\r\n"
				+ " \r\n"
				+ Constant.getWebContext() +"/resetpassword.jsp?token=" + key + "\r\n"
				+ " \r\n"
				+ "If you did not make the request to reset your password or if you are in need of further assistance, please contact our HR Team.\r\n"
				+ " \r\n"
				+ "Thanks!");
		mailSender.send(message);
	}

	public String randomPassword(int length) {
		Random rand = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < length; i++) {
			sb.append(rand.nextInt(10));
		}
		return sb.toString();
	}
}

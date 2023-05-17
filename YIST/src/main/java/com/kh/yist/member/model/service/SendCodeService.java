package com.kh.yist.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class SendCodeService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int authNumber; 
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		
		authNumber = checkNum;
	}
	
	public String joinEmail(String userEmail) {
		
		
		makeRandomNumber();
		
		
		String setFrom = "yist0303@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = userEmail;
		String title = "YIST 회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content =
				 "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>"
				+ "<html xmlns='http://www.w3.org/1999/xhtml'>"
				+ "<head>"
				+ "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />"
				+ "<title>YIST에 방문해주셔서 감사합니다.</title>"
				+ "<meta name='viewport' content='width=device-width, initial-scale=1.0'/>"
				+ "</head>"
				+ "<body style='margin: 0; padding: 0;'>"
				+ "<table align='center' border='0' cellpadding='0' cellspacing='0' width='600' style='border-collapse: collapse;'>"
				+ "<tr>"
		        + "<td align='center' style='padding: 40px 0 30px 0;'>"
		        + "<img src='https://kimpompu.github.io/YISTLogo.png' style='display: block;' width='300' height='230'>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td bgcolor='#99da87' style='padding: 40px 0 30px 0; text-align: center; font-size: 16px; line-height: 20px; font-family: 'Noto Sans KR', sans-serif;'>"
		        +"<table  border='0' cellpadding='0' cellspacing='0' width='100%'>"
		        +"<tr style='color:#ffffff'>"
		        +"<th>인증코드</th>"
		        +"<th>"+authNumber+"</th>"
		        +"</tr>"
		        +"</table>"
		        +"</td>"
		        +"</tr>"
		        +"<tr style='height: 70px; padding: 40px 30px 40px 30px;'>"
		        +"<td style='text-align: center; font-family: 'Noto Sans KR', sans-serif; font-size: 16px; line-height: 20px;'>"
		                +"<b>YJ Institute of System Technology</b>"
		            +"</td>"
		        +"</tr>"       
		    +"</table>"
		+"</body>"
		+"</html>";
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}	
	
	
}

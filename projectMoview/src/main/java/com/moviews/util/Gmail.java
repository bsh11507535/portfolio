package com.moviews.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class Gmail {
	
	/*
		pom.xml에 아래 내용을 추가
		
		<dependency>
			<groupId>javax.mail</groupId>
			<artifactId>javax.mail-api</artifactId>
			<version>1.5.4</version>
		</dependency>
		<dependency>
			<groupId>com.sun.mail</groupId>
			<artifactId>javax.mail</artifactId>
			<version>1.5.4</version>
		</dependency>
		
	 */
	
	/*
		Gmail.java를 controller에서 @Inject 후 아래 내용을 쓰려는 메소드에 추가
		
		String recipient; // 받는사람 메일주소
		String subject; // 메일 제목
		String body; // 메일 내용
		
		try {
			Gmail.MailSend(recipient, subject, body);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 */
	
	public static void MailSend(String recipient, String subject, String body) throws Exception {
		// 발신 메일 관련 정보
		String host = "smtp.gmail.com";
		String username = "bsh11507535@gmail.com"; // 지메일 아이디@gmail.com
		String password = "cjyksvptyhovrgit"; // 지메일 앱 비밀번호
		
		// String recipient = ""; // 수신자 메일주소
		// 메일 내용
		// String subject = ""; // 메일 제목
		// String body = ""; // 메일 내용


		// properties 설정
		Properties props = new Properties();
		props.put("mail.smtps.auth", "true");
		// 메일 세션 정의
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);

		// 세션에 데이터 입력
		msg.setSubject(subject);
		msg.setText(body, "utf-8", "html");
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

		// 발송 처리
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(msg, msg.getAllRecipients());
		transport.close();
	}
	public static String resetPass(){
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
//		A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,
		for (int i = 0; i < 10; i++) {
		buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
}

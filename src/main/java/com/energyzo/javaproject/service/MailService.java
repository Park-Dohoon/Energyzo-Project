package com.energyzo.javaproject.service;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender javaMailSender;
    private static final String senderEmail = "ksuwyg9115@gmail.com"; //보내는 사람 이메일 주소

    // 랜덤으로 숫자 생성
    public String createNumber() {
        Random random = new Random();
        Set<Integer> uniqueNumbers = new HashSet<>();  
        StringBuilder key = new StringBuilder();  
        

        while (key.length() < 6) { // 6개의 고유한 숫자를 생성
        	int number = random.nextInt(10); //  0~9사이의 랜덤 숫자
        	if(uniqueNumbers.add(number)) {; // 숫자 이어붙이기
        		key.append(number);
        	}
        }
        return key.toString();
        //  코드는 Set<Integer>에 고유한 숫자들을 저장하고,숫자들을 StringBuilder 객체에 이어붙여 인증번호를 생성  
        // key.toString()을 반환하면 6자리의 인증번호가 반환됩니다.
    }

    public MimeMessage createMail(String mail, String number) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();

		 
		 message.setFrom(senderEmail);
		 message.setRecipients(MimeMessage.RecipientType.TO, mail);
		 message.setSubject("이메일 인증");
		 
        
			/* 원본 String body = ""; */
		String body = "<html><body>"; 
        body += "<h3>요청하신 인증 번호입니다.</h3>";
        body += "<h1>" + number + "</h1>";
        body += "<h3>감사합니다.</h3>";
        message.setContent(body, "text/html; charset=UTF-8");

        return message;
    }

    // 메일 발송
    public String sendSimpleMessage(String sendEmail, HttpSession session) throws MessagingException {
        String generatedAuthCode = createNumber(); // 랜덤 인증번호 생성
        
        session.setAttribute("authCode", generatedAuthCode);  
        
        MimeMessage message = createMail(sendEmail, generatedAuthCode); // 메일 생성
        try {
            javaMailSender.send(message); // 메일 발송
        } catch (MailException e) {
            e.printStackTrace();
            throw new IllegalArgumentException("메일 발송 중 오류가 발생했습니다.");
        }

        return generatedAuthCode; // 생성된 인증번호 반환
    }
}

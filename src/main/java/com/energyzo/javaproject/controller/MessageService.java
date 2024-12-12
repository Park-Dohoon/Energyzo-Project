package com.energyzo.javaproject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {
	
	//휴대폰 문자인증	
	public void sendMessage(HttpServletRequest request, String randomNumber) {
		String api_key = "NCS3QU5AG3DQ2OLC";
		String api_secret =  "89TDFKOBQSI4M8MOCMX9MYTMHPX34KYF";
								
		
		Message coolsms = new Message(api_key,api_secret);
		
		HashMap<String,String> params = new HashMap<String,String>();
		String mTel = request.getParameter("to"); //수신전화번호(jsp통해 받음)
		
		if (mTel == null || mTel.isEmpty()) {
		    System.out.println("수신 전화번호가 없습니다.");
		    return;
		}
		
		params.put("to", mTel); // 수신전화번호 -> 받는번호
		params.put("from","01087219052"); //실제 발신전화번호 입력
		params.put("type", "SMS");
		params.put("text", "[인증번호] 본인확인 인증번호("+randomNumber+")를 입력하세요."); // 입력할 내용
		params.put("app_version","JAVA SDK v2.2");
		
		System.out.println("---메세지 서비스까지는 돈다고합디다아아앙--------------");  // 콘솔찍힘 확인완료
		
		try {
		    JSONObject obj = (JSONObject) coolsms.send(params);
		    System.out.println("문자 발송 응답: " + obj.toString());    
	
		} catch (CoolsmsException e) {
		    System.out.println("문자 발송 실패: " + e.getMessage());
		    System.out.println("오류 코드: " + e.getCode());
		}		

	}
}
/////////////////////////////문자인증 발송 가능 확인 완료 ////////////////////건드리지 마시오///////////////////////
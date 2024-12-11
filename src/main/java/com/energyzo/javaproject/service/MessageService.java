package com.energyzo.javaproject.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MessageService {
	
	//휴대폰 문자인증
	public void sendMessage(HttpServletRequest request, String randomNumber) {
		String api_key = "NCSEVRFZLXOWHXTT";
		String api_secret =  "IEHDVCAFZ63VDCB1THY410CGNBWSTDIB";
		
		Message coolsms = new Message(api_key,api_secret);
		
		HashMap<String,String> params = new HashMap<String,String>();
		String mTel = request.getParameter("mTel"); //수신전화번호(jsp통해 받음)
		params.put("to", mTel); // 수신전화번호 -> 받는번호
		params.put("from","01065081115"); //실제 발신전화번호 입력
		params.put("type", "SMS");
		params.put("text", "[ka Ac Tueail} 본인확인 인증번호("+randomNumber+")를 입력하세요."); // 입력할 내용
		params.put("app_version","JAVA SDK v2.2");
		
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}

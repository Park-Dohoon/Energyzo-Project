package com.energyzo.javaproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.vo.MemberVO;
import com.energyzo.javaproject.service.MailService;
import com.energyzo.javaproject.service.MemberService;

@Controller
//@RequiredArgsConstructor
public class MailController {

	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberService memberService;

	// 메일발송 인증
	@ResponseBody
	@GetMapping("/emailCheck.do") // 이 부분은 각자 바꿔주시면 됩니다. @RequestBody MailDTO mailDTO
	public String emailCheck(String email, HttpServletRequest request)
			throws MessagingException, UnsupportedEncodingException {
		// String email = mailDTO.getEmail();
		// 세션 객체 요청 가져오기
		HttpSession session = request.getSession();

		String authCode = mailService.sendSimpleMessage(email, session); // 인증번호 발송

		 // 이메일과 인증코드를 세션에 저장
	    session.setAttribute("email", email);  // 이메일을 세션에 저장
	    session.setAttribute("authCode", authCode);  // 인증코드를 세션에 저장
		
	    System.out.println("발송된 인증번호:" +authCode );
	    
		// System.out.println("여기도나요요요요용?11====>" + email);
		return authCode; // Response body에 값을 반환
	}

	
	@RequestMapping("verifyAuthCode_sz.do")
	@ResponseBody
	public Map<String, Object> verifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String userInputCode) {
	    Map<String, Object> response = new HashMap<>();

	    HttpSession session = request.getSession();
	    
	    String correctAuthCode = (String) session.getAttribute("authCode");
	    String userEmail = (String) session.getAttribute("email");

	    //세션에 인증코드와 이메일이 모두 있는지 확인
	    if (correctAuthCode == null || userEmail == null) {
	        response.put("resultMessage", "세션이 만료되었습니다. 이메일 인증을 다시 시도해주세요.");
	        return response;
	    }
	    // 인증코드 확인 
	    if (correctAuthCode.equals(userInputCode)) {
	    	//인증 성공시 이메일로 사용자 아이디 찾기 
	    	 MemberVO member = memberService.findIdByEmail(userEmail);
	         if (member != null) {
	             response.put("resultMessage", "인증성공");
	             response.put("userId", member.getUserId());
	             response.put("password", member.getPassword());
	         } else {
	             response.put("resultMessage", "회원 정보가 없습니다.");
	         }
	     } else {
	         response.put("resultMessage", "인증 실패: 잘못된 인증코드");
	     }

	     return response;  // 인증 결과를 JSON으로 반환
	 }
	    
	    

	
	
	
//	 @RequestMapping("verifyAuthCode.do")
//	    public String verifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String userInputCode,  Model model) {
//		 HttpSession session = request.getSession();
//		    String correctAuthCode = (String) session.getAttribute("authCode");
//
//		    String resultMessage;
//
//		    if (correctAuthCode != null && correctAuthCode.equals(userInputCode)) {
//		        // 인증 성공 시, 아이디를 찾기 위한 코드 실행
//		        MemberVO member =  memberService.findIdByEmail((String) session.getAttribute("email"));
//		        if (member != null) {
//		            model.addAttribute("userId", member.getUserId());  // 인증 성공 후, 아이디를 모델에 저장
//		            return "user/success";  // 성공 페이지로 이동 (아이디를 표시하는 페이지)
//		        } else {
//		            resultMessage = "회원 정보가 없습니다.";
//		            model.addAttribute("resultMessage", resultMessage);
//		            return "user/error";  // 오류 페이지로 리턴
//		        }
//		    } else {
//		        resultMessage = "인증 실패: 잘못된 인증코드";
//		        model.addAttribute("resultMessage", resultMessage);
//		        return "user/check2";  // 인증 실패 페이지로 리턴
//		    }
		 
		    
//	        // 세션에서 저장된 인증코드를 가져옴
//	        System.out.println("verifyAuthCode.do 요청 처리 중...");
//	        System.out.println("입력된 인증 코드: " + userInputCode);
//	       
//	       HttpSession session = request.getSession();
//	        String correctAuthCode = (String) session.getAttribute("authCode");
//	        System.out.println("세션에 저장된 인증 코드: " + correctAuthCode);
//
//	        // 인증 결과 메시지 설정
//	        String resultMessage;
//	        
//	        System.out.println(correctAuthCode != null && correctAuthCode.equals(userInputCode));
//	        
//	        // 사용자가 입력한 인증 코드와 세션에 저장된 코드 비교
//	        if (correctAuthCode != null && correctAuthCode.equals(userInputCode)) {
//	            //resultMessage = "인증 성공";
//	            
//	            //model.addAttribute("resultMessage", resultMessage);  // 인증 성공 메시지 저장
//	            	         	            
//	            return "user/success";  // 인증 성공 페이지로 리턴 -> 진짜 값으로 줘야함
//	        } else {
//	            resultMessage = "인증 실패: 잘못된 인증코드";
//	            model.addAttribute("resultMessage", resultMessage);  // 인증 실패 메시지 저장
//	            return "user/check2";  // 인증 실패 페이지로 리턴
//	        }
	        
	        
	    }



	/*
	 * //휴대폰 인증 불일치 일치 확인
	 * 
	 * @RequestMapping("/phverifyAuthCode.do") public String
	 * phverifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String
	 * userInputCode, Model model) { // 세션에서 저장된 인증코드를 가져옴
	 * System.out.println("phverifyAuthCode.do 요청 처리 중...");
	 * System.out.println("입력된 인증 코드: " + userInputCode);
	 * 
	 * HttpSession session = request.getSession(); String correctAuthCode = (String)
	 * session.getAttribute("authCode"); System.out.println("세션에 저장된 인증 코드: " +
	 * correctAuthCode);
	 * 
	 * // 인증 결과 메시지 설정 String resultMessage;
	 * 
	 * // 사용자가 입력한 인증 코드와 세션에 저장된 코드 비교 if (correctAuthCode != null &&
	 * correctAuthCode.equals(userInputCode)) { resultMessage = "인증 성공";
	 * model.addAttribute("resultMessage", resultMessage); // 인증 성공 메시지 저장 return
	 * "user/check"; // 인증 성공 페이지로 리턴 } else { resultMessage = "인증 실패: 잘못된 인증코드";
	 * model.addAttribute("resultMessage", resultMessage); // 인증 실패 메시지 저장 return
	 * "user/check2"; // 인증 실패 페이지로 리턴 }
	 */



package com.energyzo.javaproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.vo.MemberVO;
import com.energyzo.javaproject.service.MailService;
import com.energyzo.javaproject.service.MemberService;

@Controller
//@RequiredArgsConstructor
public class MailController {

	@Autowired
	private MailService mailService; //메일발송이 사용
	
	@Autowired
	private MemberService memberService;//아이디찾기가 사용
	
	@Autowired
    private MessageService messageService;  //휴대폰인증이 사용
	

	// 메일발송 인증요청
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

	
	@RequestMapping("verifyAuthCode.do")
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
	
	
	//회원가입폼 이메일 인증 중복확인
	@RequestMapping("verifyAuthCode21.do")
	@ResponseBody
	public Map<String, Object> verifyAuthCode21(HttpServletRequest request, @RequestParam("authCode") String userInputCode) {
	    Map<String, Object> response = new HashMap<>();

	    HttpSession session = request.getSession();
	    String correctAuthCode = (String) session.getAttribute("authCode");
	    String userEmail = (String) session.getAttribute("email");

	    // 세션이 만료된 경우 처리
	    if (correctAuthCode == null || userEmail == null) {
	        response.put("resultMessage", "세션이 만료되었습니다. 이메일 인증을 다시 시도해주세요.");
	        return response;
	    }

	    // 인증 코드 확인
	    if (correctAuthCode.equals(userInputCode)) {
	        // 인증 성공
	        MemberVO member = memberService.findIdByEmail(userEmail);
	        if (member != null) {
	            response.put("resultMessage", "인증성공");
	            response.put("userId", member.getUserId());
	        } else {
	            response.put("resultMessage", "회원 정보가 없습니다.");
	        }
	    } else {
	        // 인증 실패
	        response.put("resultMessage", "인증 실패: 잘못된 인증코드");
	    }

	    return response;
	}
				
			
	/////////////////////////////휴대폰인증//////////////////////////////////////////////////
	 // SMS 인증번호 요청
	@RequestMapping(value = "/sendSMS.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendSMS(@RequestParam String to, HttpServletRequest request) {
        // 인증번호 생성
        String randomNumber = generateRandomNumber(); // 인증번호 생성 함수
        
        //발송된 인증번호 콘솔에 출력
        System.out.println("발송된 인증번호:" +randomNumber );
        
        
        //세션에 인증번호 전화번호 저장
        HttpSession session = request.getSession();
        session.setAttribute("authCode1", randomNumber); //인증번호 저장
        session.setAttribute("to", to); // 휴대폰번호 저장
                       
        messageService.sendMessage(request, randomNumber); // 메시지 전송
        
        // 메시지를 JSON 형식으로 응답
        JSONObject response = new JSONObject();
        response.put("resultMessage", "인증번호가 발송되었습니다.");
        return response.toString(); // 클라이언트에게 JSON 형태로 반환
    }

  

    // 인증번호 생성 함수(중복없이)
	private String generateRandomNumber() {
	    Random random = new Random();
	    int randomNumber = 100000 + random.nextInt(900000);  // 100000부터 999999까지의 6자리 숫자 생성
	    return String.valueOf(randomNumber); // 6자리 숫자 반환
	}

	
    //휴대폰 인증번호 일치 

    @RequestMapping("/verifyAuthCode2.do")
    @ResponseBody
    public Map<String, Object> phverifyAuthCode2(HttpServletRequest request, 
    		@RequestParam("authCode1") String userInputCode,
    		@RequestParam("to") String userInputPhone) {
    	
        Map<String, Object> response = new HashMap<>();

        HttpSession session = request.getSession();
        String correctAuthCode = (String) session.getAttribute("authCode1"); // 세션에서 인증번호 가져오기
        String correctTo = (String) session.getAttribute("to");   // 세션에서 휴대폰 번호 가져오기          

        // 세션에 인증코드나 휴대폰번호가 없으면 오류 메시지 반환
        if (correctAuthCode == null || correctTo == null) {
            response.put("resultMessage", "세션이 만료되었습니다. 인증번호를 다시 요청해주세요.");
            return response;
        }

        // 입력된 휴대폰 번호와 세션에 저장된 휴대폰 번호 비교
        if (!correctTo.equals(userInputPhone)) {
            response.put("resultMessage", "잘못된 휴대폰 번호입니다.");
            return response;
        }

        // 인증 코드 비교
        if (correctAuthCode.equals(userInputCode)) {
            response.put("resultMessage", "인증 성공");
        } else {
            response.put("resultMessage", "인증 실패: 잘못된 인증번호");
        }

        return response;
    }
    
    
}    

	
	
	




package com.energyzo.javaproject.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.vo.MemberVO;
import com.energyzo.javaproject.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import net.nurigo.java_sdk.api.Message;
//Message 클래스 사용
import net.nurigo.java_sdk.exceptions.CoolsmsException;  


@Controller 
@RequestMapping("user")
public class MemberController {

	@Autowired
	private MemberService memberService; // MemberService를 쓰기위해 private를 만들어줌 그리고 @Autowired붙여줌


	//start페이지 연결링크 
	@RequestMapping("{url}.do") // url 둘다 받음 
	public String Start(@PathVariable String url) {	 //시작

		System.out.println("[]" + url);

		return "user/" +url;			
	}


	//회원가입처리
	@PostMapping("/signup.do")
	public String memberInsert(@ModelAttribute MemberVO memberVO, BindingResult bindingResult) {
		
		System.out.println("user/signup.do 요청 들어옴");
		
		if (bindingResult.hasErrors()) {
			return "redirect:/user/signupForm.do?error=validation"; // 유효성 오류 발생 시
		}
		int result = memberService.memberInsert(memberVO);  // 데이터베이스 삽입
		if (result == 1) {									
			return "redirect:/user/loginResult.do";  // 성공 시 성공성공 멘트뜸
		}else {
			return "redirect:/user/newlogin2.do";  // 실패 시 리디렉션
		}
	}

	
	/********************* 서연 수정**********************/

	// 로그인 페이지 (폼)
	@RequestMapping("/newlogin.do")  // action 값 
	public String showNewLoginPage(MemberVO vo, HttpSession session, Model model) {
		System.out.println("here00000-----------------");
		
		MemberVO result = memberService.idcheck_Login(vo);
		
		//System.out.println(result.toString());
		//result가 null일 경우에는 toString() 호출을 피합니다
		if (result == null) {
	        System.out.println("Login failed, result is null");
	    } else {
	        System.out.println(result.toString());
	    }
			
		//로그인 실패시
		if (result == null || result.getUserId() == null) { //로그인 못하면

			return "user/check2";
		} else { 
			System.out.println("here-----------------");
			//성공시 => 세션에 아이디값 저장
			session.setAttribute("showNewLoginPage", vo.getUserId());
			
			/*********************서연 확인***/
			// 세션 값 확인 및 출력
			String userId = (String) session.getAttribute("showNewLoginPage");
			System.out.println("서연확인 유저아이디 " + userId);
			 model.addAttribute("userId", userId);  // userId 값을 모델에 추가
			
		//	return "user/loginResult";

			return "redirect:../main.do";
		}

	}

	
	/******************************추가*******************************/



	
	

	// 이용약관에서 다음 누르면 회원가입폼 뜸 
	@RequestMapping("newjointest.do")  // action 값 
	public String newjointest() {
		return "user/newJoin2";  // 서버 측에서 해당 경로로 리다이렉트
	}


	//이용약관	 다이렉트 연결
	@RequestMapping("/zcontroller/submit") public String showPolicy() {
		return "redirect:/Privacy_Policy.html"; }


	//아이디 찾기 누르면 열림
	@RequestMapping("/searchid.do") // action 값
	public String showIdPage() {
		return "user/findId";  // view값
	}


	//비밀번호 찾기 누르면 열림
	@RequestMapping("/searchpass.do") // action 값
	public String showPage() {

		return "user/findpass";  // view값
	}
	
	
	//휴대폰 문자인증
	@RequestMapping(value = "/sendSms.do", method = RequestMethod.POST)
	@ResponseBody  // AJAX 요청에 응답을 JSON 형식으로 반환
	public String sendSms(HttpServletRequest request) throws Exception {

		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~");
		// 발급받은 API 키와 시크릿
		String api_key = "NCSEVRFZLXOWHXTT";
		String api_secret = "IEHDVCAFZ63VDCB1THY410CGNBWSTDIB";

		// Message 객체 생성
		Message coolsms = new Message(api_key, api_secret);

		// 랜덤 인증코드 생성 (6자리 숫자)
		int authCode = (int) (Math.random() * 1000000);
		String formattedAuthCode = String.format("%06d", authCode);

		// 세션에 인증번호 저장
		HttpSession session = request.getSession();
		session.setAttribute("authCode", formattedAuthCode);


		// 문자 전송 데이터 설정
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", request.getParameter("to"));  // 수신번호
		set.put("from", "01065081115");  // 인증된 발신번호
		set.put("text", "인증코드는 " + formattedAuthCode + " 입니다.");
		set.put("type", "sms");  // 문자 타입

		System.out.println("-------------------------------");
		try {
			JSONObject result = coolsms.send(set);  // 전송 결과를 받아오는 부분
			System.out.println("전송 결과: " + result.toString());
			return "인증번호 전송 완료";  // 성공 메시지 반환
		} catch (CoolsmsException e) {
			System.out.println("========================================");
			System.out.println("에러 메시지: " + e.getMessage());
			System.out.println("에러 코드: " + e.getCode());
			return "인증번호 전송 실패";  // 실패 메시지 반환
		}
	}
}
	
	
		

	



	/*@Controller
	public class RefundMessageController {
*/
//		@RequestMapping(value = "/sendSms.do", method = RequestMethod.POST)
//		@ResponseBody  // AJAX 요청에 응답을 JSON 형식으로 반환
//		public String sendSms(HttpServletRequest request) throws Exception {
//
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~");
//			// 발급받은 API 키와 시크릿
//			String api_key = "NCSEVRFZLXOWHXTT";
//			String api_secret = "IEHDVCAFZ63VDCB1THY410CGNBWSTDIB";
//
//			// Message 객체 생성
//			Message coolsms = new Message(api_key, api_secret);
//
//			// 랜덤 인증코드 생성 (6자리 숫자)
//			int authCode = (int) (Math.random() * 1000000);
//			String formattedAuthCode = String.format("%06d", authCode);
//
//			// 세션에 인증번호 저장
//			HttpSession session = request.getSession();
//			session.setAttribute("authCode", formattedAuthCode);
//
//
//			// 문자 전송 데이터 설정
//			HashMap<String, String> set = new HashMap<String, String>();
//			set.put("to", request.getParameter("to"));  // 수신번호
//			set.put("from", "01065081115");  // 인증된 발신번호
//			set.put("text", "인증코드는 " + formattedAuthCode + " 입니다.");
//			set.put("type", "sms");  // 문자 타입
//
//			System.out.println("-------------------------------");
//			try {
//				JSONObject result = coolsms.send(set);  // 전송 결과를 받아오는 부분
//				System.out.println("전송 결과: " + result.toString());
//				return "인증번호 전송 완료";  // 성공 메시지 반환
//			} catch (CoolsmsException e) {
//				System.out.println("========================================");
//				System.out.println("에러 메시지: " + e.getMessage());
//				System.out.println("에러 코드: " + e.getCode());
//				return "인증번호 전송 실패";  // 실패 메시지 반환
//			}
//		}



	/*
	 * @RequestMapping("phverifyAuthCode.do") public String
	 * verifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String
	 * userInputCode, Model model) { // 세션에서 저장된 인증코드를 가져옴
	 * System.out.println("phverifyAuthCode.do 요청 처리 중...");
	 * System.out.println("입력된 인증 코드: " + userInputCode);
	 * 
	 * HttpSession session = request.getSession(); String correctAuthCode = (String)
	 * session.getAttribute("authCode"); System.out.println("세션에 저장된 인증 코드: " +
	 * correctAuthCode);
	 * 
	 * String resultMessage;
	 * 
	 * // 사용자가 입력한 인증코드와 비교 if (correctAuthCode != null &&
	 * correctAuthCode.equals(userInputCode)) { resultMessage = "인증 성공";
	 * model.addAttribute("resultMessage", resultMessage);
	 * 
	 * return "user/newlogin2"; } else { // 인증 실패 return "인증 실패: 잘못된 인증코드"; } } }
	 */
	


	
	






















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
			
			return "redirect:../main.do";
			//return "redirect:/user/loginResult.do";  // 성공 시 성공성공 멘트뜸
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
			model.addAttribute("loginfail", true);
			return "redirect:newlogin2.do";
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
		return "user/findidSample2";  // view값
	}


	//비밀번호 찾기 누르면 열림
	@RequestMapping("/searchpass.do") // action 값
	public String showPage() {

		return "user/findpass2";  // view값
	}
		
}
	
	
		

	



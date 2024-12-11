package com.energyzo.javaproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

	@RequestMapping("/main.do")
	public String getUsers(Model model) {

		return "main/main";

	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
	    System.out.println("로그아웃 요청 처리됨");
	   
	    // 세션에서 user_id 값 출력
	    Object userId = session.getAttribute("showNewLoginPage");
	    System.out.println("세션에서 user_id 값: " + userId);

	    // 세션에서 user_id 삭제
	    session.removeAttribute("showNewLoginPage");
	    
	    // 세션 무효화 (전체 세션을 종료)
	    session.invalidate();

	    
	    // 로그아웃 후 메인 페이지로 리다이렉트
	    return "redirect:/main.do";
	}

}
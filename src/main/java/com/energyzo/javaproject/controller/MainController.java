package com.energyzo.javaproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.SearchService;


@Controller
public class MainController {

	@Autowired
	SearchService service;
	
	@RequestMapping("/main.do")
	public String startMain(Model model) {

		EstSearchDTO data = new EstSearchDTO();
		data.setEst_addr("서울 강남구");
		
		List<EstateVO> result = service.searchListByAddr(data);
		model.addAttribute("itemList", result);
		
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
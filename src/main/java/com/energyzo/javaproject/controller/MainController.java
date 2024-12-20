package com.energyzo.javaproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.AgentVO;
import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.MypageService;
import com.energyzo.javaproject.service.SearchService;


@Controller
public class MainController {

	@Autowired
	SearchService service;
	
	
	@Autowired
	private MypageService mypageService;
	
	
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
	
	@RequestMapping("remain.do")
	public String main(HttpSession session) {
	    session.invalidate();
		return "main/main";

	}

	

	//판매자 전환시 따지는 함수
	//1일 경우 대기
	//2일 경우 판매자 승인
	@RequestMapping("agentchange.do")
	public String agentchange(HttpSession session,  Model model) {
		 String user_id = (String) session.getAttribute("showNewLoginPage");

		 
		    AgentVO agent = mypageService.getAgent(user_id);
		    //System.out.println(agent.toString());
		    
		    if (agent == null) {
		        System.out.println("Agent 정보를 찾을 수 없습니다. 판매자 신청 페이지로 이동합니다.");
		        return "mypage/sellerapplication";
		    }
		    
		    int reg_state  = agent.getAgent_reg_state();
		    //System.out.println(reg_state);
		
		    model.addAttribute("agent", agent);
		    
		    if(reg_state == 2) {
		    	return "mypage/seller";
		    }else {
		    	System.out.println("판매자 승인 대기중입니다.");
		    	return "mypage/sellerapplication2";
		    }
	}
}
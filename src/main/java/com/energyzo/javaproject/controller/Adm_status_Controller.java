package com.energyzo.javaproject.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.Adm_ManageVO;
import com.energyzo.javaproject.model.vo.Adm_StatusVO;
import com.energyzo.javaproject.service.Adm_ManageService;
import com.energyzo.javaproject.service.Adm_StatusService;

@Controller
public class Adm_status_Controller {

	
	//##########################
	//		사업현황
	//##########################
	
	@RequestMapping("adm_main.do")
	public String manageview(Model model) {
		System.out.println("adm_status_controller manageview 도착");
		//사업현황 -메인
		// 기본 시작일과 종료일 설정 (예: 30일 전 ~ 오늘)
	    LocalDate today = LocalDate.now();
	    LocalDate startDate = today.minusDays(30);
	    
	    String sdate = startDate.toString();  // 기본 시작일 (30일 전)
	    String fdate = today.toString();      // 기본 종료일 (오늘)
		System.out.println("adm_status_controller manageview 출발");	
		
		

	    // 리디렉션 URL에 sdate와 fdate를 쿼리 파라미터로 추가
		return "redirect:adm_main_point.do?sdate=" + sdate + "&fdate=" + fdate; //다른 컨트롤러를 호출할 때에는 redirect로
	}
	
	@GetMapping("adm_logout.do")
	public String logout(HttpSession session) {
	    // 세션이 존재하는지 확인
	    if (session != null && session.getAttribute("userId") != null) {
	        // 세션 무효화
	        session.invalidate();
	    }
	    // 로그아웃 후 리다이렉트 또는 다른 화면으로 이동
	    return "redirect:/main.do";  // 로그인 페이지로 리다이렉트
	}
	
	@GetMapping("adm_session.do")
	public String adm_session(HttpSession session, Model model) {
		 // 세션에서 값 가져오기
	    String userId = (String) session.getAttribute("user_id");
	    String userName = (String) session.getAttribute("nick_name");

	    // 세션 값이 없으면 로그인 페이지로 리다이렉트
	    if (userId ==null || userName == null) {
	    	
	        return "redirect:/main.do";  // 로그인 페이지로 리다이렉트
	    }

	    
	    // userId가 "supervisor"가 아니면 main.do로 리다이렉트
	    if (!"supervisor".equals(userId)) {
	        return "redirect:/main.do";  // main.do로 리다이렉트
	    }
	    
	    
	    // 세션 값을 모델에 담아서 뷰로 전달
	    model.addAttribute("userId", userId);
	    model.addAttribute("userName", userName);

	    // 관리자 홈 화면으로 이동
	    return "adm_main.do";
	}
	
	@Autowired
	private Adm_ManageService manageService;
	
	@GetMapping("adm_main_point.do")
	public String adm_main_point(String sdate, String fdate, Model model) {
		System.out.println("adm_status_controller main_point 도착");
		
		//사업현황-포인트
		Map<String, String> datepoint = new HashMap<>();
		datepoint.put("sdate", sdate);
		datepoint.put("fdate", fdate);
		System.out.println("시작일 : "+sdate);
		System.out.println("종료일 : "+fdate);
		

		List<Adm_ManageVO> list = manageService.getTotal_point(datepoint);
		
		model.addAttribute("pointslist", list);
		

		List<Adm_ManageVO> list2 = manageService.getPoint_list(datepoint);
		
		model.addAttribute("pointlistall", list2);
		
		
		System.out.println("adm_status_controller main_point 출발");
		return ("/adm/status/adm_main");
	}
	
	
	
	
	@RequestMapping("adm_main_attend.do")
	public String adm_main_attend() {
		//사업현황-출석체크	
		return ("/adm/status/adm_main_attend");
	}


	
	@RequestMapping("adm_main_auct.do")
	public String adm_main_auct() {
		//사업현황-경매
		return ("/adm/status/adm_main_auct");
	}
	
	@Autowired
	private Adm_StatusService statusService;
	
	
	
	@GetMapping("adm_main_trade.do")
	public String adm_main_trade(Model model) {
		System.out.println("adm_status_controller adm_main_trade 도착");
		//사업현황 -메인
		// 기본 시작일과 종료일 설정 (예: 30일 전 ~ 오늘)
	    LocalDate today = LocalDate.now();
	    LocalDate startDate = today.minusDays(90);
	    
	    String sdate = startDate.toString();  // 기본 시작일 (30일 전)
	    String fdate = today.toString();      // 기본 종료일 (오늘)
		System.out.println("adm_status_controller adm_main_trade 출발");	
		
		

	    // 리디렉션 URL에 sdate와 fdate를 쿼리 파라미터로 추가
		return "redirect:adm_main_trade_body.do?sdate=" + sdate + "&fdate=" + fdate; //다른 컨트롤러를 호출할 때에는 redirect로
	}
	
	
	
	
	
	@GetMapping("adm_main_trade_body.do")
	public String adm_main_trade_body(String sdate, String fdate, Model model) {
		System.out.println("controller adm_main_trade_body 도착");
		//사업현황-거래
	    	    
		Map<String, String> dateStatus=new HashMap<>();
		dateStatus.put("sdate", sdate);
		dateStatus.put("fdate", fdate);
		System.out.println("시작일 : "+sdate);
		System.out.println("종료일 : "+fdate);
		
		List<Adm_StatusVO> list = statusService.total_item(dateStatus);
		//sattusService에서 받은 자료를 list에 담음.
		model.addAttribute("itemtotal",list);
		//model 속성에 list를 itemtotal에 담아서 jsp에서 활용.
		System.out.println("total_item : "+list);
		//System.out.println(list);
		
		List<Adm_StatusVO> list2 = statusService.total_item_list(dateStatus);
		model.addAttribute("itemlist",list2);
		System.out.println("total_item_list : "+list2);
		//System.out.println(list2);
		
		System.out.println("controller adm_main_trade_body 출발");
		return ("/adm/status/adm_main_trade");
		
	}
	
	//이하 미완성
	
	@RequestMapping("adm_main_trade_body_Detail")
	public String adm_main_trade_body_Detail() {
		//사업현황-거래-세부
		// 기본 시작일과 종료일 설정 (예: 90일 전 ~ 오늘)
	    LocalDate today = LocalDate.now();
	    LocalDate startDate = today.minusDays(90);
	    
	    String sdate = startDate.toString();  // 기본 시작일 (30일 전)
	    String fdate = today.toString();      // 기본 종료일 (오늘)
		return "redirect:adm_main_trade_body.do?sdate=" + sdate + "&fdate=" + fdate;
	}

	@RequestMapping("adm_main_attend_Detail")
	public String adm_main_attend_Detail() {
		//사업현황-거래-세부
		// 기본 시작일과 종료일 설정 (예: 90일 전 ~ 오늘)
	    LocalDate today = LocalDate.now();
	    LocalDate startDate = today.minusDays(90);
	    
	    String sdate = startDate.toString();  // 기본 시작일 (30일 전)
	    String fdate = today.toString();      // 기본 종료일 (오늘)
		return "redirect:adm_main_attend.do?sdate=\" + sdate + \"&fdate=\" + fdate;";
	}
	
	@RequestMapping("adm_main_point_Detail")
	public String adm_main_point_Detail() {
		//사업현황-거래-세부
		// 기본 시작일과 종료일 설정 (예: 90일 전 ~ 오늘)
	    LocalDate today = LocalDate.now();
	    LocalDate startDate = today.minusDays(90);
	    
	    String sdate = startDate.toString();  // 기본 시작일 (30일 전)
	    String fdate = today.toString();      // 기본 종료일 (오늘)
		return "redirect:adm_main_point.do?sdate=" + sdate + "&fdate=" + fdate;
	}
	
	
	public void checkAdminSession(HttpServletRequest request, HttpServletResponse response) {
	    String userId = (String) request.getSession().getAttribute("userId");
	    System.out.println(userId);
	    if (!"supervisor".equals(userId)) {
	        // 관리자가 아니면 로그아웃 처리
	        request.getSession().invalidate(); // 세션 무효화
	        try {
	            response.sendRedirect(request.getContextPath() + "/main.do"); // main.do로 리다이렉트
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
}

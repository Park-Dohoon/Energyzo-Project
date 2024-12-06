package com.energyzo.javaproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;
import com.energyzo.javaproject.model.vo.Adm_UserVO;
import com.energyzo.javaproject.service.Adm_SalesService;
import com.energyzo.javaproject.service.Adm_UserService;

@Controller
public class Adm_user_Controller {

	
	//$$$$$$$$$$$$$$$$$$$$$$$$$$
	//		회원관리
	//$$$$$$$$$$$$$$$$$$$$$$$$$$


//일반회원 리스트 호출
@Autowired
private Adm_UserService userService;

@GetMapping("adm_user_alluser.do") //시작 호출값과 일치
public String user_list(Adm_UserVO vo, Model model) {
	//회원관리-전체회원 보기
	System.out.println("User controller.adm_user_alluser 맵핑 도착");
	
//userService.insertUser(vo);
	List<Adm_UserVO> list = userService.listallUser(vo); //UserService와 일치
	model.addAttribute("listallUser",list);
System.out.println(list.get(0).toString());
System.out.println("User controller.adm_user_alluser 맵핑 출발");

return ("/adm/user/adm_user_alluser");

}


//판매회원 리스트 호출
@Autowired
private Adm_SalesService salesService;

@GetMapping("adm_user_sales.do")
public String adm_user_sales(Adm_SalesVO vo, Model model) {
	//회원관리-판매회원
	System.out.println("managerController 진입");
	//SalesVO항목을 vo로 받아서 salesService의 listallSales
	List<Adm_SalesVO> list = salesService.listallSales(vo);
	model.addAttribute("listallSales",list);

	
	System.out.println("managerController 아웃");
	return ("/adm/user/adm_user_sales");
}

//판매 신청 리스트 호출


@GetMapping("adm_user_sales_apply")
public String adm_user_sales_apply(Adm_SalesVO vo, Model model) {
	List<Adm_SalesVO> list = salesService.listSalesApply(vo);
	model.addAttribute("listsalesapply",list);
	
	return ("/adm/user/adm_user_sales_apply");
}

	
	
		//%%%%%%%%%%%%%%%%%%%%%%%%%%
		//		회원관리-sub
		//%%%%%%%%%%%%%%%%%%%%%%%%%%


@RequestMapping("user_insert.do")
public String user_insert(Adm_UserVO vo) {
System.out.println("User controller.user_insert 맵핑 도착");
	//회원관리 - 회원 추가
//userService.insertUser(vo);
userService.insertUser(vo);
System.out.println(vo);
System.out.println("User controller.user_insert 맵핑 출발");
return "redirect:adm_user_alluser.do";  //입력 후 전체 목록 호출

}



}

package com.energyzo.javaproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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


//판매 신청 세부 내용 호출
@GetMapping("adm_user_sales_apply_Detail")
public String adm_user_sales_apply_Detail(String id, Model model) {
	System.out.println("adm_user_sales_apply_main_deatil 진입");
	System.out.println("id : "+id);
	
	int agentNum=Integer.parseInt(id);
	
	Adm_SalesVO param=new Adm_SalesVO();
	
	param.setAgent_num(agentNum);
	
	Adm_SalesVO list = salesService.detailSalesApply(param);
	model.addAttribute("agent",list);
	System.out.println(list);
	
	System.out.println("adm_user_sales_apply_main 출발");
	return("/adm/include/user/detail/adm_user_sales_apply_detail_main");
}

//판매 신청 승인 여부
@PostMapping("adm_user_sales_apply_approve")
public String adm_user_sales_apply_approve(String agent_num, String approve, Adm_SalesVO vo, Model model) {
    System.out.println("adm_user_controller adm_user_sales_apply_approve 도착");

    System.out.println("[=================" + agent_num);
    System.out.println("[=================" + approve);
    System.out.println("[=================" + vo);
    if (approve == null) {
        // approve 파라미터가 null인 경우 처리
        System.out.println("approve 파라미터가 null입니다.");
        return "redirect:adm_user_sales_apply"; // 적절한 처리를 한 후 리디렉션
    }
    


    Map<String, String> params = new HashMap<>();
    if (approve == "1") {
        // 판매자 등록 승인시
        params.put("id", agent_num);
        params.put("agent_reg_state", "2");
        System.out.println("params : " + params);
        salesService.approveSalesApply(vo);
    } else {
        // 판매자 등록 거절시
    	//외래키 관련 삭제 불가
        salesService.rejectSalesApply(vo);
    }

    System.out.println("adm_user_controller adm_user_sales_apply_approve 출발");

    return "redirect:adm_user_sales_apply";
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


// incolpleted

@RequestMapping("adm_user_alluser_Detail")
public String adm_user_alluser_Detail(Adm_UserVO vo) {
System.out.println("User controller.adm_user_alluser_Detail.do 맵핑 도착");
	//회원관리 - 회원 추가
System.out.println("User controller.adm_user_alluser_Detail.do 맵핑 출발");
return "redirect:adm_user_alluser.do";  //입력 후 전체 목록 호출

}

@RequestMapping("adm_user_sales_Detail")
public String adm_user_sales_Detail(Adm_UserVO vo) {
System.out.println("User controller.adm_user_sales_Detail 맵핑 도착");
	//회원관리 - 회원 추가
System.out.println("User controller.adm_user_sales_Detail 맵핑 출발");
return "redirect:adm_user_sales.do";  //입력 후 전체 목록 호출

}




}

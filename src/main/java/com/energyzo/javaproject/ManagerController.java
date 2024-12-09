package com.energyzo.javaproject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;
import com.energyzo.javaproject.model.vo.Adm_ManageVO;
import com.energyzo.javaproject.model.vo.Adm_SalesVO;
import com.energyzo.javaproject.model.vo.Adm_UserVO;
import com.energyzo.javaproject.service.Adm_ItemsService;
import com.energyzo.javaproject.service.Adm_ManageService;
import com.energyzo.javaproject.service.Adm_SalesService;
import com.energyzo.javaproject.service.Adm_UserService;

@Controller
public class ManagerController {
/*
	//##########################
	//		사업현황
	//##########################
	
	@RequestMapping("adm_main.do")
	public String manageview() {
		//사업현황
		return ("/adm/status/adm_main");
	}
	
	@RequestMapping("adm_main_point.do")
	public String adm_main_point() {
		//사업현황-포인트
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
	
	
	
	
	//##########################
	//		관리
	//##########################
	
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
		//		회원관리
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
	
	
	//일반회원 리스트 호출
	@Autowired
	private UserService userService;
	
	@GetMapping("adm_user_alluser.do") //시작 호출값과 일치
	public String user_list(UserVO vo, Model model) {
		//회원관리-전체회원 보기
		System.out.println("User controller.adm_user_alluser 맵핑 도착");
		
	//userService.insertUser(vo);
		List<UserVO> list = userService.listallUser(vo); //UserService와 일치
		model.addAttribute("listallUser",list);
	System.out.println(list.get(0).toString());
	System.out.println("User controller.adm_user_alluser 맵핑 출발");
	
	return ("/adm/user/adm_user_alluser");
	
	}
	
	
	//판매회원 리스트 호출
	@Autowired
	private SalesService salesService;
	
	@GetMapping("adm_user_sales.do")
	public String adm_user_sales(SalesVO vo, Model model) {
		//회원관리-판매회원
		System.out.println("managerController 진입");
		//SalesVO항목을 vo로 받아서 salesService의 listallSales
		List<SalesVO> list = salesService.listallSales(vo);
		model.addAttribute("listallSales",list);

		
		System.out.println("managerController 아웃");
		return ("/adm/user/adm_user_sales");
	}
	
	//판매 신청 리스트 호출
	
	
	@GetMapping("adm_user_sales_apply")
	public String adm_user_sales_apply(SalesVO vo, Model model) {
		List<SalesVO> list = salesService.listSalesApply(vo);
		model.addAttribute("listsalesapply",list);
		
		return ("/adm/user/adm_user_sales_apply");
	}
	
		
		
			//%%%%%%%%%%%%%%%%%%%%%%%%%%
			//		회원관리-sub
			//%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	
	@RequestMapping("user_insert.do")
	public String user_insert(UserVO vo) {
	System.out.println("User controller.user_insert 맵핑 도착");
		//회원관리 - 회원 추가
	//userService.insertUser(vo);
	userService.insertUser(vo);
	System.out.println(vo);
	System.out.println("User controller.user_insert 맵핑 출발");
	return "redirect:adm_user_alluser.do";  //입력 후 전체 목록 호출
	
	}
	
	
	
	
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
		//		상품관리
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
	
	
	@Autowired
	private ItemsService itemsService;
	
	@GetMapping("adm_item_all.do")
	public String adm_item_all(ItemsVO vo, Model model) {
		System.out.println("adm_item_all 진입");
		//상품관리-전체상품
		List<ItemsVO> list = itemsService.listallItems(vo);
		model.addAttribute("listAllItems",list);

		System.out.println("adm_item_all 아웃");
		return ("/adm/item/adm_item_all");
	}
	
	
	@GetMapping("adm_item_complain.do")
	public String adm_item_complain(ItemsVO vo, Model model) {
		System.out.println("controller arrived");
		//상품관리-신고내역
		List<ItemsVO> list = itemsService.listaccuseItems(vo);
		model.addAttribute("listaccuseItem", list);
		System.out.println("controller departed");
		return ("/adm/item/adm_item_complain");
	}
	
	
	@GetMapping("adm_item_discount")
	public String adm_item_discount(ItemsVO vo, Model model) {
		System.out.println("controller adm_item_discount 도착");
		//상품관리-할인가요청
		List<ItemsVO> list = itemsService.listdiscountItems(vo);
		model.addAttribute("listdiscountItems", list);
		
		
		System.out.println("controller adm_item_discount 출발");
		return ("/adm/item/adm_item_discount");
	}
	
	
	
	@PostMapping("adm_item_detail")
	public String adm_item_detail() {
		//상품관리-세부정보
		return ("/adm/item/productdetail");
	}
	
	
	
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
		//		이벤트관리
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
	
	@GetMapping("adm_event_attend_set.do")
	public String adm_event_attend_set() {
		//관리 - 이벤트 - 출석체크 설정
		return ("/adm/event/adm_event_attend_set");
	}
	
	
	@GetMapping("adm_event_auct_set.do")
	public String adm_event_auct_set() {
		//관리 - 이벤트 - 이벤트경매 설정
		return ("/adm/event/adm_event_auct_set");
	}
	
	
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
		//		팝업관리
		//$$$$$$$$$$$$$$$$$$$$$$$$$$
	@Autowired
	private ManageService manageService;
	
	@GetMapping("adm_popup.do")
	public String adm_popup(ManageVO vo, Model model) {
		System.out.println("controller adm_popup 도착");
		//관리 - 팝업관리
		List<ManageVO> list = manageService.listPopupAll(vo);
		
		model.addAttribute("listallPop", list);

		System.out.println("controller adm_popup 출발");
		return ("/adm/manage/adm_popup");
	}
	

	


	
	
	//##########################
	//		비밀번호 변경
	//##########################
	
	@RequestMapping("adm_pw_change.do")
	public String adm_pw_change() {
		//관리 - 비밀번호 변경
		return ("/adm/manage/adm_pw_change");
	}
	
		
	
*/
	
	
}

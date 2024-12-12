package com.energyzo.javaproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.energyzo.javaproject.model.vo.Adm_ManageVO;
import com.energyzo.javaproject.model.vo.Adm_UserVO;
import com.energyzo.javaproject.service.Adm_ManageService;
import com.energyzo.javaproject.service.Adm_UserService;


@Controller
public class Adm_manage_Controller {

	
	
	//$$$$$$$$$$$$$$$$$$$$$$$$$$
	//		팝업관리
	//$$$$$$$$$$$$$$$$$$$$$$$$$$
@Autowired
private Adm_ManageService manageService;

@GetMapping("adm_popup.do")
public String adm_popup(Adm_ManageVO vo, Model model) {
	System.out.println("controller adm_popup 도착");
	//관리 - 팝업관리
	List<Adm_ManageVO> list = manageService.listPopupAll(vo);
	
	model.addAttribute("listallPop", list);

	System.out.println("controller adm_popup 출발");
	return ("/adm/manage/adm_popup");
}

@GetMapping("adm_option.do")
public String adm_option(Adm_ManageVO vo, Model model) {
	System.out.println("controller adm_option 도착");
	/*
	//관리 - 팝업관리
	List<Adm_ManageVO> list = manageService.listoptionAll(vo);
	
	model.addAttribute("listalloption", list);
*/
	System.out.println("controller adm_option 출발");
	return ("redirect:adm_main.do");
}









//##########################
//		비밀번호 변경
//##########################

@RequestMapping("adm_pw_change.do")
public String adm_pw_change() {
	System.out.println("adm_manage_controller adm_pw_change 진입");
	//관리 - 비밀번호 변경
	System.out.println("adm_manage_controller adm_pw_change 출발");
	return ("/adm/manage/adm_pw_change");
}


@Autowired
private Adm_UserService userService;

@PostMapping("adm_pw_change_confirm.do")
public String adm_pw_change_confirm(String currentPassword, 
									String password,
									String registrationNumber,
									Adm_UserVO vo, Model model,
									HttpSession session
									
									) {
	System.out.println("adm_manage_controller adm_pw_change_confirm 진입");
	System.out.println("session : " + session);
	System.out.println("curr : "+currentPassword);
	System.out.println("new : "+password);
	System.out.println("regis : "+registrationNumber);
 
	List<Adm_UserVO> list = userService.listallUser(vo); //UserService와 일치
	model.addAttribute("listallUser",list);

	// 'supervisor' 사용자의 비밀번호 확인
	for (Adm_UserVO user : list) {
		String id=user.getUser_id();
		String pw=user.getPassword();
		if ("supervisor".equals(id)) { 
			String supervisorPassword = pw;
			System.out.println("user : "+user);
		if (supervisorPassword.equals(currentPassword)) { 
			System.out.println("현재 비밀번호가 일치합니다.");
			System.out.println("비밀번호 변경 출발");
			
			userService.updatePW(id, password);
			System.out.println("userservice : "+userService);
						
			System.out.println("비밀번호 변경 도착");
			
			} 
		else { System.out.println("현재 비밀번호가 일치하지 않습니다.");
				model.addAttribute("message","현재 비밀번호 오류.");
				return ("/adm/manage/adm_pw_change");
				} break; } }
	
	
	System.out.println("adm_manage_controller adm_pw_change_confirm 출발");
	return ("redirect:adm_pw_change.do");
}










// 옵션 목록 (페이징)
@GetMapping("/options")
public String listOptions(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
	/*
    int pageSize = 10;
    int totalOptions = manageService.getTotalOptions();
    int totalPages = (int) Math.ceil((double) totalOptions / pageSize);
    int startRow = (page - 1) * pageSize;

    // 옵션 목록 조회
    List<Adm_ManageVO> options = manageService.getOptions(startRow, pageSize);

    // 이전, 다음 페이지 처리
    int prevPage = page > 1 ? page - 1 : 0;
    int nextPage = page < totalPages ? page + 1 : 0;

    model.addAttribute("options", options);
    model.addAttribute("currentPage", page);
    model.addAttribute("prevPage", prevPage);
    model.addAttribute("nextPage", nextPage);
    */
    return "est_opt_list";
}

// 옵션 추가 처리
@PostMapping("addOptionAction")
public String addOption(@RequestParam("est_opt_name") String estOptName) {
	manageService.addOption(estOptName);
    return "redirect:/options";
}

// 옵션 삭제 처리
@GetMapping("deleteOption")
public String deleteOption(@RequestParam("optNum") int optNum) {
    manageService.deleteOption(optNum);
    return "redirect:/options";
}




}

package com.energyzo.javaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Adm_status_Controller {

	
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
}

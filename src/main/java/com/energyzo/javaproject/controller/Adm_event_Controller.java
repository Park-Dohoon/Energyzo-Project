package com.energyzo.javaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Adm_event_Controller {

	
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

}

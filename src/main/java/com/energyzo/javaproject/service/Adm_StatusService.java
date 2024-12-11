package com.energyzo.javaproject.service;

import java.util.Map;

public interface Adm_StatusService {

	//Controller와 일치 - interface에서 정의한 것은 ServiceImpl에서 모두 활용할 것. 
	//controller에서 받은 자료형을 고려하여 그대로 적용. sdate와 fdate를 넘기기 위해 map 사용. 
	public void Total_item(Map<String, String> dateStatus);
	
	public void Total_item_list(Map<String, String> dateStatus);
	
	
}

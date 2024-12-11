package com.energyzo.javaproject.service;

import java.util.List;
import java.util.Map;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;
import com.energyzo.javaproject.model.vo.Adm_ManageVO;

public interface Adm_ManageService {
	
	//Controller와 일치
	public List<Adm_ManageVO> listPopupAll(Adm_ManageVO vo);



	public void addOption(String estOptName);
	
	public void deleteOption(int estOptName);

	public List<Adm_ManageVO> getTotal_point(Map<String, String> datepoint);
	
	public List<Adm_ManageVO> getPoint_list(Map<String, String> datepoint);
	
	public List<Adm_ManageVO> getTotal_item(Map<String, String> dateItem);
	
	public List<Adm_ItemsVO> getTotal_item_list(Map<String, String> dateItem);

	
	
}

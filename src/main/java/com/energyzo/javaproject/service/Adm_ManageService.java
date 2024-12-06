package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_ManageVO;

public interface Adm_ManageService {
	
	//Controller와 일치
	public List<Adm_ManageVO> listPopupAll(Adm_ManageVO vo);

	public int getTotalOptions();

	public List<Adm_ManageVO> getOptions(int startRow, int pageSize);

	public void addOption(String estOptName);
	
	public void deleteOption(int estOptName);
	
}

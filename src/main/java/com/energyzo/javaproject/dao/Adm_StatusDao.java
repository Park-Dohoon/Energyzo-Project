package com.energyzo.javaproject.dao;

import java.util.List;
import java.util.Map;

import com.energyzo.javaproject.model.vo.Adm_StatusVO;

public interface Adm_StatusDao {
	
	public List<Adm_StatusVO> total_item(Map<String, String> dateStatus);
	
	public List<Adm_StatusVO> total_item_list(Map<String, String> dateStatus);
	

}

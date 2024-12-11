package com.energyzo.javaproject.service;

import java.util.List;
import java.util.Map;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;

public interface Adm_ItemsService {

	//ManagerController와 일치. item관련만 다룰 예정
	public List<Adm_ItemsVO> listallItems(Adm_ItemsVO vo);
	
	public List<Adm_ItemsVO> listaccuseItems(Adm_ItemsVO vo);
	
	public List<Adm_ItemsVO> listdiscountItems(Adm_ItemsVO vo);
	
	public Adm_ItemsVO detailItem(Adm_ItemsVO id);
	
	public List<Adm_ItemsVO> itemPic(Adm_ItemsVO id);

	public List<Adm_ItemsVO> getTotal_item_list(Map<String, String> dateItem);
}

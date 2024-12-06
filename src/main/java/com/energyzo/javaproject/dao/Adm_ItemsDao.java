package com.energyzo.javaproject.dao;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;

public interface Adm_ItemsDao {

	public List<Adm_ItemsVO> listallItems(Adm_ItemsVO vo);
	public List<Adm_ItemsVO> listaccuseItems(Adm_ItemsVO vo);
	public List<Adm_ItemsVO> listdiscountItems(Adm_ItemsVO vo);
	public Adm_ItemsVO detailItem(Adm_ItemsVO id);
}

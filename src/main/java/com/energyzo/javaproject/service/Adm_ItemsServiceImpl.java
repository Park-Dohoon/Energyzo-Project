package com.energyzo.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_ItemsDaoImpl;
import com.energyzo.javaproject.model.vo.Adm_ItemsVO;

@Service("itemsService")
public class Adm_ItemsServiceImpl implements Adm_ItemsService{

	@Autowired
	private Adm_ItemsDaoImpl itemsDAO;
	
	public List<Adm_ItemsVO> listallItems(Adm_ItemsVO vo) {
		System.out.println("itemsService 도착");
		List<Adm_ItemsVO> list=itemsDAO.listallItems(vo);
		
		System.out.println("itemsService 출발");
		
		return list;
	}
	
	public List<Adm_ItemsVO> listaccuseItems(Adm_ItemsVO vo) {
		System.out.println("itemsService listaccuseItems 도착");
		List<Adm_ItemsVO> list = itemsDAO.listaccuseItems(vo);
		
		System.out.println("itemsService listaccuseItems 출발");
		
		return list;
	}
	
	
	public List<Adm_ItemsVO> listdiscountItems(Adm_ItemsVO vo){
		System.out.println("itemsService listdiscountItems 도착");
		List<Adm_ItemsVO> list = itemsDAO.listdiscountItems(vo);
		System.out.println("itemsService listdiscountItems 출발");
		return list;
	}
	
	public Adm_ItemsVO detailItem(Adm_ItemsVO id) {
		System.out.println("itemsService detailItem 도착");
		System.out.println("Received id : "+id);
		Adm_ItemsVO list = itemsDAO.detailItem(id);
		System.out.println("itemsService detailItem 출발");
		return list;
	}
	
	
}

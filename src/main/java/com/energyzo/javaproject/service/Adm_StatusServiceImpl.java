package com.energyzo.javaproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_StatusDaoImpl;
import com.energyzo.javaproject.model.vo.Adm_StatusVO;

@Service("statusService")
public class Adm_StatusServiceImpl implements Adm_StatusService{


	//service에서 정의한 것들을 모두 사용
	//넘겨 받을 자료형은 service에서 정의한 것 적용.
	//dao로부터 db 자료를 넘겨 받고, 넘겨 받은 자료를 가공.
	
	@Autowired
	private Adm_StatusDaoImpl statusDAO;
	
	public List<Adm_StatusVO> total_item(Map<String, String> dateStatus) {
		System.out.println("status service total_item 도착");
		List<Adm_StatusVO> list = statusDAO.total_item(dateStatus);
		//statusdao의 db제어에 따라 StatusVO에 있는 인자들을 받아옴.
		//이 값들을 list로 받아서 끌고옴.
		System.out.println(statusDAO);
		
		System.out.println("status service total_item 출발");
		return list;
	}
	
	public List<Adm_StatusVO> total_item_list(Map<String, String> dateStatus) {
		System.out.println("status service total_item_list 도착");
		List<Adm_StatusVO> list = statusDAO.total_item_list(dateStatus);
		//statusdao의 db제어에 따라 StatusVO에 있는 인자들을 받아옴.
		//이 값들을 list로 받아서 끌고옴.
		System.out.println(statusDAO);
		System.out.println("status service total_item_list 출발");
		return list;
	}
}

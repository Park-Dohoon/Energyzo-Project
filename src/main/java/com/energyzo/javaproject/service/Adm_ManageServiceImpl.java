package com.energyzo.javaproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_ItemsDao;
import com.energyzo.javaproject.dao.Adm_ManageDao;
import com.energyzo.javaproject.dao.Adm_ManageDaoImpl;
import com.energyzo.javaproject.model.vo.Adm_ItemsVO;
import com.energyzo.javaproject.model.vo.Adm_ManageVO;

@Service("manageService")
public class Adm_ManageServiceImpl implements Adm_ManageService{

	
	@Autowired
	private Adm_ManageDaoImpl manageDAO;
	
	public List<Adm_ManageVO> listPopupAll(Adm_ManageVO vo){
	
		System.out.println("ManageServiceImpl도착");
		List<Adm_ManageVO> list = manageDAO.listPopupAll(vo);	//Dao의 함수값과 일치
		System.out.println("ManageServiceImpl출발");
		return list;
	}
	
	
	
	
    @Autowired
    private Adm_ManageDao manageDao;
    
    @Autowired
    private Adm_ItemsDao itemsDao;



    // 전체 옵션 개수 조회
    public int getTotalOptions() {
        return manageDAO.countOptions();
    }

    // 옵션 추가
    public void addOption(String estOptName) {
    	manageDAO.insertOption(estOptName);
    }

    // 옵션 삭제
    public void deleteOption(int estOptNum) {
    	manageDAO.deleteOption(estOptNum);
    }
    


    
    public List<Adm_ManageVO> getTotal_point(String sdate, String fdate) {
    	System.out.println("ManageServiceImpl 도착");
    	
    	Map<String, String> datepoint = new HashMap<>();
    	datepoint.put("sdate", sdate);
    	datepoint.put("fdate", fdate);
    	
    	
    	List<Adm_ManageVO> list = manageDAO.getTotal_point(datepoint);
    	
    	System.out.println("adm_manageServiceimpl totalpoint"+list);
    	
    	
		System.out.println("ManageServiceImpl 출발");
		return list;
    }

    
    @Override
    public List<Adm_ManageVO> getTotal_point(Map<String, String> datepoint) {
        System.out.println("ManageServiceImpl: Map형식으로 포인트 조회");

        // DAO 호출
        List<Adm_ManageVO> list = manageDAO.getTotal_point(datepoint);

        System.out.println("adm_manageServiceimpl totalpoint: " + list);
        return list;
    }

    
    @Override
    public List<Adm_ManageVO> getPoint_list(Map<String, String> datepoint) {
        System.out.println("ManageServiceImpl: Map형식으로 포인트 조회");

        // DAO 호출
        List<Adm_ManageVO> list = manageDAO.getPoint_list(datepoint);

        System.out.println("adm_manageServiceimpl point list: " + list);
        return list;
    }
    
    
    
    @Override
    public List<Adm_ItemsVO> getTotal_item_list(Map<String, String> dateItem) {
        System.out.println("ManageServiceImpl: Map형식으로 포인트 조회");

        // DAO 호출
        List<Adm_ItemsVO> list = manageDAO.getTotal_item_list(dateItem);

        System.out.println("adm_manageServiceimpl point list: " + list);
        return list;
    }
    
    
    @Override
    public List<Adm_ManageVO> getTotal_item(Map<String, String> dateItem) {
        System.out.println("ManageServiceImpl: Map형식으로 포인트 조회");

        // DAO 호출
        List<Adm_ManageVO> list = manageDAO.getTotal_item(dateItem);

        System.out.println("adm_manageServiceimpl point list: " + list);
        return list;
    }
    
	
}

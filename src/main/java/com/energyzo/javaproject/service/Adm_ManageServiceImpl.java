package com.energyzo.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_ManageDao;
import com.energyzo.javaproject.dao.Adm_ManageDaoImpl;
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

    // 페이징 처리된 옵션 목록 조회
    @Override
    public List<Adm_ManageVO> getOptions(int startRow, int pageSize) {
        // DAO 메서드를 호출하여 페이징 처리된 옵션 목록을 조회
        return manageDao.paging(startRow, pageSize);
    }
	



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

	
}

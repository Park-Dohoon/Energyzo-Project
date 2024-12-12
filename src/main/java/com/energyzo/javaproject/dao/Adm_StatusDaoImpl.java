package com.energyzo.javaproject.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_ManageVO;
import com.energyzo.javaproject.model.vo.Adm_StatusVO;

@Repository
public class Adm_StatusDaoImpl  implements Adm_StatusDao{

	//맵퍼의 namespace에 따라 실제 db의 값을 호출
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Adm_StatusVO> total_item(Map<String, String> dateStatus) {
		System.out.println("StatusDaoImpl total_item 도착");
		List<Adm_StatusVO> list = sqlSession.selectList("dao.StatusDao.getTotal_item", dateStatus);
		//dateStatus를 getTotal_item에 넘겨서 sql처리 후 list로 받음. 통계
		System.out.println("StatusDaoImpl total_item 출발");
		return list;
	}
	
	public List<Adm_StatusVO> total_item_list(Map<String, String> dateStatus) {
		System.out.println("StatusDaoImpl total_item_list 도착");
		List<Adm_StatusVO> list = sqlSession.selectList("dao.StatusDao.getTotal_item_list", dateStatus);
		//dateStatus를 getTotal_item에 넘겨서 sql처리 후 list로 받음. 일반목록
		System.out.println("StatusDaoImpl total_item_list 출발");
		return list;
	}
	
	
}

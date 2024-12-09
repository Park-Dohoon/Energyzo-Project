package com.energyzo.javaproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;

@Repository
public class Adm_ItemsDaoImpl implements Adm_ItemsDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Adm_ItemsVO> listallItems(Adm_ItemsVO vo) {
	
		System.out.println("itemsDaoimpl 도착");
		
		List<Adm_ItemsVO> list = sqlSession.selectList("dao.ItemsDao.getItemsList", vo);
		System.out.println(list);
		System.out.println("itemsDaoimpl 아웃");
		
		return list;
	}
	
	public List<Adm_ItemsVO> listaccuseItems(Adm_ItemsVO vo) {
		System.out.println("itemsDaoimpl listacuseItems 도착");
		
		List<Adm_ItemsVO> list = sqlSession.selectList("dao.ItemsDao.getItemsAccuseList", vo);
		System.out.println(list);
		
		System.out.println("itemsDaoimpl listacuseItems 출발");
		
		return list;
	}
	
	public List<Adm_ItemsVO> listdiscountItems(Adm_ItemsVO vo){
		System.out.println("itemsDaoimpl listdiscountItems 도착");
		
		List<Adm_ItemsVO> list = sqlSession.selectList("dao.ItemsDao.getItemsdiscountList", vo);
		System.out.println(list);
				
		System.out.println("itemsDaoimpl listdiscountItems 출발");
		
		return list;

	}
	
	public Adm_ItemsVO detailItem(Adm_ItemsVO id){
		System.out.println("itemsDaoimpl detailItems 도착");
		
		Adm_ItemsVO list = sqlSession.selectOne("dao.ItemsDao.getdetailItem", id);
		System.out.println("Received ID : "+list);
				
		System.out.println("itemsDaoimpl detailItems 출발");
		return list;
		
	}
	
	public List<Adm_ItemsVO> itemPic(Adm_ItemsVO id){
		System.out.println("itemsDaoimpl detailItems 도착");
		
		List<Adm_ItemsVO> list = sqlSession.selectList("dao.ItemsDao.getItempic", id);
		System.out.println("Received ID : "+list);
				
		System.out.println("itemsDaoimpl detailItems 출발");
		return list;
		
	}

}

package com.energyzo.javaproject.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Repository
public class SearchRepositoryImpl implements SearchRepository{

	@Autowired
	SqlSessionTemplate sqlsession;
	
	public List<EstateVO> searchListByAddr(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchListByAddr",vo);
	}
	public List<EstOptionVO> searchOptionListById(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchOptionListById",vo);
	}
	public List<EstateImgDTO> searchImgListById(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchImgListById",vo);
	}
	
}

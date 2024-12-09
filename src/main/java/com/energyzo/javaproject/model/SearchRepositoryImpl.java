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
	
	// 주소로 부동산 매물 리스트 검색
	public List<EstateVO> searchListByAddr(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchListByAddr",vo);
	}
	// id로 부동산 매물 검색
	public EstateVO searchListById(EstateVO vo){
		
		return sqlsession.selectOne("com.energyzo.javaproject.model.SearchRepository.searchListById",vo);
	}
	// id로 매물의 옵션 검색
	public List<EstOptionVO> searchOptionListById(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchOptionListById",vo);
	}
	// id로 매물의 이미지 검색
	public List<EstateImgDTO> searchImgListById(EstateVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchImgListById",vo);
	}
	
}

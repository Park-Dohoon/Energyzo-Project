package com.energyzo.javaproject.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Repository
public class SearchRepositoryImpl implements SearchRepository{

	@Autowired
	SqlSessionTemplate sqlsession;
	
	// 주소로 부동산 매물 리스트 검색
	public List<EstateVO> searchListByAddr(EstSearchDTO vo){
		
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
	// 판매자 정보 검색
	public Adm_SalesVO getAgentInfoById(Adm_SalesVO vo) {
		
		return sqlsession.selectOne("com.energyzo.javaproject.model.SearchRepository.getAgentInfoById",vo);
	}
	// 판매자 유저 아이디로 정보 검색
	public Adm_SalesVO getAgentInfoByUserId(Adm_SalesVO vo) {
		return sqlsession.selectOne("com.energyzo.javaproject.model.SearchRepository.getAgentInfoByUserId",vo);
	}
	// 판매자 id로 매물 검색
	public List<Adm_SalesVO> searchListByAgentId(Adm_SalesVO vo){
		
		return sqlsession.selectList("com.energyzo.javaproject.model.SearchRepository.searchListByAgentId",vo);
	}
}

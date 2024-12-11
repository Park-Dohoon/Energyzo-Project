package com.energyzo.javaproject.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Repository
public class SellerRepositoryImpl implements SellerRepository{
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	public void insertOneItem(EstateVO vo) {
		sqlsession.insert("com.energyzo.javaproject.model.SellerRepository.insertOneItem", vo);
	}
	
	public EstateVO searchLastEstId() {
		
		return sqlsession.selectOne("com.energyzo.javaproject.model.SellerRepository.searchLastEstId");
	}
	
	public void insertOneItemImage(EstateImgDTO dto) {
		
		sqlsession.insert("com.energyzo.javaproject.model.SellerRepository.insertOneItemImage", dto);
		
	}
	
	public void insertOption(EstOptionVO vo) {
		sqlsession.insert("com.energyzo.javaproject.model.SellerRepository.insertOption", vo);
	}
	
	public EstateVO updateItem(EstateVO vo) {
		return sqlsession.selectOne("com.energyzo.javaproject.model.SellerRepository.updateItem", vo);
 
	}
	
	public void deleteOptions(Integer est_id) {
	    sqlsession.delete("com.energyzo.javaproject.model.SellerRepository.deleteOptions", est_id);
	}
	
	public void updateCompletionDate(Integer est_id) {
		sqlsession.update("com.energyzo.javaproject.model.SellerRepository.updateCompletionDate", est_id);
	}
}

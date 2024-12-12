package com.energyzo.javaproject.service;

import com.energyzo.javaproject.model.vo.EstateVO;

public interface SellerService {

	public Boolean isValidAgent(EstateVO vo);
	// 상품 정보 DB 입력
	public EstateVO insertOneItem(EstateVO vo);
	
	public EstateVO updateItem(EstateVO VO);
	
	public void updateOpt(EstateVO vo);
	
	public void updateCompletionDate(Integer est_id);
	
}

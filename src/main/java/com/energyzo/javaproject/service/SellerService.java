package com.energyzo.javaproject.service;

import com.energyzo.javaproject.model.vo.EstateVO;

public interface SellerService {

	// 상품 정보 DB 입력
	public EstateVO insertOneItem(EstateVO vo);
	
}

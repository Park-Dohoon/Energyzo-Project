package com.energyzo.javaproject.model;

import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

public interface SellerRepository {
	
	public void insertOneItem(EstateVO vo);
	
	public EstateVO searchLastEstId();
	
	public void insertOneItemImage(EstateImgDTO vo);
	
}

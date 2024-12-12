package com.energyzo.javaproject.model;

import com.energyzo.javaproject.model.vo.AgentVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

public interface SellerRepository {
	
	// 판매자 코드 검증
	public AgentVO isValidAgent(EstateVO vo);
	
	public void insertOneItem(EstateVO vo);
	
	public EstateVO searchLastEstId();
	
	public void insertOneItemImage(EstateImgDTO vo);
	
	public void insertOption(EstOptionVO vo);
	
	public EstateVO updateItem(EstateVO vo);

	public void deleteOptions(Integer est_id);
	
	public void updateCompletionDate(Integer est_id);
	
}

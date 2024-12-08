package com.energyzo.javaproject.model;

import java.util.List;

import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

public interface SearchRepository {
	
	public List<EstateVO> searchListByAddr(EstSearchDTO vo);
	
	public EstateVO searchListById(EstateVO vo);
	
	public List<EstOptionVO> searchOptionListById(EstateVO vo);
	
	public List<EstateImgDTO> searchImgListById(EstateVO vo);
	
}

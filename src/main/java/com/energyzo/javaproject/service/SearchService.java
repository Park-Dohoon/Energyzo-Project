package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

public interface SearchService {
	
	public List<EstateVO> searchListByAddr(EstSearchDTO vo);
	
	public EstateVO searchListById(EstateVO vo);
	
}

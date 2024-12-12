package com.energyzo.javaproject.model;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

public interface SearchRepository {
	
	public List<EstateVO> searchListByAddr(EstSearchDTO vo);
	
	public EstateVO searchListById(EstateVO vo);
	
	public List<EstOptionVO> searchOptionListById(EstateVO vo);
	
	public List<EstateImgDTO> searchImgListById(EstateVO vo);
	
	public Adm_SalesVO getAgentInfoById(Adm_SalesVO vo);
	
	public Adm_SalesVO getAgentInfoByUserId(Adm_SalesVO vo);
	
	public List<Adm_SalesVO> searchListByAgentId(Adm_SalesVO vo);
}

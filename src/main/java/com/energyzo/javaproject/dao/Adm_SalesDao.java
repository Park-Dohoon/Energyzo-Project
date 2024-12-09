package com.energyzo.javaproject.dao;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;

public interface Adm_SalesDao {

	public List<Adm_SalesVO> listallSales(Adm_SalesVO vo);
	
	public List<Adm_SalesVO> listSalesApply(Adm_SalesVO vo);
	
	
}

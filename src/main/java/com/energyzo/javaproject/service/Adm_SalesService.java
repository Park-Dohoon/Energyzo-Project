package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;

public interface Adm_SalesService {
	
	List<Adm_SalesVO> listallSales(Adm_SalesVO vo);
	
	List<Adm_SalesVO> listSalesApply(Adm_SalesVO vo);
	
	

}

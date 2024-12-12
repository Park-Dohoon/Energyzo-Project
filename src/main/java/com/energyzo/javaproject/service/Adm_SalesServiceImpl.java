package com.energyzo.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_SalesDaoImpl;
import com.energyzo.javaproject.model.vo.Adm_SalesVO;

@Service("salesService")
public class Adm_SalesServiceImpl implements Adm_SalesService{

	@Autowired
	private Adm_SalesDaoImpl salesDAO;
	
	public List<Adm_SalesVO> listallSales(Adm_SalesVO vo){
		System.out.println("salesserviceimpl 진입");
		List<Adm_SalesVO> list = salesDAO.listallSales(vo);
		System.out.println("salesserviceimpl 아웃");
		return list;
	}
	
	
	public List<Adm_SalesVO> listSalesApply(Adm_SalesVO vo){
		System.out.println("salesserviceimpl 진입");
		List<Adm_SalesVO> list = salesDAO.listSalesApply(vo);
		System.out.println("salesserviceimpl 아웃");
		return list;
	}
	
	public Adm_SalesVO detailSalesApply(Adm_SalesVO id) {
		System.out.println("salesserviceimpl detailSalesApply 진입");
		Adm_SalesVO list = salesDAO.detailSalesApply(id);
		
		System.out.println("salesserviceimpl detailSalesApply 아웃");
		return list;
	}
	
}

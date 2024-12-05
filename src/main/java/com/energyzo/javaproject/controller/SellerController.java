package com.energyzo.javaproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.SellerService;


@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	SellerService service;
	
	@RequestMapping("seller_productdetail.do")
	public String seller_productdetail() {
		
		return "seller/seller_productdetail";
	}
	@RequestMapping("seller_productinsert.do")
	public String seller_productinsert() {
		
		return "seller/seller_productinsert";
	}
	
	@RequestMapping("regist_item.do")
	public String regist_item(EstateVO vo, Model m) {
		
		vo = service.insertOneItem(vo);
		
		m.addAttribute("item", vo);
		
		return "seller/seller_productdetail";
	}
}

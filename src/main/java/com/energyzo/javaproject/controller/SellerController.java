package com.energyzo.javaproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.SearchService;
import com.energyzo.javaproject.service.SellerService;


@Controller
public class SellerController {
   
   @Autowired
   SellerService service;
   @Autowired
   SearchService searchService;
   
   @RequestMapping("seller/seller_productdetail.do")
   public String seller_productdetail(EstateVO vo, Model m) {
      
	  EstateVO result = searchService.searchListById(vo);
      m.addAttribute("item", result);
      System.out.println(result.toString());
      return "seller/seller_productdetail";
   }
   
   
   
   @RequestMapping("seller/seller_productinsert.do")
   public String seller_productinsert() {
      
      return "seller/seller_productinsert";
   }

   
   @RequestMapping("/seller/regist_item.do")
   public String regist_item(EstateVO vo, Model m) {
      
	   System.out.println("regist_item 요청");
	   
      vo = service.insertOneItem(vo);
      
      EstateVO result = searchService.searchListById(vo);
      
      m.addAttribute("item", result);
      
      return "redirect:/productmanagement.do";
      
   }
}

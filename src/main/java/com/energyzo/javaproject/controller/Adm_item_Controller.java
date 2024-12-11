package com.energyzo.javaproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.Adm_ItemsService;


@Controller
public class Adm_item_Controller {


	
	//$$$$$$$$$$$$$$$$$$$$$$$$$$
	//		상품관리
	//$$$$$$$$$$$$$$$$$$$$$$$$$$


@Autowired
private Adm_ItemsService itemsService;

@GetMapping("adm_item_all.do")
public String adm_item_all(Adm_ItemsVO vo, Model model) {
	System.out.println("adm_item_all 진입");
	//상품관리-전체상품
	List<Adm_ItemsVO> list = itemsService.listallItems(vo);
	model.addAttribute("listAllItems",list);

	System.out.println("adm_item_all 아웃");
	return ("/adm/item/adm_item_all");
}


@GetMapping("adm_item_complain.do")
public String adm_item_complain(Adm_ItemsVO vo, Model model) {
	System.out.println("controller arrived");
	//상품관리-신고내역
	List<Adm_ItemsVO> list = itemsService.listaccuseItems(vo);
	model.addAttribute("listaccuseItem", list);
	System.out.println("controller departed");
	return ("/adm/item/adm_item_complain");
}


@GetMapping("adm_item_discount")
public String adm_item_discount(Adm_ItemsVO vo, Model model) {
	System.out.println("controller adm_item_discount 도착");
	//상품관리-할인가요청
	List<Adm_ItemsVO> list = itemsService.listdiscountItems(vo);
	model.addAttribute("listdiscountItems", list);
	
	
	System.out.println("controller adm_item_discount 출발");
	return ("/adm/item/adm_item_discount");
}


@GetMapping("adm_item_update")
public String adm_item_update(Adm_ItemsVO vo) {
	System.out.println("controller adm_item_update 도착");
	
	System.out.println("controller adm_item_update 출발");
	return ("/adm/item/adm_item_all");
}

@PostMapping("adm_item_detail")
public String adm_item_detail() {
	//상품관리-세부정보
	return ("/adm/item/productdetail");
}


//상품 상세 보기
@GetMapping("adm_item_all_Detail")
public String adm_item_all_Detail(@RequestParam("id") String id, Model model) {
	System.out.println("adm_item_all_Detail 진입");
	System.out.println("Received ID: " + id);
	//상품관리-전체상품
	//List<Adm_ItemsVO> list = itemsService.listallItems(vo);
	Adm_ItemsVO param=new Adm_ItemsVO();
	
	param.setId(id);
	
	
	Adm_ItemsVO list = itemsService.detailItem(param);
	model.addAttribute("item", list);
    System.out.println(list);
    System.out.println("controller adm_item_all_Detail 아웃");
    
    System.out.println("controller adm_item_pic 진입");
    System.out.println("received ID : "+id);
    System.out.println(param);
    List<Adm_ItemsVO> piclist = itemsService.itemPic(param);
    model.addAttribute("itempic", piclist);
    System.out.println(piclist);
	System.out.println("controller adm_item_pic 아웃");
	
	return ("/adm/item/detail/adm_item_all_Detail");
	//return ("/adm/item/detail/seller_productdetail");
}





}

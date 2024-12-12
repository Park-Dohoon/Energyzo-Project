package com.energyzo.javaproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
      
	   if(service.isValidAgent(vo)) {
	   
	      vo = service.insertOneItem(vo);
	      
	      EstateVO result = searchService.searchListById(vo);
	      m.addAttribute("item", result);
	      
	  
	   } 
	   return "redirect:/productmanagement.do";
   }

   @PostMapping("seller/updateItem.do")
   public String update_item(
           @RequestParam Integer est_id,
           @RequestParam Integer agent_num,
           @RequestParam String est_type,
           @RequestParam String est_tra_type,
           @RequestParam Integer est_tra_cond,
           @RequestParam String est_addr,
           @RequestParam Integer est_m_area,
           @RequestParam Integer est_m_floor,
           @RequestParam Integer est_jungong,
           @RequestParam(required = false) String file1,  // 파일은 선택적일 수 있으므로 required = false 추가
           @RequestParam(required = false) String file2,
           @RequestParam(required = false) String file3,
           @RequestParam(required = false) String file4,
           @RequestParam(required = false) String file5,
           @RequestParam(required = false) String file6,
           @RequestParam(required = false, defaultValue = "false") Boolean isSold, // 판매완료 값
           @RequestParam String tagArray, Model m) {

       // EstateVO 객체 생성
       EstateVO vo = new EstateVO();
       vo.setEst_id(est_id);           // 상품번호 설정
       vo.setAgent_num(agent_num);     // 중개인 번호 설정
       vo.setEst_type(est_type);       // 부동산 유형 설정
       vo.setEst_tra_type(est_tra_type); // 거래유형 설정
       vo.setEst_tra_cond(est_tra_cond); // 가격(보증금) 설정
       vo.setEst_addr(est_addr);       // 주소 설정
       vo.setEst_m_area(est_m_area);  // 관리면적 설정
       vo.setEst_m_floor(est_m_floor); // 관리층 설정
       vo.setEst_jungong(est_jungong); // 준공일자 설정
       vo.setTagArray(tagArray);       // 태그 정보 설정
      // System.out.println("tagArray 값: " + tagArray); 
       
       //estate테이블로 업데이트
       service.updateItem(vo);
       service.updateOpt(vo);
       
       
       if (isSold) {
           service.updateCompletionDate(est_id); // 판매완료 처리
       }
       
       
       System.out.println("업데이트된 데이터: " + vo); // 확인용
       
       
       return "redirect:/productmanagement.do";
   }


   
}

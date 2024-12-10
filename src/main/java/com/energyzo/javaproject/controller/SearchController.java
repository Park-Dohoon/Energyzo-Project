package com.energyzo.javaproject.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;
import com.energyzo.javaproject.model.vo.EstSearchDTO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	SearchService service;
	
	// 검색 메인페이지 이동
	@RequestMapping("searchmain.do")
	public String searchMain(EstSearchDTO vo, Model m) {
		
		// 지역별 상품목록 받아오기
		m.addAttribute("itemList", service.searchListByAddr(vo) );
		
		return "search/searchmain";
	}
	
	// 검색 메인 ajax : 매물 목록 검색
	@ResponseBody
	@RequestMapping("searchPropertyByAddr.do")
	public List<EstateVO> searchPropertyByAddr(EstSearchDTO temp) {
		
		EstateVO vo = new EstateVO();
		
		List<EstateVO> result = service.searchListByAddr(temp); 
		
		return result;
	}
	
	// 상세보기 페이지 이동
	@RequestMapping("searchinfo.do")
	public String searchInfo(EstateVO vo, Model m) {
		
		EstateVO result = service.searchListById(vo);
		m.addAttribute("item", result);
		
		return "search/searchinfo";
	}
	
	// 체크리스트 페이지 이동
	@RequestMapping("searchCheckList.do")
	public String searchCheckList(Adm_SalesVO vo, Model m){
		
		m.addAttribute("agent", vo);
		
		return "search/searchCheckList";
	}
	
	// 판매자 상세정보 보기 페이지 이동
	@RequestMapping("searchSellerInfo.do")
	public String searchSellerInfo(Adm_SalesVO vo, Model m){
		
		vo = service.getAgentInfoById(vo);
		System.out.println( vo.toString() );
		m.addAttribute("agent", vo);
		
		List<Adm_SalesVO> estate = service.searchListByAgentId(vo);
		m.addAttribute("estate", estate);
		
		return "search/searchSellerInfo";
	}
	
	// 서울시 부동산 api
	@ResponseBody
	@RequestMapping(value="seoulProperty", method = { RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String seoulProperty(@RequestParam("cgg_cd") String cgg_cd) {
		
		BufferedReader br = null;
		
		String urlstr 	= "http://openapi.seoul.go.kr:8088"
						+ "/6d75715a6873616539347a66466b58/json/tbLnOpendataRtmsV/1/9/"
						+ "2024/"
						+ cgg_cd + "/"; 
		
		String result = "";
		
		try {
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			String line;
			while( (line = br.readLine()) != null) {
				result += result + line + "\n";
			}
			//System.out.println(result);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		// api로 받은 정보 넘겨주기
		return result;
	}
	
}

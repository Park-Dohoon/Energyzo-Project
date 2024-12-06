package com.energyzo.javaproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.SearchRepository;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchRepository repo;
	
	public List<EstateVO> searchListByAddr(EstateVO vo){
		
		List<EstateVO> result = repo.searchListByAddr(vo);
		List<EstateVO> returnList = new ArrayList<EstateVO>();
		
		for(EstateVO temp : result) {
			
			// 이미지 정보 얻오오기
			List<EstateImgDTO> imgVO = repo.searchImgListById(temp);
			// vo에 이미지 정보 세팅
			if(!imgVO.isEmpty()) {
				if( (imgVO.size()>0) ) {
					if (imgVO.get(0) != null) {
						temp.setFname1		(imgVO.get(0).getFname());
						temp.setRealfname1	(imgVO.get(0).getRealfname());
					}
				}
				if( (imgVO.size()>1) ) {
					if (imgVO.get(1) != null) {
						temp.setFname2		(imgVO.get(1).getFname());
						temp.setRealfname2	(imgVO.get(1).getRealfname());
					}
				}
				if( (imgVO.size()>2)) {
					if (imgVO.get(2) != null) {
						temp.setFname3		(imgVO.get(2).getFname());
						temp.setRealfname3	(imgVO.get(2).getRealfname());
					}
				}
				if( (imgVO.size()>3) ) {
					if (imgVO.get(3) != null) {
						temp.setFname4		(imgVO.get(3).getFname());
						temp.setRealfname4	(imgVO.get(3).getRealfname());
					}
				}
				if( (imgVO.size()>4) ) {
					if (imgVO.get(4) != null) {
						temp.setFname5		(imgVO.get(4).getFname());
						temp.setRealfname5	(imgVO.get(4).getRealfname());
					}
				}
				if( (imgVO.size()>5)) {
					if (imgVO.get(5) != null) {
						temp.setFname6		(imgVO.get(5).getFname());
						temp.setRealfname6	(imgVO.get(5).getRealfname());
					}
				}
			}
			
			
			// 옵션 정보 얻어오기
			List<EstOptionVO> optionVO = repo.searchOptionListById(temp);
			// 옵션정보를 뽑아내 한 스트링으로 합치기
			String tagArray="";
			for(EstOptionVO optionTemp :  optionVO ) {
				tagArray += optionTemp.getEst_opt_name()+" ";
			}
			// 양끝 공백 제거 후 태그를 vo에 세팅 
			tagArray = tagArray.trim();
			if(!tagArray.isBlank()) {
				temp.setTagArray(tagArray);
			}
			
			
			// 세팅된 vo를 list에 할당
			returnList.add(temp);
		}
		 
		
		return returnList;
	}
}

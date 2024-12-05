package com.energyzo.javaproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.SellerRepository;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	SellerRepository repo;
	
	
	// 상품입력
	public EstateVO insertOneItem(EstateVO vo) {
		
		// 1. 상품정보 저장(이미지 제외)
		repo.insertOneItem(vo);
		
		
		// 2. id 얻어와 세팅
		vo.setEst_id(repo.searchLastEstId().getEst_id());
		
		
		// 3. 이미지 저장
		EstateImgDTO dto1 = new EstateImgDTO();
		EstateImgDTO dto2 = new EstateImgDTO();
		EstateImgDTO dto3 = new EstateImgDTO();
		EstateImgDTO dto4 = new EstateImgDTO();
		EstateImgDTO dto5 = new EstateImgDTO();
		EstateImgDTO dto6 = new EstateImgDTO();

		// 1번파일 입력
		if(vo.getFile1() != null) {
			dto1.setEst_id		(vo.getEst_id());
			dto1.setFname		(vo.getFname1());
			dto1.setRealfname	(vo.getRealfname1());
			
			repo.insertOneItemImage(dto1);
		}

		// 2번파일 입력
		if(vo.getFname2() != null) {
			dto2.setEst_id		(vo.getEst_id());
			dto2.setFname		(vo.getFname2());
			dto2.setRealfname	(vo.getRealfname2());
			
			repo.insertOneItemImage(dto2);
		}

		// 3번파일 입력
		if(vo.getFname3() != null) {
			dto3.setEst_id		(vo.getEst_id());
			dto3.setFname		(vo.getFname3());
			dto3.setRealfname	(vo.getRealfname3());
			
			repo.insertOneItemImage(dto3);
		}

		// 4번파일 입력
		if(vo.getFname4() != null) {
			dto4.setEst_id		(vo.getEst_id());
			dto4.setFname		(vo.getFname4());
			dto4.setRealfname	(vo.getRealfname4());
			
			repo.insertOneItemImage(dto4);
		}

		// 5번파일 입력
		if(vo.getFname5() != null) {
			dto5.setEst_id		(vo.getEst_id());
			dto5.setFname		(vo.getFname5());
			dto5.setRealfname	(vo.getRealfname5());
			
			repo.insertOneItemImage(dto5);
		}

		// 6번파일 입력
		if(vo.getFname6() != null) {
			dto6.setEst_id		(vo.getEst_id());
			dto6.setFname		(vo.getFname6());
			dto6.setRealfname	(vo.getRealfname6());
			
			repo.insertOneItemImage(dto6);
		}
		
		
		return vo;
	}
	
}

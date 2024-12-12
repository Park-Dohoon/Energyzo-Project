package com.energyzo.javaproject.service;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.SellerRepository;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstateImgDTO;
import com.energyzo.javaproject.model.vo.EstateVO;

@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	SellerRepository repo;
	
	// 판매자 코드 검증
	public Boolean isValidAgent(EstateVO vo) {
		
		if (repo.isValidAgent(vo) == null) {
			return false;
		} else {
			return true;
		}
		
		 
	}
	
	// 상품입력
	public EstateVO insertOneItem(EstateVO vo) {
		
		// 1. 상품정보 저장(이미지 제외)
		repo.insertOneItem(vo);
		
		
		// 2. id 얻어와 세팅
		vo.setEst_id(repo.searchLastEstId().getEst_id());
		
		
		// 3. 이미지 저장
		// 객체생성
		EstateImgDTO dto1 = new EstateImgDTO();
		EstateImgDTO dto2 = new EstateImgDTO();
		EstateImgDTO dto3 = new EstateImgDTO();
		EstateImgDTO dto4 = new EstateImgDTO();
		EstateImgDTO dto5 = new EstateImgDTO();
		EstateImgDTO dto6 = new EstateImgDTO();
		//데이터 입력
		// 1번파일 입력
		if(vo.getFname1() != null) {
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
		
		
		// 4. 옵션 저장
		// 스트링을 옵션별로 분리 
		StringTokenizer st = new StringTokenizer(vo.getTagArray());
		// 하나씩 DB입력
		while(st.hasMoreTokens()) {
			EstOptionVO taginput = new EstOptionVO();
			
			taginput.setEst_id		(vo.getEst_id());
			taginput.setEst_opt_name(st.nextToken());
			
			repo.insertOption(taginput);
			
		}
		
		
		return vo;
	}
	
	public EstateVO updateItem(EstateVO vo) {
		return repo.updateItem(vo); 
	}
	
	
	public void updateOpt(EstateVO vo) {
	    // 기존 옵션 삭제
	    repo.deleteOptions(vo.getEst_id());

	    // 새로운 옵션 추가
	    StringTokenizer st = new StringTokenizer(vo.getTagArray());
	    while(st.hasMoreTokens()) {
	        EstOptionVO taginput = new EstOptionVO();
	        taginput.setEst_id(vo.getEst_id());
	        taginput.setEst_opt_name(st.nextToken());  // 새로운 태그를 하나씩 처리
	        repo.insertOption(taginput);  // 새 옵션 DB에 추가
	    }
	}
	
	public void updateCompletionDate(Integer est_id) {

		repo.updateCompletionDate(est_id);
	}

}

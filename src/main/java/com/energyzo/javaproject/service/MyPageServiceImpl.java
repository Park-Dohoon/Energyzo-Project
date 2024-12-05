package com.energyzo.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.MypageRepository;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;

// [1]
@Service
public class MyPageServiceImpl implements MypageService{

	// [2]
	@Autowired
	private MypageRepository mypageRepository;
	
	public List<UserVO> getUserList() {
		// [2-1]  레포지토리의 해당함수 호출하고 그 리턴값을 받아 다시 리턴한다
		
		
		return mypageRepository.getUserList();			
	}
	
	  public boolean updateUserProfile(UserVO userVO) {
		  System.out.println("===> service() 호출");
		  return mypageRepository.updateUserProfile(userVO);
	  }
	  
	 public List<WishlistVO> getWishlist() {
		 
		 return mypageRepository.getWishlist();
	 }
	  
	 
	public List<PointVO> getPointlist(){
		return mypageRepository.getPointlist();
	}
	
	public EstateVO getEstatelist(int est_id){
		return mypageRepository.getEstatelist(est_id); 
	}


	public EstPicVO getEstpic(int est_id) {
		return mypageRepository.getEstpic(est_id);
	}
	
	
	public List<EstPicVO> getSubPicsByEstId(int est_id){
		return mypageRepository.getSubPicsByEstId(est_id);
	}
	
	public List<EstOptionVO> getEstOptionsByEstId(int est_id){
		return mypageRepository.getEstOptionsByEstId(est_id);
	}
	
}

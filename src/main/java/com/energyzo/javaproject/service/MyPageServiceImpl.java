package com.energyzo.javaproject.service;

import java.util.List;

import org.aspectj.lang.annotation.AfterReturning;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.MypageRepository;
import com.energyzo.javaproject.model.vo.AgentVO;
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

		return mypageRepository.getUserList();			
	}
	
	public UserVO getUser(String user_id) {
		
		  return mypageRepository.getUser(user_id);
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
	
	public void saveAgent(AgentVO agentVO) {
		mypageRepository.insertAgent(agentVO);
	}

	public boolean verifyPassword(UserVO user, String currentPassword) {
	     return user.getPassword().equals(currentPassword);
	}
	
	public boolean updatePassword(String user_id, String newPassword) { 
	       System.out.println("서비스에서 넘어온 userId: " + user_id);
	        System.out.println("서비스에서 넘어온 newPassword: " + newPassword);
	    // 비밀번호 업데이트를 위한 호출
	    return mypageRepository.updateUserPassword(user_id, newPassword);
	}

	public AgentVO getAgent(String user_id) {
		return mypageRepository.getAgent(user_id); 
	}

	public List<PointVO> getPaymentlist(String user_id){
		return mypageRepository.getPaymentlist(user_id); 
	}
	
	public void insertPayment(PointVO pointVO) {
		mypageRepository.insertPayment(pointVO);
	} 

	public void updateAgentPointDate(AgentVO agent) {
		mypageRepository.updateAgentPointDate(agent); 
	}
	
	public PointVO getPayment(String user_id) {
		return mypageRepository.getPayment(user_id);
	}
	
	public List<EstateVO> getEstate(String user_id) {
		return mypageRepository.getEstate(user_id);
	}

}

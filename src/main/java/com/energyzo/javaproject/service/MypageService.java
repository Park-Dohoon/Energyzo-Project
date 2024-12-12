package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.AgentVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;


public interface MypageService {
	public List<UserVO> getUserList();
	
	public UserVO getUser(String user_id);
	
	public boolean updateUserProfile(UserVO userVO);
	
	public List<WishlistVO> getWishlist();
	
    public void addPoint(PointVO point);
	
	public List<PointVO> getPointlist(String user_id);	
	
	public EstateVO getEstatelist(int est_id);
	
	public EstPicVO getEstpic(int est_id);
	
	public List<EstPicVO> getSubPicsByEstId(int est_id);
	
	public List<EstOptionVO> getEstOptionsByEstId(int est_id);	
	
	public void saveAgent(AgentVO agentVO);
	
	//현재 비밀번호 확인 
	public boolean verifyPassword(UserVO user, String currentPassword);

	//비밀번호 업데이트
	public boolean updatePassword(String user_id, String newPassword);

	public AgentVO getAgent(String user_id);
	
	//파워링크 결제 내역
	public List<PointVO> getPaymentlist(String user_id);
	
	//포인트 결제 저장
	public void insertPayment(PointVO pointVO);
	
	public void updateAgentPointDate(AgentVO agent);
	
	public PointVO getPayment(String user_id);
	
	//등록 상품 목록 가지고 오기 
	public List<EstateVO> getEstate(String user_id);
}

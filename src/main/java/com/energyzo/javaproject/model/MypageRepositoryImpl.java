package com.energyzo.javaproject.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.AgentVO;
import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;

// [1]
@Repository
public class MypageRepositoryImpl implements MypageRepository{

	// [2]
	@Autowired
	SqlSessionTemplate sqlsession;
	
	
	public List<UserVO> getUserList() {
	
		// [확인] 여기서 디비값을 출력해 본다
		System.out.println("===> Mybatis getUserList() 호출");
		List<UserVO> userList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getUserList");

	//		 for (UserVO user : userList) {
//	            System.out.println("User Name: " + user.getName());
//	            System.out.println("Nickname: " + user.getNick_name());
//	            System.out.println("User ID: " + user.getUser_id());
//	            System.out.println("Mobile: " + user.getMobile());
//	            System.out.println("Birth: " + user.getBirth());
//	            System.out.println("Address: " + user.getAddress());
//	            System.out.println("-------------------------------");
//	        }
//		
		return userList;

	}
	
	public UserVO getUser(String user_id) {
		System.out.println("===> Mybatis getUser() 호출 : " + user_id);
		UserVO vo = sqlsession.selectOne("com.energyzo.javaproject.model.MypageRepository.getUser", user_id);
		System.out.println("===> Mybatis getUser() 호출 : " + vo);
		return vo;
	}
	
	
	public boolean updateUserProfile(UserVO userVO) {
		System.out.println("===> Mybatis updateUserProfile() 호출");
	    return sqlsession.update("com.energyzo.javaproject.model.MypageRepository.updateUserProfile", userVO) > 0;
	}

	
	public List<WishlistVO> getWishlist(){
		
		
		// [확인] 여기서 디비값을 출력해 본다
		System.out.println("===> Mybatis getWishlist() 호출");
		List<WishlistVO> WishList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getWishlist");

		//for로 확인
		/*
		 * for (WishlistVO Wish : WishList) { System.out.println("Est_id: " +
		 * Wish.getEst_id()); System.out.println("-------------------------------"); }
		 */
		
		return WishList;
	}
	
	
    public void addPoint(PointVO point) {
		System.out.println("===> Mybatis addPoint() 호출");
		sqlsession.insert("com.energyzo.javaproject.model.MypageRepository.addPoint", point);
    }
	
	
	public List<PointVO> getPointlist(String user_id){
		
		System.out.println("===> Mybatis getPointlist() 호출");
		List<PointVO> PointList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getPointlist", user_id);
		
		//for로 확인
		 for (PointVO point : PointList) {
	            System.out.println("point_num: " + point.getPoint_num());
	            System.out.println("user_id: " + point.getUser_id());
	            System.out.println("point_pt: " + point.getPoint_pt());
	            System.out.println("point_source: " + point.getPoint_source());
	            System.out.println("pointdate: " + point.getPoint_date());
	            System.out.println("-------------------------------");
	        }
		
		return PointList;
	}
	
	
	public EstateVO getEstatelist(int est_id){
		
		System.out.println("===> Mybatis getEstatelist() 호출");
		EstateVO EstateList = sqlsession.selectOne("com.energyzo.javaproject.model.MypageRepository.getEstatelist", est_id);
		
		return EstateList;
		
	}
	
	public EstPicVO getEstpic(int est_id) {
		
		System.out.println("===> Mybatis getEstpic() 호출");
		EstPicVO getEstpic = sqlsession.selectOne("com.energyzo.javaproject.model.MypageRepository.getEstpic", est_id);
		
		return getEstpic;
		
	}
	
	public List<EstPicVO> getSubPicsByEstId(int est_id){
		System.out.println("===> Mybatis getSubPicsByEstId() 호출");
		List<EstPicVO> getSubPicsByEstId = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getSubPicsByEstId", est_id);
		
		return getSubPicsByEstId;
	}
	
	public List<EstOptionVO> getEstOptionsByEstId(int est_id){
		System.out.println("===> Mybatis getEstOptionsByEstId() 호출");
		List<EstOptionVO> getSubPicsByEstId = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getEstOptionsByEstId", est_id);
		
		return getSubPicsByEstId;
	}
	
	public void insertAgent(AgentVO agentVO) {
		System.out.println("===> Mybatis insertAgent() 호출");
		
	    // agentVO의 값을 출력해서 확인
	    System.out.println("AgentVO 값: ");
	    System.out.println("중개사무소명: " + agentVO.getAgent_office());
	    System.out.println("대표명: " + agentVO.getAgent_name());
	    System.out.println("중개등록번호: " + agentVO.getAgent_reg_num());
	    System.out.println("대표번호: " + agentVO.getAgent_tel());
	    System.out.println("소재지: " + agentVO.getAgent_addr());
	    System.out.println("첨부파일 이름: " + agentVO.getAgent_fname());
	    
		sqlsession.insert("com.energyzo.javaproject.model.MypageRepository.insertAgent",agentVO); //마이바티즈 쿼리 호출 
	}


	
	public boolean updateUserPassword(String user_id, String newPassword) {
	    System.out.println("===> Mybatis updateUserPassword() 호출");

	    HashMap<String, Object> params = new HashMap<>();
	    params.put("user_id", user_id); 
	    params.put("newPassword", newPassword);

	    // 업데이트 쿼리 실행, 성공 시 1 이상의 값 반환
	    return sqlsession.update("com.energyzo.javaproject.model.MypageRepository.updateUserPassword", params) > 0;
	}
	
	public AgentVO getAgent(String user_id) {
		
//		System.out.println("===> Mybatis getAgent() 호출");
//		AgentVO getAgent = sqlsession.selectOne("com.energyzo.javaproject.model.MypageRepository.getAgent", user_id);
		
	    System.out.println("===> Mybatis getAgent() 호출");
	    List<AgentVO> agentList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getAgent", user_id);
	    
	    if (agentList != null && !agentList.isEmpty()) {
	        return agentList.get(0);  // 첫 번째 항목을 반환
	    } else {
	        return null;  // 결과가 없을 경우
	    }		
		
		

	}

	public List<PointVO> getPaymentlist(String user_id){
		System.out.println("===> Mybatis getPaymentlist() 호출");
		List<PointVO> getPaymentlist = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getPaymentlist", user_id);
		
		return getPaymentlist;
	}
	
	public void insertPayment(PointVO pointVO) {
		sqlsession.insert("com.energyzo.javaproject.model.MypageRepository.insertPayment",pointVO);
	}

	public void updateAgentPointDate(AgentVO agentvo) {
		
	    System.out.println("Updating agent with user_id: " + agentvo.getUser_id());
	    System.out.println("New power_date: " + agentvo.getPower_date());
		sqlsession.update("com.energyzo.javaproject.model.MypageRepository.updateAgentPointDate",agentvo);
		
	}
	
	public PointVO getPayment(String user_id) {
		System.out.println("===> Mybatis getPayment() 호출");
		PointVO getPayment = sqlsession.selectOne("com.energyzo.javaproject.model.MypageRepository.getPayment", user_id);
		
		return getPayment;
	}
	
	public List<EstateVO> getEstate(String user_id) {
		System.out.println("===> Mybatis getEstate() 호출");
		List<EstateVO> getEstate = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getEstate", user_id);
		
		return getEstate;
	}
	
	
	
}

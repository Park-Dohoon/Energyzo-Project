package com.energyzo.javaproject.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	/* [2-1] Mapper에서 getCateList 아이디를 실행하여 List<CateVO>에 데이타를 가져와서 리턴한다. */
	public List<UserVO> getUserList() {
	
		// [확인] 여기서 디비값을 출력해 본다
		System.out.println("===> Mybatis getUserList() 호출");
		List<UserVO> userList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getUserList");

		
		//for로 확인
		 for (UserVO user : userList) {
	            System.out.println("User Name: " + user.getName());
	            System.out.println("Nickname: " + user.getNick_name());
	            System.out.println("User ID: " + user.getUser_id());
	            System.out.println("Mobile: " + user.getMobile());
	            System.out.println("Birth: " + user.getBirth());
	            System.out.println("Address: " + user.getAddress());
	            System.out.println("-------------------------------");
	        }
		
		return userList;

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
	
	public List<PointVO> getPointlist(){
		
		System.out.println("===> Mybatis getPointlist() 호출");
		List<PointVO> PointList = sqlsession.selectList("com.energyzo.javaproject.model.MypageRepository.getPointlist");
		
		//for로 확인
		 for (PointVO point : PointList) {
	            System.out.println("point_num: " + point.getPoint_num());
	            System.out.println("user_id: " + point.getUser_id());
	            System.out.println("point_pt: " + point.getPoint_pt());
	            System.out.println("point_source: " + point.getPoint_source());
	            System.out.println("pointdate: " + point.getPointdate());
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


}

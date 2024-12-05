package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.EstOptionVO;
import com.energyzo.javaproject.model.vo.EstPicVO;
import com.energyzo.javaproject.model.vo.EstateVO;
import com.energyzo.javaproject.model.vo.PointVO;
import com.energyzo.javaproject.model.vo.UserVO;
import com.energyzo.javaproject.model.vo.WishlistVO;


public interface MypageService {
	public List<UserVO> getUserList();
	
	public boolean updateUserProfile(UserVO userVO);
	
	public List<WishlistVO> getWishlist();
	
	public List<PointVO> getPointlist();
	
	public EstateVO getEstatelist(int est_id);
	
	public EstPicVO getEstpic(int est_id);
	
	public List<EstPicVO> getSubPicsByEstId(int est_id);
	
	public List<EstOptionVO> getEstOptionsByEstId(int est_id);

}

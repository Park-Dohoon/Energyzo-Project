package com.energyzo.javaproject.dao;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_UserVO;

public interface Adm_UserDao {
	
	public void insertUser(Adm_UserVO vo);
	
	public List<Adm_UserVO> listallUser(Adm_UserVO vo);
	
	public void updatePW(String id, String pw);
	
}

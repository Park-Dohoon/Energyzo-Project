package com.energyzo.javaproject.service;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_UserVO;

public interface Adm_UserService {

	//UserController와 일치
	
	void insertUser(Adm_UserVO vo);
	
	public List<Adm_UserVO> listallUser(Adm_UserVO vo); 

	public void updatePW(String id, String pw);
	
}

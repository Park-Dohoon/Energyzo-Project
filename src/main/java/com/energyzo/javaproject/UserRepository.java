package com.energyzo.javaproject;

import java.util.List;

import com.energyzo.javaproject.model.vo.Adm_UserVO;

public interface UserRepository {
	public List<Adm_UserVO> getUserList();

}

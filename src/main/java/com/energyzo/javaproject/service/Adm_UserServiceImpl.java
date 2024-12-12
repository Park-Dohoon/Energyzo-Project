package com.energyzo.javaproject.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.dao.Adm_UserDaoImpl;
import com.energyzo.javaproject.model.vo.Adm_UserVO;

@Service("userService")
public class Adm_UserServiceImpl implements Adm_UserService{


	@Autowired
	private Adm_UserDaoImpl userDAO;
	
	public void insertUser(Adm_UserVO vo) {
		System.out.println("UserServiceImpl도착");
		userDAO.insertUser(vo);
		System.out.println("UserServiceImpl출발");
	}
	
	public List<Adm_UserVO> listallUser(Adm_UserVO vo) {
		System.out.println("UserServiceImpl도착");
		List<Adm_UserVO> list = userDAO.listallUser(vo);							//UserDao의 함수값과 일치
		System.out.println("UserServiceImpl출발");
		return list;
	}
	
	public void updatePW(String id, String pw) {
		System.out.println("UserServiceImpl updatePW 도착");
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		userDAO.updatePW(id, pw);
		System.out.println("UserServiceImpl updatePW 출발");
	}


	
}

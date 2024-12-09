package com.energyzo.javaproject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_UserVO;

@Repository
public class Adm_UserDaoImpl implements Adm_UserDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertUser(Adm_UserVO vo) {
		System.out.println("UserDaoImpl 도착");
		sqlSession.insert("dao.UserDao.insertUser", vo); //UserMapper의 namespace와 일치 + id값 일치
		System.out.println("UserDaoImpl 출발");
	}
	
	
	public List<Adm_UserVO> listallUser(Adm_UserVO vo) {				//UserDao의 함수 값과 일치
		System.out.println("UserDaoImpl userlist 도착");
		List<Adm_UserVO> list = sqlSession.selectList("dao.UserDao.getUserList", vo); //UserMapper의 namespace와 일치 + id값 일치
		System.out.println("UserDaoImpl userlist 출발");
		return list;
	}	
	


}

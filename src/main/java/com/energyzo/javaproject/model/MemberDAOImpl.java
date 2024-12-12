package com.energyzo.javaproject.model;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.MemberVO;


	@Repository
	public class MemberDAOImpl implements MemberDAO{

		
		@Autowired
		private SqlSessionTemplate mybatis;

		
	    // 회원가입 처리
	    public int memberInsert(MemberVO vo) {
	    		    		    	
	    	System.out.println("===>  Mapper userInsert() 호출 :" +  vo.toString());	        	 	    	

	    	return mybatis.insert("user.memberInsert", vo);
	       
	    }	
		
	  //로그인
	    public MemberVO idcheck_Login(MemberVO vo) {
			System.out.println("===> MemberMapper idcheck_Login 호출");
			return mybatis.selectOne("user.idcheck_Login", vo); 
		}
	    
	    
	    //???? 확인하기
	    public MemberVO idcheck(MemberVO vo) {
			System.out.println("===> MemberMapper idcheck 호출");
			return mybatis.selectOne("user.idcheck", vo);
		}

	    //아이디 중복확인
	    public boolean isUserIdExist(String userId) {
	        int count = mybatis.selectOne("user.isUserIdExist", userId);  // 'mybatis' 사용
	        return count > 0;
	    }

	    
	    //닉네임 중복확인
		public boolean isUserNickExist(String nickName) {
			int count = mybatis.selectOne("user.isUserNickExist", nickName);
			return count > 0;
		}
		
		
		//아이디 비밀번호 찾기 메서드
		 public MemberVO findByEmail(String email) {
				System.out.println("===> MemberMapper findByEmail 호출");
				return mybatis.selectOne("user.findByEmail", email);
			}

		
		
	}
	
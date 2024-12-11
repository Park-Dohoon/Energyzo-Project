package com.energyzo.javaproject.model;


import com.energyzo.javaproject.model.vo.MemberVO;


public interface MemberDAO {

	// 회원가입 
	int memberInsert(MemberVO vo);

	
	//뭔지 모르겠지만 지우면 로그인 깨짐
	MemberVO idcheck_Login(MemberVO vo);
					
	
	//로그인 확인 기능
	MemberVO idcheck (MemberVO vo);

	//아이디 중복확인
	boolean isUserIdExist(String userId);

	//닉네임 중복확인
	boolean isUserNickExist(String nickName);

    //아이디 비번찾기용도 
	MemberVO findByEmail(String email);

	
	
	

	

	
	
	
}

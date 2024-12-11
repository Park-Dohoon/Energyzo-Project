package com.energyzo.javaproject.service;

import com.energyzo.javaproject.model.vo.MemberVO;


public interface MemberService {

	//회원가입
	public int memberInsert(MemberVO vo);

	//로그인
	public MemberVO idcheck_Login(MemberVO vo);

	
	//아이디 중복확인
	public boolean checkUserIdExist(String userId);

	//닉네임 중복확인
	public boolean checkUserNickExist(String nickName);

	//아이디랑 비번 찾을때 이메일 써서 찾을때
	public MemberVO findIdByEmail(String email);

	



	


	
	
	


	
}


	


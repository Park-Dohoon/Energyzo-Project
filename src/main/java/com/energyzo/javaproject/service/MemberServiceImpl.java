package com.energyzo.javaproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energyzo.javaproject.model.MemberDAO;  // 인터페이스만 주입받습니다.
import com.energyzo.javaproject.model.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;  // MemberDAO 인터페이스를 주입받습니다.

    @Override
    public int memberInsert(MemberVO vo) {
        return memberDAO.memberInsert(vo);  // MemberDAOImpl의 memberInsert 호출
    }

    @Override
    public MemberVO idcheck_Login(MemberVO vo) {
        return memberDAO.idcheck_Login(vo);  // MemberDAOImpl의 idCheck 호출
    }

    //아이디 중복확인
    public boolean checkUserIdExist(String userId) {
        return memberDAO.isUserIdExist(userId);  // DAO에서 중복 여부 확인
    }
    
    //닉네임 중복확인
    public boolean checkUserNickExist(String nickName) {
        return memberDAO.isUserNickExist(nickName);  // DAO에서 중복 여부 확인
    }
    
    //아이디찾기 메서드 
    public MemberVO findIdByEmail(String email) {
        return memberDAO.findByEmail(email);  // 이메일로 사용자 정보 조회
    }

   
    
    
}

package com.energyzo.javaproject.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.model.MemberDAOImpl;
import com.energyzo.javaproject.model.vo.MemberVO;


@Controller
public class UserController {

	@Autowired
	 private MemberDAOImpl memberDAO; 
	
	
	
	
	//아이디 중복확인
 	@PostMapping("/check-id")
    @ResponseBody //ajax 통신시에만 사용(얘를 쓰면 리턴값이 값으로 들어감=객체로 전달된다 주소가 아닌 그자체로 돌아감)
    public Map<String, Object> checkUserIdExist(MemberVO vo) {
 		System.out.println(vo.toString());
        Map<String, Object> response = new HashMap<>();
        System.out.println("------============-----------");
        boolean isDuplicate = memberDAO.isUserIdExist(vo.getUserId());  // 중복 확인 서비스 호출
        response.put("isDuplicate", isDuplicate);  // 중복 여부를 response에 저장
        return response;
    }
	
 	
 	//닉네임 중복확인
 	@PostMapping("/check-nick")
    @ResponseBody //ajax 통신시에만 사용(얘를 쓰면 리턴값이 값으로 들어감=객체로 전달된다 주소가 아닌 그자체로 돌아감)
    public Map<String, Object> checkUserNickExist(MemberVO vo) {
 		System.out.println(vo.toString()); //확인용
 		
        Map<String, Object> response = new HashMap<>();
        System.out.println("------============-----------");
        
        boolean isNickDuplicate = memberDAO.isUserNickExist(vo.getNickName());  // 중복 확인 서비스 호출
        response.put("isNickDuplicate", isNickDuplicate);  // 중복 여부를 response에 저장
        return response;
    }
 	
 	
 	
 	
	
 	
	
	
}

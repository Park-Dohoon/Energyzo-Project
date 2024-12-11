package com.energyzo.javaproject.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.energyzo.javaproject.service.MailService_seoyeon;

@Controller
//@RequiredArgsConstructor
public class MailController_seoyeon {

   @Autowired
    private MailService_seoyeon mailService;
   

    @ResponseBody
    @GetMapping("/emailCheck_seoyeon.do") // 이 부분은 각자 바꿔주시면 됩니다. @RequestBody MailDTO mailDTO    
    public String emailCheck(String email, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
       //String email = mailDTO.getEmail();
       //세션 객체 요청 가져오기
       HttpSession session = request.getSession();
       
       String authCode = mailService.sendSimpleMessage(email, session); // 인증번호 발송
    
       //System.out.println("여기도나요요요요용?11====>" + email); 
       return authCode; // Response body에 값을 반환       
    }
    
   
    
    @RequestMapping("verifyAuthCode2_seoyeon.do")
    public String verifyAuthCode(HttpServletRequest request, @RequestParam("authCode") String userInputCode,  Model model) {
        // 세션에서 저장된 인증코드를 가져옴
        System.out.println("verifyAuthCode.do 요청 처리 중...");
        System.out.println("입력된 인증 코드: " + userInputCode);
       
       HttpSession session = request.getSession();
        String correctAuthCode = (String) session.getAttribute("authCode");
        System.out.println("세션에 저장된 인증 코드: " + correctAuthCode);

        // 인증 결과 메시지 설정
        String resultMessage;
        
        // 사용자가 입력한 인증 코드와 세션에 저장된 코드 비교
        if (correctAuthCode != null && correctAuthCode.equals(userInputCode)) {
        	System.out.println("인증성공");
            resultMessage = "인증 성공";
            model.addAttribute("resultMessage", resultMessage);  // 인증 성공 메시지 저장
            return "mypage/mypages";  // 메인 페이지로 이동
        } else {
            resultMessage = "인증 실패: 잘못된 인증코드";
            model.addAttribute("resultMessage", resultMessage);  // 인증 실패 메시지 저장
            return "mypage/emailsecession";  // 지금 화면으로이동
        }
        
        
    }

    
}

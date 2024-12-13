package com.energyzo.javaproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class Adm_Session_Interceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String userId = (String) request.getSession().getAttribute("user_id");

        System.out.println("adm session interceptor enter"+userId);
        // 관리자 권한 확인: "supervisor"인 경우만 통과
        if (userId == null || !"supervisor".equals(userId)) {
            request.getSession().invalidate(); // 세션 무효화
            response.sendRedirect(request.getContextPath() + "/main.do"); // main.do로 리다이렉트
            return false; // 리다이렉트 후 요청 처리 중지
        }
        
        // 관리자일 경우 계속해서 요청을 처리하도록 true 반환
        return true;
    }
	
}

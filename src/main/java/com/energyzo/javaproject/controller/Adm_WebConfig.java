package com.energyzo.javaproject.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Adm_WebConfig implements WebMvcConfigurer {

    // AdminSessionInterceptor를 Bean으로 등록
    @Bean
    public Adm_Session_Interceptor adm_Session_Interceptor() {
    	System.out.println("adm_session_interceptor enter");
        return new Adm_Session_Interceptor();
    }

    // 인터셉터를 등록하는 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adm_Session_Interceptor())  // AdminSessionInterceptor를 등록
                .addPathPatterns("/adm/**")  // "/adm/**" 경로에 대해 적용
                .excludePathPatterns("/login", "/main.do");  // 로그인, 메인 페이지는 제외
    }

}

package com.energyzo.javaproject.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Adm_ManageVO {

    private int pop_num;        // pop_num 
    private String pop_title;   // pop_title 
    private String pop_cont;    // pop_cont 
    private String pop_r_fname; // pop_r_fname 
    private String pop_fname;   // pop_fname 
    private String pop_start_date; // pop_start_date 
    private String pop_end_date;   // pop_end_date 
    private String pop_status;    // pop_status
    
    
    
    private int estOptNum;    // 옵션 번호
    private String estOptName; // 옵션 이름

    
  
    private int point_num;        // 포인트 관리번호
    private String user_id;       // 회원 ID
    private int point_pt;         // 포인트 수량
    private String point_source;  // 출처
    private String point_date;      // DB생성일
    
    private int point_deposit = 0;  // 충전/출석 합산
    private int point_withdraw = 0; // 경매/결제 합산
    private int recharge_point;		// 충전 포인트
    private int attend_point;		// 출석체크 포인트
    private int expired_point;		// 소멸 포인트
    private int pay_point;			// 결제 파워링크 포인트
    private int auct_point;			// 경매 사용 포인트
    private int remain_point;		// 잔여 포인트
    private int sales_rate;			// 판매율
    private int point_rate;			// 포인트지급율
    
    
    //통계
    private String month;               // 거래 월 (YYYY-MM)
    private Integer sale_price;         // 매매 가격 (평균값을 int로 처리)
    private Integer sale_count;         // 매매 거래 건수
    private Integer whole_rent_price;   // 전세 보증금 (평균값을 int로 처리)
    private Integer whole_rent_count;   // 전세 거래 건수
    private Integer monthly_rent_price; // 월세 가격 (평균값을 int로 처리)
    private Integer monthly_rent_count; // 월세 거래 건수
    
    
    
}

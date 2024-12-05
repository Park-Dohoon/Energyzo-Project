package com.energyzo.javaproject.model.vo;

import lombok.Data;

@Data
public class WishlistVO {

    private int fav_num;       // 찜목록 번호
    private int est_id;        // 상품 번호
    private String region;     // 지역
    private int monthpay;      // 보증금/월세액
    private int manageFee;     // 관리비
    private String nickname;   // 사용자 닉네임	
}

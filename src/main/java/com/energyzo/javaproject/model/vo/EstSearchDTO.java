package com.energyzo.javaproject.model.vo;

import lombok.Data;

@Data
public class EstSearchDTO {

	// 조건1
	private String 	est_addr;			// 건물주소
	
	
	// 조건2
	private String 	est_type;			// 건물 종류
	
	private Integer est_tra_cond_max;	// 상한가
	private Integer est_tra_cond_min;	// 하한가
	
	
	// 조건3
	private Integer est_m_area_max;     // 관리면적 상한
	private Integer est_m_area_min;     // 관리면적 하한
	
	private Integer est_sungin;			// 사용승인일
	
	private Integer est_m_floor;		// 상품이 위치한 층
	
	
	// 조건4
	private String tagArray;			// 태그 정보를 저장, 공백으로 구분
}

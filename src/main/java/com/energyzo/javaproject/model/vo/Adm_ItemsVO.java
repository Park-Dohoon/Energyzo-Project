package com.energyzo.javaproject.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Adm_ItemsVO {
    private int est_id;            // 부동산 등록번호
    private int agent_num;         // 판매자 관리번호
    private String est_reg_date;    // 부동산 등록일자
    private String est_tra_com_date; // 부동산 거래일자
    private String est_type;       // 부동산 유형
    private String est_tra_type;    // 부동산 거래 유형
    private int est_tra_cond;       // 부동산 거래 조건
    private int est_monthpay;      // 부동산 월세
    private int est_manage;        // 부동산 관리비
    private String est_addr;       // 부동산 주소
    private String est_lati;       // est_lati VARCHAR2(20)
    private String est_longi;      // est_longi VARCHAR2(20)
    private String est_direc;      // est_direc VARCHAR2(10)
    private String est_usage;      // est_usage VARCHAR2(20)
    private int est_m_area;         // est_m_area NUMBER
    private int est_t_area;         // est_t_area NUMBER
    private int est_t_floor;        // est_t_floor NUMBER
    private int est_m_floor;        // est_m_floor NUMBER
    private int est_elev_num;       // est_elev_num NUMBER
    private int est_room_num;       // est_room_num NUMBER
    private int est_bath_num;       // est_bath_num NUMBER
    private int est_gara_num;       // est_gara_num NUMBER
    private String est_gumsa;      // est_gumsa DATE
    private String est_sungin;     // est_sungin DATE
    private String est_jungong;    // est_jungong DATE	
    

	private String user_id;
	private String agent_office;
	private int agent_reg_num;
	private String agent_tel;
	private String agent_name;
	private String agent_addr;
	private String agent_rfname;
	private String agent_fname;
	private int agent_reg_state;
	
    private int comp_num;      // complaint number
    private String comp_date;  // complaint date 
    private int accuse_count;  // 누적 신고수
	

    private int dis_num;      // complaint number
    private int rapid_num;    // rapid number
    private String dis_date;  // date of the complaint (String)
    private int dis_price;    // price of the complaint
	
    private String rapid_item;  // rapid_item
    
    private String id;

}

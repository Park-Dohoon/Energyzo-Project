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

  
    
}

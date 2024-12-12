package com.energyzo.javaproject.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Adm_SalesVO {
	
	private int agent_num;
	private String user_id;
	private String agent_office;
	private int agent_reg_num;
	private String agent_tel;
	private String agent_name;
	private String agent_addr;
	private String agent_rfname;
	private String agent_fname;
	private int agent_reg_state;
	
	private String id;				// 세부 정보를 찾기 위해 선택된 id
	
	

}

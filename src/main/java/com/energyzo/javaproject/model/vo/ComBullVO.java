package com.energyzo.javaproject.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ComBullVO {

	// 게시판 컴플레인
	private String		user_id;
	private Integer	comp_bull_num;
	private Integer	free_num;
	private Date		comp_bull_date;
	private String		comp_bull_reason;
}

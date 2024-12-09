package com.energyzo.javaproject.model.vo;

import java.sql.Date;

import lombok.*;

@Data
//@Builder
//@NoArgsConstructor
//@AllArgsConstructor
public class BoardVO {

	private Integer	free_num;
	private String		user_id;
	private String		free_title;
	private String		free_cont;
	private Date		free_date;
	private Date		free_recent;
	private Integer	free_count;
}

package com.energyzo.javaproject.model.vo;

import lombok.Data;

@Data
public class EstOptionVO {

	private Integer	est_opt_man_num;	// `est_opt_man_num` in DB
	private Integer est_id; 			// `est_id` in DB
	private Integer est_opt_num; 		// `est_opt_num` in DB
	private String 	est_opt_name; 		// `est_opt_name` in DB
}

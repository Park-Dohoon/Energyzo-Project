package com.energyzo.javaproject.model.vo;

import lombok.Data;

@Data
public class PointVO {

	private int point_num;
	private String user_id;
	private int point_pt;
	private String point_source;
	private String point_date;
	private int point_extension_days;
    private int total_points; // 추가 필요

}

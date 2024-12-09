package com.energyzo.javaproject.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Adm_UserVO {
	private String user_id;
	private int auth_num;
	private String email;
	private String kakao_pk;
	private String nick_name;
	private String name;
	private String mobile;
	private String birth;
	private String address;
	private String password;

}

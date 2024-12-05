package com.energyzo.javaproject.model.vo;

import lombok.Data;

// [1] 롬복을 설정하거나 setter,getter, toString 추가
@Data
public class UserVO {

	// [2] 필요한 멤버변수 선언 - 가급적 DB의 테이블의 컬럼명과 동일하면 쉬움
	//						물론 다를 경우가 많음
	
	private String user_id;
	private Integer auth_num;
	private String email;
	private String kakao_pk;
	private String nick_name;
	private String name;
	private String mobile;
	private String birth;
	private String address;
	private String password;
	
	
}

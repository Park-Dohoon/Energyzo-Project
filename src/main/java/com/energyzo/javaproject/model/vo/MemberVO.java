package com.energyzo.javaproject.model.vo;


public class MemberVO{


	private String userId;			//아이디
	private String nickName;		//닉네임
	private String password;		//비밀번호
	private String passwordck;		//비밀번호확인
	private String name;			//이름	
	private String birth;			//생년월일
	private String to;			//휴대전화번호
	private String email;			//이메일
	private String address;			//주소
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordck() {
		return passwordck;
	}
	public void setPasswordck(String passwordck) {
		this.passwordck = passwordck;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", nickName=" + nickName + ", password=" + password + ", passwordck="
				+ passwordck + ", name=" + name + ", birth=" + birth + ", to=" + to + ", email=" + email + ", address="
				+ address + "]";
	}
	
	

}





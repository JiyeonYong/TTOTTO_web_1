package com.ttotto.postpost.vo;
import java.sql.Date;

public class Member {

	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private Date userErollDate;
	
	
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String userId, String userPwd, String userName, String email, String phone, Date userErollDate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.userErollDate = userErollDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getUserErollDate() {
		return userErollDate;
	}
	public void setUserErollDate(Date userErollDate) {
		this.userErollDate = userErollDate;
	}
	
	
}
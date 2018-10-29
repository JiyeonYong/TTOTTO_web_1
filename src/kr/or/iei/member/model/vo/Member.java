package kr.or.iei.member.model.vo;

public class Member {
	private String userId;
	private String userPwd;
	private String userEmail;
	private String phone;
	

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}




	public Member(String userId, String userPwd, String userEmail, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.phone = phone;
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


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

	
	
	
}
	
	



package com.ttotto.post.model.vo;

public class Post {

	private int projNo;
	private String subject;	
	private String contents;
	private String userId;
	private String file;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int projNo, String subject, String contents, String userId, String file) {
		super();
		this.projNo = projNo;
		this.subject = subject;
		this.contents = contents;
		this.userId = userId;
		this.file = file;
	}

	public int getProjNo() {
		return projNo;
	}

	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}	
	
}
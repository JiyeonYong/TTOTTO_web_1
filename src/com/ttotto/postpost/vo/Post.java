package com.ttotto.postpost.vo;

import java.sql.Date;

public class Post {  //게시판의 게시글
	
	private int postNo;
	private int boardNo;
	private String subject;
	private String contents;
	private String userId;
	private String postType;
	private Date postDate;
	
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(int postNo, int boardNo, String subject, String contents, String userId, String postType,
			Date postDate) {
		super();
		this.postNo = postNo;
		this.boardNo = boardNo;
		this.subject = subject;
		this.contents = contents;
		this.userId = userId;
		this.postType = postType;
		this.postDate = postDate;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	
	
	
	
	
	
}


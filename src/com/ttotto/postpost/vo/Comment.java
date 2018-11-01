package com.ttotto.postpost.vo;

import java.sql.Date;

public class Comment {  //댓글

	private int commentNo;
	private int postNo;
	private String contents;
	private String userId;
	private Date CommentDate;
	
	
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int commentNo, int postNo, String contents, String userId, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.postNo = postNo;
		this.contents = contents;
		this.userId = userId;
		this.CommentDate = commentDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
	public Date getCommentDate() {
		return CommentDate;
	}
	public void setCommentDate(Date commentDate) {
		CommentDate = commentDate;
	}
	
	
	
	
	
	
	
}

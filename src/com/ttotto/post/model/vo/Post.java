package com.ttotto.post.model.vo;

public class Post {

	private String subject;
	private String title;
	private String contents;
	private String file;
	
	
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(String subject, String title, String contents, String file) {
		super();
		this.subject = subject;
		this.title = title;
		this.contents = contents;
		//this.file = file;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	/*public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}*/
}

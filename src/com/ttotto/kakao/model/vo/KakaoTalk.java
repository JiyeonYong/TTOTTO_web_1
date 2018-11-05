package com.ttotto.kakao.model.vo;

public class KakaoTalk {	
	private int projNo;			//프로젝트넘버
	private String inputId;		//입력에 넣은 아이디
	private String content;		//내용
	private String dateWithTime;	//날짜시간
	private int importance;			//중요도	
		
	public KakaoTalk() {		

	
	}	
	
	public KakaoTalk(int projNo, String inputId, String content, String dateWithTime, int importance) {
		super();
		this.projNo = projNo;
		this.inputId = inputId;
		this.content = content;
		this.dateWithTime = dateWithTime;
		this.importance = importance;
	}


	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	public String getInputId() {
		return inputId;
	}
	public void setInputId(String inputId) {
		this.inputId = inputId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDateWithTime() {
		return dateWithTime;
	}
	public void setDateWithTime(String dateWithTime) {
		this.dateWithTime = dateWithTime;
	}
	public int getImportance() {
		return importance;
	}
	public void setImportance(int importance) {
		this.importance = importance;
	}
	
	
	
}

package com.ttotto.www.kakao.vo;

public class KakaoTalk {	
	private int kakaoNo;			//카카오넘버
	private int projNo;				//프로젝트넘버
	private String content;		//내용
	private String dateWithTime;	//날짜시간
	private int importance;			//중요도
	
	public KakaoTalk() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public KakaoTalk(String content) {
		this.content = content;
		// TODO Auto-generated constructor stub
	}

	public KakaoTalk(int kakaoNo, int projNo, String content, String dateWithTime, int importance) {
		super();
		this.kakaoNo = kakaoNo;
		this.projNo = projNo;
		this.content = content;
		this.dateWithTime = dateWithTime;
		this.importance = importance;
	}

	public int getKakaoNo() {
		return kakaoNo;
	}

	public void setKakaoNo(int kakaoNo) {
		this.kakaoNo = kakaoNo;
	}

	public int getProjNo() {
		return projNo;
	}

	public void setProjNo(int projNo) {
		this.projNo = projNo;
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

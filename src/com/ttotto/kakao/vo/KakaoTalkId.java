package com.ttotto.www.kakao.vo;

public class KakaoTalkId {
	private int kakaoIdNo;
	private int projNo;
	private String viewId;
	private String inputId;
	public KakaoTalkId() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public KakaoTalkId(String viewId,String inputId) {	
		this.viewId = viewId;
		this.inputId = inputId;
	}
	
	public KakaoTalkId(int kakaoIdNo, int projNo, String viewId, String inputId) {
		super();
		this.kakaoIdNo = kakaoIdNo;
		this.projNo = projNo;
		this.viewId = viewId;
		this.inputId = inputId;
	}
	public int getKakaoIdNo() {
		return kakaoIdNo;
	}
	public void setKakaoIdNo(int kakaoIdNo) {
		this.kakaoIdNo = kakaoIdNo;
	}
	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	public String getViewId() {
		return viewId;
	}
	public void setViewId(String viewId) {
		this.viewId = viewId;
	}
	public String getInputId() {
		return inputId;
	}
	public void setInputId(String inputId) {
		this.inputId = inputId;
	}
	
	
	
}

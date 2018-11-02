package com.ttotto.project.model.vo;

import java.sql.Date;

public class Project {
	private int projNo;
	
	private String projName;
	private int memberCount;
	private Date updateDate;
	private String projType;
	private String createrId;
	private String addMemberId;
	

	public Project(int projNo, String projName, int memberCount, Date updateDate, String projType, String createrId,String addMemberId) {
		super();
		this.projNo = projNo;
		
		this.projName = projName;
		this.memberCount = memberCount;
		this.updateDate = updateDate;
		this.projType = projType;
		this.createrId = createrId;
		this.addMemberId = addMemberId;
	}

	
	



	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}



	


	public String getAddMemberId() {
		return addMemberId;
	}






	public void setAddMemberId(String addMemberId) {
		this.addMemberId = addMemberId;
	}






	public int getProjNo() {
		return projNo;
	}
	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}
	
	
	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getProjType() {
		return projType;
	}

	public void setProjType(String projType) {
		this.projType = projType;
	}

	public String getCreaterId() {
		return createrId;
	}

	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}

}

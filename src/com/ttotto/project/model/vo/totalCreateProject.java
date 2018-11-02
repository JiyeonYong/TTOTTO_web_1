package com.ttotto.project.model.vo;

public class totalCreateProject {
	private String hashSearch;
	private String projectName;
	private String projectType;
	private String projectMember;
	public String getHashSearch() {
		return hashSearch;
	}
	public void setHashSearch(String hashSearch) {
		this.hashSearch = hashSearch;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getProjectMember() {
		return projectMember;
	}
	public void setProjectMember(String projectMember) {
		this.projectMember = projectMember;
	}
	public totalCreateProject(String hashSearch, String projectName, String projectType, String projectMember) {
		super();
		this.hashSearch = hashSearch;
		this.projectName = projectName;
		this.projectType = projectType;
		this.projectMember = projectMember;
	}
	public totalCreateProject() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}

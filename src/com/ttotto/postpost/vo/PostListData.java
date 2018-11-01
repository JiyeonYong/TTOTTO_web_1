package com.ttotto.postpost.vo;

import java.util.ArrayList;

public class PostListData {
	private ArrayList<Post> list;
	
	private ArrayList<Comment> list1;

	
	
	
	
	
	public PostListData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostListData(ArrayList<Post> list, ArrayList<Comment> list1) {
		super();
		this.list = list;
		this.list1 = list1;
	}

	public ArrayList<Post> getList() {
		return list;
	}

	public void setList(ArrayList<Post> list) {
		this.list = list;
	}

	public ArrayList<Comment> getList1() {
		return list1;
	}

	public void setList1(ArrayList<Comment> list1) {
		this.list1 = list1;
	}

	
	
	
	

}

package com.ttotto.project.model.vo;

import java.util.ArrayList;

public class Hash {
	private ArrayList<String> list;
	

	public Hash() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	@Override
	public String toString() {
		return "Hash [list=" + list + "]";
	}



	public Hash(ArrayList<String> list) {
		super();
		this.list = list;
	}

	public ArrayList<String> getList() {
		return list;
	}

	public void setList(ArrayList<String> list) {
		this.list = list;
	}
	
}

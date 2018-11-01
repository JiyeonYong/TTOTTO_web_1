package com.ttotto.postpost.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.postpost.dao.PostDao;
import com.ttotto.postpost.vo.Post;

public class PostService {

	public ArrayList<Post> noteAllList() {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list=new PostDao().noteAllList(conn);
	
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Post> commentList() {
		

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list=new PostDao().commentList(conn);
	
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}



}

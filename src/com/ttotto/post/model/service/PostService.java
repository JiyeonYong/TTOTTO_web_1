package com.ttotto.post.model.service;

import java.sql.Connection;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.post.model.dao.PostDao;
import com.ttotto.post.model.vo.Post;

public class PostService {

	public int insertPost(Post post) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		System.out.println("service"+conn);
		
		int result = new PostDao().insertPost(conn, post);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
	
		return result;
		
	}

	
	
}

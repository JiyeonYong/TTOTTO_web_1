package com.ttotto.post.model.service;

import java.sql.Connection;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.post.model.dao.PostDao;
import com.ttotto.post.model.vo.Post;

public class PostService {

	public int insertPost(String subject, String title, String contents) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = new PostDao().insertPost(conn, subject, title,contents);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	
		return result;
		
	}

	
	
}

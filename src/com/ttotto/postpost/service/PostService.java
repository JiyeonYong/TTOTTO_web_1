package com.ttotto.postpost.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.postpost.dao.PostDao;
import com.ttotto.postpost.vo.Comment;
import com.ttotto.postpost.vo.Post;
import com.ttotto.postpost.vo.PostListData;

public class PostService {

	public ArrayList<Post> PostAllList() {
		System.out.println("POSTSERVICE의값이야");
		Connection conn = JDBCTemplate.getConnection();		
		
		ArrayList<Post> list = new PostDao().noteAllList(conn);			
		
		System.out.println("postservice의리스트값"+list);
	
		JDBCTemplate.close(conn);
		
		return list;
	}
}

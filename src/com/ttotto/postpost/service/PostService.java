package com.ttotto.postpost.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.postpost.dao.PostDao;
import com.ttotto.postpost.vo.Comment;
import com.ttotto.postpost.vo.Post;
import com.ttotto.postpost.vo.PostListData;

public class PostService {

	public PostListData PostAllList() {
		System.out.println("POSTSERVICE의값이야");
		Connection conn = JDBCTemplate.getConnection();
		PostListData pld = null;
		
		ArrayList<Post> list = new PostDao().noteAllList(conn);	
		
		
		System.out.println("postservice의리스트값"+list);
		
		for(Post p :list) {
			int postNo = p.getPostNo();
			ArrayList<Comment> list1 =new PostDao().commentList(conn, postNo);
			
			//if(p!=null) {
				pld = new PostListData();
				pld.setList(list);
				pld.setList1(list1);
		//}
		
	}
		JDBCTemplate.close(conn);
		System.out.println("pld의값"+pld);
		return pld ;
	}
}

package com.ttotto.post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.post.model.vo.Post;

public class PostDao {

	public int insertPost(Connection conn, Post post) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println(post.getProjNo());
		System.out.println(post.getSubject());
		System.out.println(post.getContents());
		System.out.println(post.getUserId());
		String query = "insert into post_table values(postNo.nextVal,?,?,?,?,null,sysdate)";
		
		System.out.println("daoResult 쿼리 이전: " + result);
		
		try {
			pstmt =conn.prepareStatement(query);

			pstmt.setInt(1, post.getProjNo());
			pstmt.setString(2, post.getSubject());			
			pstmt.setString(3, post.getContents());
			pstmt.setString(4, post.getUserId());	
		
			result = pstmt.executeUpdate();
			
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);			
		}		
		
		System.out.println("daoResult : " + result);
		
		return result;
	}

}

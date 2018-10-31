package com.ttotto.post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.post.model.vo.Post;

public class PostDao {

	public int insertPost(Connection conn, String subject, String title, String contents) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into post values(?,?,?)";
		
		
		try {
			pstmt =conn.prepareStatement(query);

			pstmt.setString(1, subject);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			//pstmt.setString(4, post.getFile());
		
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			
		}
		
		
		return result;
	}

}

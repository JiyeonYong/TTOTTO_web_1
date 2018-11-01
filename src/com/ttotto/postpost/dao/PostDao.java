package com.ttotto.postpost.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.postpost.vo.Comment;
import com.ttotto.postpost.vo.Post;

public class PostDao {

	public ArrayList<Post> noteAllList(Connection conn) {
	
		Statement stmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Post> list = new ArrayList<Post>();
		
		String query = "select * from Post_table";
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Post p = new Post();
				p.setPostNo(rset.getInt("POST_NO"));
				p.setBoardNo(rset.getInt("BOARD_NO"));
				p.setSubject(rset.getString("SUBJECT"));
				p.setContents(rset.getString("CONTENTS"));
				p.setUserId(rset.getString("USER_ID"));
				p.setPostType(rset.getString("POST_TYPE"));
				p.setPostDate(rset.getDate("POST_DATE"));
				
				list.add(p);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public ArrayList<Post> commentList(Connection conn ) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		String query = "select * from COMMENT_TABLE where post_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "POST_NO");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

}

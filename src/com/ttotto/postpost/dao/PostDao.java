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

	public ArrayList<Post> noteAllList(int projNo, Connection conn) {
	
		Statement stmt = null;
		
		ResultSet rset = null;
		
		ArrayList<Post> list = new ArrayList<Post>();
		
		String query = "select * from post_table where board_no = '" +projNo+"'";
		
		System.out.println("postDao의값"+conn);
		
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
				
				System.out.println("지영이꺼 포스트 번호" + p.getPostNo());
				
				list.add(p);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		System.out.println(list+"list의사이즈야");
		return list;
	}

	public ArrayList<Comment> commentList(Connection conn, int postNo ) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		String query = "select * from comment_table where post_no=?";
		
		System.out.println("전"+query);
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, postNo);
			System.out.println(query);
			rset=pstmt.executeQuery();
			
			System.out.println("pstmt"+pstmt);
			System.out.println("rset"+rset);
			
			
			
			while(rset.next()) {
				
				Comment co = new Comment();
				co.setCommentNo(rset.getInt("COMMENT_NO"));
				co.setPostNo(rset.getInt("POST_NO"));
				co.setContents(rset.getString("CONTENTS"));
				co.setUserId(rset.getString("USER_ID"));
				co.setCommentDate(rset.getDate("COMMENT_DATE"));
				
				list.add(co);
				System.out.println("co의값"+co);
			}
				
				
				
		
			System.out.println("PostDao"+list);
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		return list;
	}

		
}

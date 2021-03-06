package com.ttotto.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.member.model.vo.Member;

public class MemberDao {

	public Member selectOneMember(Connection conn, String userId, String userPwd) {

		// select 구문을 처리하기 위한 변수 생성
		// (PreparedStatement, ResultSet, String query)

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Member member = null;

		String query = "select * from USER_TABLE where user_id=? AND user_pwd=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				member = new Member();
				member.setUserId(rset.getString("user_id"));
				member.setUserPwd(rset.getString("user_pwd"));
				member.setUserName(rset.getString("user_name"));
				member.setUserEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection conn, Member m) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "insert into USER_TABLE values(?,?,?,?,?,SYSDATE)";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserEmail());
			pstmt.setString(5, m.getPhone());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public String checkId(String checkId, Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select user_id from USER_TABLE where user_id=?";

		String userId = null;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				userId = rset.getString("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return userId;
	}

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update USER_TABLE set user_pwd=?, phone=? where user_id=?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "delete from USER_TABLE where user_id =? and user_pwd=?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member selectFindMember(Connection conn, String email, String phone) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Member member = null;

		String query = "select * from USER_TABLE where email=? AND phone=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				member = new Member();
				member.setUserId(rset.getString("user_id"));
				member.setUserPwd(rset.getString("user_pwd"));
				member.setUserName(rset.getString("user_name"));
				member.setUserEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return member;
	}

	public int updatePwdMember(Connection conn, String email, String password) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update USER_TABLE set user_pwd=? where email=?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, password);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member selectFindIdMember(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from USER_TABLE where email=?";
		
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setUserId(rset.getString("user_id"));
				member.setUserPwd(rset.getString("user_pwd"));
				member.setUserEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return member;

	}
}


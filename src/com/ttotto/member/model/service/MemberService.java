package com.ttotto.member.model.service;

import java.sql.Connection;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.member.model.dao.MemberDao;
import com.ttotto.member.model.vo.Member;

public class MemberService {
	public Member selectOneMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().selectOneMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return member;
		
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	
		return result;
	}
	
	public boolean checkId(String checkId) {
		Connection conn = JDBCTemplate.getConnection();
		
		String userId = new MemberDao().checkId(checkId, conn);
		
		JDBCTemplate.close(conn);
		
		if(userId == null) {
			// null인 경우 해당 ID를 사용하는 사용자가 없다는 의미
			return false; // 리턴 값이 false는 해당 아이디 사용자가 없음 값
		}
		else {
			return true;
		}
	}

	public int updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	
		return result;
	}

	public int deleteMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	
		return result;
	}

	public Member selectFindMember(String email, String phone) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().selectFindMember(conn, email, phone);
		
		JDBCTemplate.close(conn);
		
		return member;
		
		
	}

	public int updatePwdMember(String email, String password) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updatePwdMember(conn, email, password);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
	
		return result;
		
	}

	public Member selectFindIdMember(String email) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member member = new MemberDao().selectFindIdMember(conn, email);
		
		JDBCTemplate.close(conn);
		
		return member;
		
	}

}

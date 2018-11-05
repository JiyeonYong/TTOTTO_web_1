package com.ttotto.kakao.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.kakao.model.vo.KakaoTalk;
import com.ttotto.kakao.model.vo.KakaoTalkId;

public class KakaoDao {

	public int insertKakao(ArrayList<KakaoTalk> kakaoList, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;

		//System.out.println(kakaoList);
		//System.out.println(kakaoList.getContent());
		
		String query = "insert into kakao_table values(kakaoNo.nextval,?,?,?,sysdate,default)";
		
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			for(int i=0; i<kakaoList.size(); i++) {
			pstmt.setInt(1, kakaoList.get(i).getProjNo());
			pstmt.setString(2, kakaoList.get(i).getInputId());
			pstmt.setString(3, kakaoList.get(i).getContent());
			
			result += pstmt.executeUpdate();
			}
			if(result>0) {
				conn.commit();
				System.out.println(result + "성공!");
			}else {
				conn.rollback();
				System.out.println("실패!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<KakaoTalkId> viewKakaoId(Connection conn,int projNo) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<KakaoTalkId> kakaoList=new ArrayList<>();

		String query = "select * from kakao_id where proj_no = " + projNo;
		
		
		
		try {
			stmt = conn.createStatement();	
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				
				String viewId=rset.getString("view_id");
				
				String inputId=rset.getString("input_id");
				
				KakaoTalkId kakaoId = new KakaoTalkId(viewId, inputId);				
				
				kakaoList.add(kakaoId);				
				
			}else {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(stmt);
		}
		
		return kakaoList;
		
	
	}

	public void insertKakaoId(ArrayList<KakaoTalk> kakaoList, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;

		//System.out.println(kakaoList);
		//System.out.println(kakaoList.getContent());
		
		String query = "insert into kakao_table values(kakaoNo.nextval,?,?,?,sysdate,default)";
		
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			for(int i=0; i<kakaoList.size(); i++) {
			pstmt.setInt(1, kakaoList.get(i).getProjNo());
			pstmt.setString(2, kakaoList.get(i).getInputId());
			pstmt.setString(3, kakaoList.get(i).getContent());
			
			result += pstmt.executeUpdate();
			}
			if(result>0) {
				conn.commit();
				System.out.println(result + "성공!");
			}else {
				conn.rollback();
				System.out.println("실패!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
	}
}

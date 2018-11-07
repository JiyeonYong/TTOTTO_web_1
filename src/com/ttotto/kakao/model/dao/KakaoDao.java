package com.ttotto.kakao.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.kakao.model.vo.KakaoTalk;
import com.ttotto.kakao.model.vo.KakaoTalkId;

public class KakaoDao {

	public int insertKakao(ArrayList<KakaoTalk> kakaoList, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;

		// System.out.println(kakaoList);
		// System.out.println(kakaoList.getContent());

		String query = "insert into kakao_table values(kakaoNo.nextval,?,?,?,sysdate,default)";

		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < kakaoList.size(); i++) {
				pstmt.setInt(1, kakaoList.get(i).getProjNo());
				pstmt.setString(2, kakaoList.get(i).getInputId());
				pstmt.setString(3, kakaoList.get(i).getContent());

				result += pstmt.executeUpdate();
			}
			if (result > 0) {
				conn.commit();
				System.out.println(result + "성공!");
			} else {
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
	
	
	//해당 프로젝트의 모든 카카오톡 id를 가져옴
	public ArrayList<KakaoTalkId> viewKakaoId(int projNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<KakaoTalkId> kakaoTalkIdList = new ArrayList<>();

		String query = "select * from kakao_id_table where proj_no = ?";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, projNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				String viewId = rset.getString("view_id");

				String inputId = rset.getString("input_id");

				KakaoTalkId kakaoId = new KakaoTalkId(viewId, inputId);

				kakaoTalkIdList.add(kakaoId);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return kakaoTalkIdList;

	}

	public void insertKakaoId(ArrayList<KakaoTalk> kakaoList, Connection conn) {
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;

		ResultSet rset = null;

		int result = 0;

		// System.out.println(kakaoList);
		// System.out.println(kakaoList.getContent());

		String query1 = "select * from kakao_id_table where proj_no = ? and input_id=?";

		try {

			pstmt1 = conn.prepareStatement(query1);

			for (int i = 0; i < kakaoList.size(); i++) {
				pstmt1.setInt(1, kakaoList.get(i).getProjNo());
				pstmt1.setString(2, kakaoList.get(i).getInputId());

				rset = pstmt1.executeQuery();

				// 해당 아이디가 있으면 패스
				if (rset.next()) {
					;
				} else {
					// 없으면 view_id와 input_id가 똑같게 추가

					String query2 = "insert into kakao_id_table values(kakaoIdNo.nextval,?,?,?)";

					pstmt2 = conn.prepareStatement(query2);
					pstmt2.setInt(1, kakaoList.get(i).getProjNo());
					pstmt2.setString(2, kakaoList.get(i).getInputId());
					pstmt2.setString(3, kakaoList.get(i).getInputId());

					result += pstmt2.executeUpdate();

				}

			}

			if (result > 0) {
				conn.commit();
				System.out.println("kakaoIdinput" + result + "성공!");
			} else {
				conn.rollback();
				System.out.println("실패!");
			}
		} catch (

		SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt1);
			JDBCTemplate.close(pstmt2);
			
		}

	}


	public int selectAllKakao(int projNo,Connection conn) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String query = "select * from kakao_table where proj_no=?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, projNo);			
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				KakaoTalk kt = new KakaoTalk();
				
				kt.setProjNo(projNo);
				
				kt.setInputId(rset.getString("input_id"));
				
				kt.setContent(rset.getString("contents"));
				
				kt.setDateWithTime(rset.getString("date_with_time"));
				
				kt.setImportance(rset.getInt("importance"));
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		
		
		
		
		return 0;
	}
}

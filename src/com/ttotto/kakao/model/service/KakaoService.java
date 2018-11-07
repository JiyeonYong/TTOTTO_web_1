package com.ttotto.kakao.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.kakao.model.dao.KakaoDao;
import com.ttotto.kakao.model.vo.KakaoTalk;
import com.ttotto.kakao.model.vo.KakaoTalkId;


public class KakaoService {
	
	
	//카카오톡 내용을 입력받아 DB에 넣는 함수
	public int insertKakao(ArrayList<KakaoTalk> kakaoList) {
		Connection conn = JDBCTemplate.getConnection();
		
		//System.out.println(conn);
		
		//kakao_table에 넣기
		int result= new KakaoDao().insertKakao(kakaoList, conn);
		
		// kakao_id_table에 값 넣기		
		new KakaoDao().insertKakaoId(kakaoList,conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public ArrayList<KakaoTalkId> viewKakaoId(int projNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		//System.out.println(conn);
		
		ArrayList<KakaoTalkId> kakaoIdList = new KakaoDao().viewKakaoId(projNo,conn);		
		
		
		if(kakaoIdList.size()!= 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}		
		
		JDBCTemplate.close(conn);
		
		return kakaoIdList;
		
		
	}

	public ArrayList<KakaoTalk> selectAllKakao(int projNo) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<KakaoTalk> kakaoList = new KakaoDao().selectAllKakao(projNo,conn);
		
		if(kakaoList!=null) {
			JDBCTemplate.commit(conn);
		}else
		{
			JDBCTemplate.rollback(conn);
		}
		
		return kakaoList;
		
		
	}
}

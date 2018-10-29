package com.ttotto.kakao.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.kakao.model.dao.KakaoDao;
import com.ttotto.kakao.model.vo.KakaoTalk;
import com.ttotto.kakao.model.vo.KakaoTalkId;


public class KakaoService {
	
	
	//카카오톡 내용을 입력받아 DB에 넣는 함수
	public int insertKakao(KakaoTalk kaTalk) {
		Connection conn = JDBCTemplate.getConnection();
		
		System.out.println(conn);
		
		int result = new KakaoDao().insertKakao(kaTalk, conn);
		
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
		
		System.out.println(conn);
		
		ArrayList<KakaoTalkId> kakaoList = new KakaoDao().viewKakaoId(conn,projNo);
		
		if(kakaoList.size()!= 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return kakaoList;
	}
}

package com.ttotto.www.kakao.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.www.common.JDBCTemplete;
import com.ttotto.www.kakao.dao.KakaoDao;
import com.ttotto.www.kakao.vo.KakaoTalk;
import com.ttotto.www.kakao.vo.KakaoTalkId;

public class KakaoService {
	
	
	//카카오톡 내용을 입력받아 DB에 넣는 함수
	public int insertKakao(KakaoTalk kaTalk) {
		Connection conn = JDBCTemplete.getConnection();
		
		System.out.println(conn);
		
		int result = new KakaoDao().insertKakao(kaTalk, conn);
		
		if(result>0) {
			JDBCTemplete.commit(conn);
		}else {
			JDBCTemplete.rollback(conn);
		}
		
		JDBCTemplete.close(conn);
		
		return result;
		
	}

	public ArrayList<KakaoTalkId> viewKakaoId(int projNo) {
		Connection conn = JDBCTemplete.getConnection();
		
		System.out.println(conn);
		
		ArrayList<KakaoTalkId> kakaoList = new KakaoDao().viewKakaoId(conn,projNo);
		
		if(kakaoList.size()!= 0) {
			JDBCTemplete.commit(conn);
		}else {
			JDBCTemplete.rollback(conn);
		}
		JDBCTemplete.close(conn);
		
		return kakaoList;
	}
}

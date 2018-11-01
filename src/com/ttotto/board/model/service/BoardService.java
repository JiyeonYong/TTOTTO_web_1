package com.ttotto.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.board.model.dao.BoardDao;
import com.ttotto.board.model.vo.Board;
import com.ttotto.common.JDBCTemplate;

public class BoardService {

	public ArrayList<Board> selectAllBoardList(int projNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAllBoardList(projNo, conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}

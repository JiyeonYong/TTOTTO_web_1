package com.ttotto.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ttotto.board.model.vo.Board;
import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.vo.Project;

public class BoardDao {

	public ArrayList<Board> selectAllBoardList(int projNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<Board>();
		
		String query = "select * from proj_board_table where proj_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, projNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("board_no"));
				b.setProjNo(rset.getInt("proj_no"));
				b.setBoardName(rset.getString("board_name"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

}

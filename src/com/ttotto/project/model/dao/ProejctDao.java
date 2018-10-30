package com.ttotto.project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.vo.Project;

public class ProejctDao {

	public ArrayList<Project> selectAllProjectList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Project> list = new ArrayList<Project>();
		
		String query = "select * " + 
				"from (select proj_no from project_member_table where member_id = ?) pm, project_table p " + 
				"where pm.proj_no = p.proj_no";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Project p = new Project();
				p.setProjNo(rset.getInt("proj_no"));
				p.setProjName(rset.getString("proj_name"));
				p.setMemberCount(rset.getInt("proj_member_count"));
				p.setUpdateDate(rset.getDate("proj_update_date"));
				p.setProjType(rset.getString("proj_type"));
				p.setCreaterId("proj_creater_id");
				list.add(p);
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

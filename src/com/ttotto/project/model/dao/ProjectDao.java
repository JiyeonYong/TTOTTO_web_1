package com.ttotto.project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.vo.Project;

public class ProjectDao {

	public ArrayList<Project> selectAllProjectList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Project> list = new ArrayList<Project>();
		
		String query = "select * from project_table";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
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

	public int createProject(Connection conn,Project newProject) {
		// TODO Auto-generated method stub
		
		int result=0;
		PreparedStatement pstmt = null;
		String sql = "insert into project_table values(projNo.nextval,?,?,sysdate,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newProject.getProjName());
			pstmt.setInt(2, newProject.getMemberCount());
			pstmt.setString(3, newProject.getProjType());
			pstmt.setString(4, newProject.getCreaterId());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}

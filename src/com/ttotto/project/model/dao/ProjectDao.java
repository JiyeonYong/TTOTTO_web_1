package com.ttotto.project.model.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.vo.Hash;
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

	public int createProject(Connection conn,Project newProject,String createrId) {
		// TODO Auto-generated method stub
		
		int result=0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql1 = "insert into project_table values(projNo.nextval,?,?,sysdate,?,?)";
		
		String sql2 = "insert into project_member_table values(projMemberNo.nextVal,"
				+ "projNo.currVal,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql1);
			
			pstmt.setString(1, newProject.getProjName());
			pstmt.setInt(2, newProject.getMemberCount());
			pstmt.setString(3, newProject.getProjType());
			pstmt.setString(4, newProject.getCreaterId());
			
			result += pstmt.executeUpdate();
			
			String memberNickName="민수러브";
			
			pstmt2=conn.prepareStatement(sql2);
			
			pstmt2 = conn.prepareStatement(sql2);			
			pstmt2.setString(1, createrId);
			pstmt2.setString(2, memberNickName);	
			pstmt2.setString(3, newProject.getAddMemberId());
			
			result += pstmt2.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(pstmt2);
		}
		
		return result;
	}

	public int createHashName(Connection conn, Hash hash) {
	PreparedStatement pstmt = null;
	int result =0;
	
	System.out.println("hash값은?"+hash);
	
	
	
	
	
	String query = "insert into hash_table values(hashNo.nextval,?)";
	try {
		pstmt=conn.prepareStatement(query);
		
		
		String hash1 = hash.toString();
		
		System.out.println(hash1+"////////////e1의값은");
				
		pstmt.setString(1, hash1);
		result = pstmt.executeUpdate();
		System.out.println(result+"결과값");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(pstmt);
	}
		return result;
	}
}
		
		
	
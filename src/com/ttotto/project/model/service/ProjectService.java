package com.ttotto.project.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.dao.ProjectDao;
import com.ttotto.project.model.vo.Hash;
import com.ttotto.project.model.vo.Project;

public class ProjectService {

	public ArrayList<Project> selectAllProjectList(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Project> list = new ProjectDao().selectAllProjectList(conn, userId);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int createProject(Project newProject,String createrId) {
		// TODO Auto-generated method stub
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ProjectDao().createProject(conn,newProject,createrId);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else
			JDBCTemplate.rollback(conn);
		
		return result;
		
	}

	public int createHashName(Hash hash) {
		Connection conn = JDBCTemplate.getConnection();
		System.out.println("createHashName"+hash);
		int result = new ProjectDao().createHashName(conn,hash);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}

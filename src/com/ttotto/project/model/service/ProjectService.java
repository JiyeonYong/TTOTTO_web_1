package com.ttotto.project.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.project.model.dao.ProejctDao;
import com.ttotto.project.model.vo.Project;

public class ProjectService {

	public ArrayList<Project> selectAllProjectList(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Project> list = new ProejctDao().selectAllProjectList(conn, userId);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

}

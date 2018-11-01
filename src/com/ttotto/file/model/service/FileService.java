package com.ttotto.file.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.file.model.dao.FileDao;
import com.ttotto.file.model.vo.FileData;

public class FileService {

	
	   public int uploadFile(FileData fd) {
		      Connection conn = JDBCTemplate.getConnection();
		      int result = new FileDao().uploadFile(conn,fd);
		      
		      if(result>0)
		      {
		         JDBCTemplate.commit(conn);
		      }
		      else
		      {
		         JDBCTemplate.rollback(conn);
		      }
		      JDBCTemplate.close(conn);   
		      return result;
		   }

		   public ArrayList<FileData> fileList(String userId) {
		      Connection conn = JDBCTemplate.getConnection();
		      ArrayList<FileData> list = new FileDao().fileList(conn,userId);
		      
		      JDBCTemplate.close(conn);
		      
		      return list;
		   }

	

}

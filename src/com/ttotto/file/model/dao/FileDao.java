package com.ttotto.file.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ttotto.common.JDBCTemplate;
import com.ttotto.file.model.vo.FileData;

public class FileDao {

	public int uploadFile(Connection conn, FileData fd) {
	      
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = "insert into FILE_TABLE values(FILETABLE.NEXTVAL,?,?,?,?,?,?)";
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setLong(1, fd.getPostNo());
	         pstmt.setString(2, fd.getFileName());
	         pstmt.setString(3, fd.getFilePath());
	         pstmt.setLong(4, fd.getFileSize());
	         pstmt.setString(5, fd.getFileUser());
	         pstmt.setTimestamp(6,fd.getUploadTime());
	          
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         JDBCTemplate.close(pstmt);
	      }
	         
	      return result;
	   }

	   public ArrayList<FileData> fileList(Connection conn, String userId) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      ArrayList<FileData> list = new ArrayList<FileData>();
	      
	      String query = "select * from fileTbl where file_user=?";
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setString(1, userId);
	         
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next())
	         {
	            FileData fd = new FileData();
	            
	            fd.setFileNo(rset.getInt("file_no"));
	            fd.setPostNo(rset.getInt("post_no"));
	            fd.setFileName(rset.getString("file_name"));
	            fd.setFilePath(rset.getString("file_path"));
	            fd.setFileSize(rset.getLong("file_size"));
	            fd.setFileUser(rset.getString("file_user"));
	            fd.setUploadTime(rset.getTimestamp("uploadtime"));
	                     
	            list.add(fd);               
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	      }
	      
	      return list;
	   }

}

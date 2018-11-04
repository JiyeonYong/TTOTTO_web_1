package com.ttotto.file.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.ttotto.file.model.service.FileService;
import com.ttotto.file.model.vo.FileData;
import com.ttotto.member.model.vo.Member;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(name = "Upload", urlPatterns = { "/upload.do" })
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//1. 사용자 계정명 (업로드한 사람의 정보 - session을 이용)
		HttpSession session = request.getSession(false);
		try {
		String userId = ((Member)session.getAttribute("member")).getUserId();

		//2. 최대 업로드 파일 사이즈 (cos 라이브러리는 10MB가 한계)
		int fileSizeLimit = 5 * 1024 * 1024;
		
		//3. 업로드 될 경로
		String uploadPath = getServletContext().getRealPath("/")+"uploadFile"+"\\"+userId;
		
		
		//4. 인코딩 타입 (파일 인코딩 타입)
		String encType="UTF-8";
		
		
		//5. 위 정보들을 바탕으로 파일 업로드에 사용하는 MultipartRequest 객체를 생성
		MultipartRequest multi = new MultipartRequest(
									request,
									uploadPath,
									fileSizeLimit,
									encType,
									new DefaultFileRenamePolicy());
		
		
		//1. 파일 이름
		String fileName = multi.getFilesystemName("upfile");
		System.out.println("파일 이름 : " + fileName);
			
		//2. 업로드 파일의 실체 총 경로 (filePath)
		String fullFilePath = uploadPath+"\\"+fileName;
		System.out.println("총 경로 : " + fullFilePath);
		
		
		//3. 파일의 크기(length)
		File file = new File(fullFilePath); //import java.io.File
		long fileSize = file.length(); //파일의 사이즈를 가져옴
	
		
		//5. 파일이 업로드된 시간
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Timestamp uploadTime = null;
		
		uploadTime = Timestamp.valueOf(formatter.format(Calendar.getInstance().getTimeInMillis()));
	
		
		System.out.println("업로드된 시간 : " + uploadTime);
		
		
		
		FileData fd = new FileData();
		fd.setFileName(fileName);		
		fd.setFilePath(fullFilePath);	
		fd.setFileSize(fileSize);	
		fd.setFileUser(userId);			
		fd.setUploadTime(uploadTime);	
		
		
		//비즈니스 로직 처리
		int result = new FileService().uploadFile(fd);
		
		
			if(result>0)
			{
				response.sendRedirect("/views/file/fileUploadSuccess.jsp");
			}
			else
			{
				response.sendRedirect("/views/file/fileUploadFail.jsp");
			}
			
		
		} catch (Exception e) {
			response.sendRedirect("/views/file/error.jsp");
		}
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



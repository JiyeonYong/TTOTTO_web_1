package com.ttotto.file.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.file.model.service.FileService;
import com.ttotto.file.model.vo.FileData;
import com.ttotto.member.model.vo.Member;

/**
 * Servlet implementation class FileListServlet
 */
@WebServlet(name = "FileList", urlPatterns = { "/fileList.do" })
public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 사용자 ID를 session 에서 추출 (해당 사용자의 파일 리스트를 보여주어야 하므로 )
	      HttpSession session= request.getSession(false);
	      
	      try {
	         
	         String userId = ((Member)session.getAttribute("member")).getUserId();
	         
	         //2.사용자 ID를 바탕으로 비즈니스 로직 처리
	         ArrayList<FileData> list = new FileService().fileList(userId);
	         
	         RequestDispatcher view = request.getRequestDispatcher("views/file/fileList.jsp");
	         request.setAttribute("fileList",list);
	         view.forward(request, response);
	         
	         
	      } catch (Exception e) {
	         // TODO: handle exception
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

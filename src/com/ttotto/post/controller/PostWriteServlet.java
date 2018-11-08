package com.ttotto.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.post.model.service.PostService;
import com.ttotto.post.model.vo.Post;

/**
 * Servlet implementation class PostWriteServlet
 */
@WebServlet(name = "PostWrite", urlPatterns = { "/postWrite.do" })
public class PostWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("utf-8");
		  
		  HttpSession session = request.getSession();
		  
		  int projNo = (int)session.getAttribute("projNo");
		  
		  String userId = (String) session.getAttribute("userId");
		  
		  System.out.println("유저 아이디 :" + userId);
		  
		  String subject = request.getParameter("title");
		  String contents = request.getParameter("contents");
		  //String file = request.getParameter("file");
		  
		 Post post = new Post(projNo, subject, contents,userId, null);
		 
		
		// post.setFile(file);
		 
		 
		int result = new PostService().insertPost(post);
		
		if(result>0) {
			response.sendRedirect("/post.do");
			
		}else {
			response.sendRedirect("/views/post/error.jsp");
			
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

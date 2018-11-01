package com.ttotto.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		  
		  String subject = request.getParameter("subject");
		  String title = request.getParameter("title");
		  String contents = request.getParameter("contents");
		  //String file = request.getParameter("file");
		  
		 Post post = new Post();
		 
		
		// post.setFile(file);
		 
		 
		int result = new PostService().insertPost(subject,title,contents);
		
		if(result>0) {
			response.sendRedirect("/views/post/writeSuccess.jsp");
			
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

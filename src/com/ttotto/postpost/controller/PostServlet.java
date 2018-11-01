package com.ttotto.postpost.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttotto.postpost.service.PostService;
import com.ttotto.postpost.vo.*;
import com.ttotto.postpost.vo.PostListData;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet(name = "Post", urlPatterns = { "/post.do" })
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿왔어");
		PostListData list =new PostService().PostAllList();
		
		if(list != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/post/post.jsp");
			request.setAttribute("PostListData", list);
			view.forward(request, response);
			System.out.println("list의값"+list);
			
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

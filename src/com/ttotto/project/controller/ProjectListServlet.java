package com.ttotto.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ttotto.member.model.vo.Member;
import com.ttotto.project.model.service.ProjectService;
import com.ttotto.project.model.vo.Project;

/**
 * Servlet implementation class ProjectListServlet
 */
@WebServlet(name = "ProjectList", urlPatterns = { "/projectList.do" })
public class ProjectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
 		String userId = ((Member) session.getAttribute("member")).getUserId();
 		try {
 			
 			ArrayList<Project> list = new ProjectService().selectAllProjectList(userId); 		
			
			request.setAttribute("projectList", list);
			RequestDispatcher view = request.getRequestDispatcher("views/project/projectList.jsp");
				
			view.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 		/* response.sendRedirect("/views/project/projectList.jsp"); */
		
		
		
		//new Gson().toJson(projList,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

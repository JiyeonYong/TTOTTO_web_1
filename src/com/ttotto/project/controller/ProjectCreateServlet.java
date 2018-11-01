package com.ttotto.project.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.member.model.vo.Member;
import com.ttotto.project.model.service.ProjectService;
import com.ttotto.project.model.vo.Project;

/**
 * Servlet implementation class ProjectCreateServlet
 */
@WebServlet(name = "ProjectCreate", urlPatterns = { "/projectCreate.do" })
public class ProjectCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		
		String projName= request.getParameter("projName");
		String createrId = ((Member)session.getAttribute("member")).getUserId();
		String projType= request.getParameter("projType");
		
		//회원 추가 기능 일단 생략하고 0으로 프로젝트 DB에 생성
		int memberCount = 1;
		
		Date updateDate=null;
		
		Project newProject = new Project(0, projName, memberCount, updateDate, projType, createrId);
		
		int projResult = new ProjectService().createProject(newProject);
		
		int memberResult= new ProjectService().createProjectMember(createrId);
		
		try {			
			if(projResult>0) {
				response.sendRedirect("/views/project/projectList.jsp");
				
			}else {
				System.out.println("프로젝트가 정상적으로 만들어지지 않았습니다.");
				throw new Exception();
			}			
		} catch (Exception e) {			
			e.printStackTrace();
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

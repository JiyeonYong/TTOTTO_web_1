package com.ttotto.project.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.member.model.vo.Member;
import com.ttotto.project.model.service.ProjectService;
import com.ttotto.project.model.vo.Hash;
import com.ttotto.project.model.vo.Project;

import com.ttotto.project.model.vo.totalCreateProject;

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
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String projHash=request.getParameter("projHash");
		ArrayList<String>list = new ArrayList<String>();
		String[]toColumNum = projHash.split("#");
		totalCreateProject tcp = new totalCreateProject();
		
		for(int i=0; i<toColumNum.length;i++) {
			list.add(toColumNum[i]);
		}
		System.out.println(list+"list의값");
		Hash hash = new Hash(list);
		
		
		new ProjectService().createHashName(hash);
	
		
		String projName= request.getParameter("projName");
		String createrId = ((Member)session.getAttribute("member")).getUserId();
		String projType= request.getParameter("projType");
		String addMemberId = request.getParameter("addMember");
		
		
	
		
		
		
		//회원 추가 기능 일단 생략하고 0으로 프로젝트 
		
		
		
		
		
		//DB에 생성
		int memberCount = 1;
		
		Date updateDate=null;
		
		Project newProject = new Project(0, projName, memberCount, updateDate, projType, createrId,addMemberId);
		
		int result = new ProjectService().createProject(newProject,createrId);
		
		try {			
			if(result>0) {
				response.sendRedirect("/projectList.do");
				
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

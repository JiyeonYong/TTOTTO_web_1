package com.ttotto.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttotto.member.model.service.MemberService;
import com.ttotto.member.model.vo.Member;

/**
 * Servlet implementation class Find_idServlet
 */
@WebServlet(name = "Find_id", urlPatterns = { "/find_id.do" })
public class Find_idServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Find_idServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		
		Member member = new MemberService().selectFindIdMember(email);
		
		if(member != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/member/idfindSuccess.jsp");
			
			request.setAttribute("member", member);
			
			view.forward(request, response);
		}
		else {
			response.sendRedirect("/views/member/error");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

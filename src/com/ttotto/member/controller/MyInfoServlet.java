package com.ttotto.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.member.model.service.MemberService;
import com.ttotto.member.model.vo.Member;

/**
 * Servlet implementation class MyInfoServlet
 */
@WebServlet(name = "MyInfo", urlPatterns = { "/myInfo.do" })
public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 세션을 가지고 해당 사용자 ID값 추출
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		String userId = m.getUserId();
		String userPwd = m.getUserPwd();
		
		// 2. 비지니스 로직
		Member member = new MemberService().selectOneMember(userId, userPwd);
		
		// 3. 결과 출력
		if(member != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberMyInfo.jsp");
			// getRequestDispatcher 메소드는 상대경로만 사용가능하므로 '/'부터 시작하지 않음
			// ('/'부터 시작하면 절대경로임)
			// 해당되는 경로로 request객체와 response 객체를 가지고 이동
			// 클라이언트의 url이 해당 경로로 변경되지 않음
			
			request.setAttribute("member", member);
			
			view.forward(request, response);
		}
		else {
			response.sendRedirect("/views/member/error.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

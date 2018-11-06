package com.ttotto.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.member.model.service.MemberService;
import com.ttotto.member.model.vo.Member;

/**
 * Servlet implementation class MdeleteServlet
 */
@WebServlet(name = "Mdelete", urlPatterns = { "/mdelete.do" })
public class MdeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MdeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 세션에서 탈퇴할 ID 추출
		HttpSession session = request.getSession(false);
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		String userPwd = ((Member)session.getAttribute("member")).getUserPwd();
		
		String Pwd = request.getParameter("password");
		
		int result = 0;
		
		if(Pwd.equals(userPwd)) {
			result = new MemberService().deleteMember(userId, userPwd);
			
			// 3. 결과 리턴
			if(result>0) {
				session.invalidate(); // 세션 파기
				response.sendRedirect("/index.jsp");
			}
			else if(result==0) {
				response.sendRedirect("/views/member/deleteError.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

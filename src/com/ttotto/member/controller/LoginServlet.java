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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 인코딩 (한글이 있을 경우 처리하기 위함)
		request.setCharacterEncoding("utf-8");
		
		// 2. View에서 보낸 데이터를 변수에 저장
		// 로그인의 경우 ID, Pwd를 가져와야 함
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3. 비지니스 로직 (Controller -> Service -> DAO -> DB)
		Member member = new MemberService().selectOneMember(userId, userPwd);
		
		// 4. 결과 출력
		if(member != null) { // 로그인 성공
			
			HttpSession session = request.getSession(true); 
			// true : 세션 값이 없으면 새롭게 생성
			// false : 세션 값이 없으면 null 리턴
			System.out.println("발급된 세션 ID 값 : " + session.getId());
			
			session.setAttribute("member", member);
			
			response.sendRedirect("/views/member/loginSuccess.jsp"); // sendRedirect 메소드는 해당되는 페이지로 이동시키는 메소드		
		}
		else { // 로그인 실패 
			response.sendRedirect("/views/member/loginFail.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

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
 * Servlet implementation class InfoUpdateServlet
 */
@WebServlet(name = "InfoUpdate", urlPatterns = { "/infoUpdate.do" })
public class InfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 2. ID값은 session에서 추출, 나머지 값은 view에서 보내준 값을 추출
		HttpSession session = request.getSession(false);
		
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setPhone(phone);
		
		// 3. 비지니스 로직
		int result = new MemberService().updateMember(m);
		
		// 세션 정보 업데이트를 위하여 정보 가져오기
		Member member = new MemberService().selectOneMember(userId, userPwd);
		session.setAttribute("member", member);
		
		// 4. 결과 리턴
		if(result>0) {
			response.sendRedirect("/views/member/updateSuccess.jsp");
			// 해당되는 경로로 이동
			// 클라이언트의 url이 해당 경로로 변경
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

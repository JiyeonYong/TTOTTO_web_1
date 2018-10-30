package com.ttotto.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttotto.kakao.model.dao.KakaoDao;
import com.ttotto.kakao.model.service.KakaoService;
import com.ttotto.kakao.model.vo.KakaoTalk;
import com.ttotto.kakao.model.vo.KakaoTalkId;

/**
 * Servlet implementation class KakaoViewServlet
 */
@WebServlet(name = "KakaoView", urlPatterns = { "/kakaoIdView.do" })
public class KakaoIdViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoIdViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int projNo=1;
		
		ArrayList<KakaoTalkId> kakaoList = new ArrayList<>();
		kakaoList = new KakaoService().viewKakaoId(projNo);		 
		
		String is_id_tool = "1";
		
		request.setAttribute("kakaoList", kakaoList);	
		
		request.setAttribute("is_id_tool", is_id_tool);
		
		RequestDispatcher view = request.getRequestDispatcher("views/kakao/kakaoMain.jsp");

		view.forward(request, response);
		
		/*
		HttpSession session = request.getSession(true);
		
		session.setAttribute("is_id_tool", name);
		
		response.sendRedirect("/");
		*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

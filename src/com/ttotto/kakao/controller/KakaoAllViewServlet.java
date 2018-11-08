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

import com.ttotto.kakao.model.service.KakaoService;
import com.ttotto.kakao.model.vo.KakaoTalk;

/**
 * Servlet implementation class KakaoAllviewServlet
 */
@WebServlet(name = "KakaoAllView", urlPatterns = { "/kakaoAllView.do" })
public class KakaoAllViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoAllViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();		
		
		int projNo = (int)session.getAttribute("projNo");		
		
		ArrayList<KakaoTalk> kakaoList = new KakaoService().selectAllKakao(projNo);
		
		if(kakaoList.size()!=0) {
			RequestDispatcher view = request.getRequestDispatcher("views/kakao/kakaoMain.jsp");
			request.setAttribute("kakaoList", kakaoList);
			request.setAttribute("iskakaoList", "1");
			view.forward(request, response);
			
		}else {
			System.out.println("전체 조회에 실패했습니다.");
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

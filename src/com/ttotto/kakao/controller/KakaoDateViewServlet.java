package com.ttotto.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttotto.kakao.model.service.KakaoService;
import com.ttotto.kakao.model.vo.KakaoTalk;

/**
 * Servlet implementation class KakaoDateViewServlet
 */
@WebServlet(name = "KakaoDateView", urlPatterns = { "/kakaoDateView.do" })
public class KakaoDateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoDateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dateText = request.getParameter("dateText");
		
		System.out.println(dateText);
		
		ArrayList<KakaoTalk> kakaoList=new KakaoService().selectDateKakao(dateText);
		
		if(kakaoList.size()!=0) {
			RequestDispatcher view = request.getRequestDispatcher("views/kakao/kakaoMain.jsp");
			request.setAttribute("kakaoList", kakaoList);
			request.setAttribute("iskakaoList", "1");
			view.forward(request, response);
			
		}else {
			System.out.println("날짜별 카톡 조회에 실패했습니다.");
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

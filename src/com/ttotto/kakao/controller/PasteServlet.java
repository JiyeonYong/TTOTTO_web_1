package com.ttotto.www.kakao.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttotto.www.kakao.service.KakaoService;
import com.ttotto.www.kakao.vo.KakaoTalk;

/**
 * Servlet implementation class PasteServlet
 */
@WebServlet(name = "Paste", urlPatterns = { "/paste.do" })
public class PasteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String kakaoText = request.getParameter("kakaoText");	//붙여넣을 내용 아직 안 쪼갬.		
		/*		
		int kakaoNo = 0;		//DB에 넣을때는 자동으로 숫자 늘려서 넣어주는 방법사용
		
		String dateWithTime = text;		//텍스트 알고리즘으로 쪼개서 넣어야
		
		String contents = text;			//텍스트 알고리즘으로 쪼개서 넣어야
		
		int importance = 0;
		
		int projNo = 0;					//카카오톡 모아보기 페이지로 이동 시 세션에 넣어서 옮기기
		*/		
		
	
		KakaoTalk kaTalk = new KakaoTalk(kakaoText);
		
	
		int result = new KakaoService().insertKakao(kaTalk);
		
		if(result>0) {
			
			response.sendRedirect("/index.jsp");
		}else {
			System.out.println("붙여넣기에 실패했습니다.");
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

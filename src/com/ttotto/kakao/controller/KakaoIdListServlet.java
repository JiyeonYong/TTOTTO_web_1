package com.ttotto.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ttotto.kakao.model.service.KakaoService;
import com.ttotto.kakao.model.vo.KakaoTalkId;

/**
 * Servlet implementation class KakaoIdListServlet
 */
@WebServlet(name = "KakaoIdList", urlPatterns = { "/kakaoIdList.do" })
public class KakaoIdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoIdListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		int projNo = (int) session.getAttribute("projNo");
		
		//System.out.println("projNo :" +  projNo);
		
		//해당 proj의 view id list를 가져옴
		ArrayList<KakaoTalkId> kakaoIdList = new KakaoService().viewKakaoId(projNo);
		
		//가져온 id list의 값들이 있으면
		if(kakaoIdList.size()>0)
		{
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");	
					
			new Gson().toJson(kakaoIdList,response.getWriter());
		}
		
		else 
			System.out.println("리스트 없음");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

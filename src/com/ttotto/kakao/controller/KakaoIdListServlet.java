package com.ttotto.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
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
		
		//System.out.println("projNo : " + projNo);
		
		ArrayList<KakaoTalkId> kakaoIdList = new KakaoService().viewKakaoId(projNo);
		
		System.out.println("kakaoIdList : " + kakaoIdList.size());
		
		ArrayList<ArrayList<String>> idList =  new ArrayList<>(); 
		
		//가져온 id list의 값들이 있으면
		if(kakaoIdList.size()>0)
		{	
			//각 view아이디 별로 inputId를 넣어놓는 이중배열
			
			for(int i=0;i<kakaoIdList.size();i++) {
				
				String inputId = kakaoIdList.get(i).getInputId();
				String viewId = kakaoIdList.get(i).getViewId();				
				
				boolean isViewId = false;
				
				System.out.println("idList size : " + idList.size());
				
				System.out.println(viewId);
				
				//각 ArrayList의 첫번째 위치에 view 아이디를 넣어두고, 그것을 찾음
				System.out.println("직전 idList" + idList.size());
				for(int j=0;j<idList.size();j++)
				{
					//System.out.println("여기 : " + idList.get(j).get(0));
					//viewId 있는지 찾기
					if(idList.get(j).get(0).equals(viewId)) {
						//있으면 해당 리스트에 inputId 넣어주기
						System.out.println("여기 못들어오지?");						
						idList.get(j).add(inputId);
						isViewId=true;
						break;
					}
				}
				
				//viewId가 없었으면
				if(!isViewId) {
					
					idList.add(new ArrayList<String>());
					idList.get(idList.size()-1).add(viewId);
					idList.get(idList.size()-1).add(inputId);
					
					System.out.println("마지막 리스트 사이즈 : " + idList.size());

				}
			}
			
		}		
		
		else {
			System.out.println("리스트 없음");			
		}
		
		
		System.out.println("??");
		
		System.out.println("리스트 사이즈 : "+ idList.size());		
		
		response.setContentType("application/json");
		
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(idList,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

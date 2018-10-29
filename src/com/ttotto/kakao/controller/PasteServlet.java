package com.ttotto.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttotto.kakao.model.service.KakaoService;
import com.ttotto.kakao.model.vo.KakaoTalk;

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
		
		String kakaoString = (String) request.getParameter("kakaoString");
		
		

	      System.out.println(kakaoString);

	      Pattern p = Pattern.compile("\\[(.*?)\\]");
	      Matcher m = p.matcher(kakaoString);

	      Pattern p1 = Pattern.compile("\\](.*?)\\[");
	      Matcher m1 = p1.matcher(kakaoString);

	      StringTokenizer st = new StringTokenizer(kakaoString);

	      ArrayList<String> lastString = new ArrayList<>();

	      int tokenCnt = 0;

	      while (st.hasMoreTokens()) {
	         lastString.add(st.nextToken());
	      }

	      ArrayList<String> kakaoId = new ArrayList<>();

	      ArrayList<String> kakaoContents = new ArrayList<>();

	      ArrayList<String> kakaoTime = new ArrayList<>();

	      int kakaoIndex = 0;

	      while (m.find()) {

	         if (kakaoIndex % 2 == 0)
	            kakaoId.add(m.group(1));

	         else
	            kakaoTime.add(m.group(1));
	         
	         kakaoIndex++;
	      }
	      
	      int kakaoContentsIndex=0;
	      
	      while (m1.find()) {

	         if (kakaoContentsIndex % 2 == 1) {
	            kakaoContents.add(m1.group(1));
	         }
	         
	         kakaoContentsIndex++;
	         
	      }

	      kakaoContents.add(" " + lastString.get(lastString.size() - 1));

	      // 문제가 있는 경우 확인을 위한 알고리즘
	      for (int k = 0; k < 0; k++) {

	         // 1. '[' 모양을 중간에 넣은 경우 대비
	         // for(int i=0;i<kakaoId)

	         // 2. ']' 모양을 중간에 넣은 경우

	         // 3. '[]' 모양을 중간에 넣은 경우

	      }
	      
	      System.out.println(kakaoIndex +" " + kakaoId.size() + " " + kakaoTime.size() + " " + kakaoContents.size() + " " + kakaoContentsIndex);
	      

	      /*
	       * for (int k = 0; k < kakaoId.size(); k++) {

	         System.out.println(kakaoId.get(k) + " " + kakaoTime.get(k) + kakaoContents.get(k));
	      }
	       */
	      
	      int projNo = 1;	//projNo는 db에서 시퀀스로 넣어줌.. 
	      
	      KakaoTalk kt = new KakaoTalk(projNo, kakaoContents.get(0), kakaoTime.get(0), 0);
	      
	      int result = new KakaoService().insertKakao(kt);
			
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

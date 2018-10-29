package com.ttotto.kakao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KakoStringServlet
 */
@WebServlet(name = "KakoString", urlPatterns = { "/kakaoString.do" })
public class KakaoStringServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public KakaoStringServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

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
      

      for (int k = 0; k < kakaoId.size(); k++) {

         System.out.println(kakaoId.get(k) + " " + kakaoTime.get(k) + kakaoContents.get(k));
      }
      
      /*for(int k=0;k<kakaoContents.size();k++)
         System.out.println(kakaoContents.get(k));*/

      // 들어온 String을 잘라내는 알고리즘

      /*
       * StringTokenizer st = new StringTokenizer(kakaoString,"[");
       * 
       * String [] strArr = new String[100];
       * 
       * 
       * strArr[0]=st.nextToken();
       * 
       * System.out.println(strArr[0]);
       * 
       * strArr[1]=st.nextToken();
       * 
       * System.out.println(strArr[1]);
       */

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
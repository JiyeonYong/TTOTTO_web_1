<%@page import="com.ttotto.kakao.controller.KakaoIdViewServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ttotto.kakao.model.dao.KakaoDao"%>
<%@page import="com.ttotto.kakao.model.vo.KakaoTalk"%>
<%@page import="com.ttotto.kakao.model.vo.KakaoTalkId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	KakaoTalkId k = new KakaoTalkId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.bubbleRight 
{
position: relative;
width: 105px;
height: 50px;
padding: 5px;
background: #FFFFFF;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
border: #7F7F7F solid 5px;
}

.bubbleRight:after 
{
content: '';
position: absolute;
border-style: solid;
border-width: 7px 0 7px 15px;
border-color: transparent #FFFFFF;
display: block;
width: 0;
z-index: 1;
right: -15px;
top: 12px;
}

.bubbleRight:before 
{
content: '';
position: absolute;
border-style: solid;
border-width: 11px 0 11px 19px;
border-color: transparent #7F7F7F;
display: block;
width: 0;
z-index: 0;
right: -24px;
top: 8px;
}

.bubbleLeft 
{
position: relative;
width: 105px;
height: 50px;
padding: 5px;
background: #FFFFFF;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
border-radius: 10px;
border: #7F7F7F solid 5px;
}



.bubbleLeft:after 
{
content: '';
position: absolute;
border-style: solid;
border-width: 7px 15px 7px 0px;
border-color: transparent #FFFFFF;
display: block;
width: 0;
z-index: 1;
left: -15px;
top: 12px;
}

.bubbleLeft:before 
{
content: '';
position: absolute;
border-style: solid;
border-width: 11px 19px 11px 0px;
border-color: transparent #7F7F7F;
display: block;
width: 0;
z-index: 0;
left: -24px;
top: 8px;
}





#kakao_body1-1 {
	background-color:#A6CCE6;
}   
button{
        border: #7F7F7F solid 1px;
        border-radius: 3px;
        height:30px;
        background-color:#FFF612;
}
</style>
</head>
<body>
<center>

<div style="width:1300px; height:500px">

<!-- 카카오톡 아이디 변경 툴 -->

	<div id="kakao_id_tool" style="height:500px; width:25%; border:2px solid black; float:left; data-toogle:drop-down; background-color:white; box-sizing: border-box;" >
		<div id="idTool_header" name="teamIcon" style="float:left; width:100%; hegiht:20%; border:2px solid blue; box-sizing: border-box;">
			<div name="closeBtnDiv" style="width:100%; height:20%; float:left; border:2px solid yellow; box-sizing: border-box;">	
				<button id="xBtn" onclick="return id_tool_close();"name="idToolCloseBtn" style="float:right">x</button>
			</div>	
			<div name="teamImgDiv" style="width:100%; height:20%; float:left; border:2px solid pink; box-sizing: border-box;">
			<img src="../../img/kakao%20profile.png" style="width:80px; height:80px; box-sizing: border-box; border-radius: 40px; ">
			</div>		
			<div name="teamMemberCount" style="width:100%; height:10%; float:left; border:2px solid pink; box-sizing: border-box; color:grey">
				0명
			</div>		
			
			<div name="editDiv" style="width:100%; height:10%; float:left; border:2px solid pink; box-sizing: border-box; color:grey">
				<img src="../../img/edit.PNG" style="width:50px; height:50px; box-sizing: border-box; border-radius: 50px; ">
			</div>
			<div style="border:3px solid blue; width:100%; height:100%;">
				<%
				ArrayList<KakaoTalkId> kakaoIdList = new ArrayList<KakaoTalkId>();
				KakaoTalkId id1 = new KakaoTalkId("kh솔비","솔");				
					
					for(int i=0; i<kakaoIdList.size(); i++) {
				%>
				<div>
					<%=id1.getViewId()%><br>
				</div>
				<%  }%>
			</div>
		</div>	
	</div>	

<div id="kakao_white_space1" style="width:1%; height:100%; float:left;"></div><!-- 아이디 관리, 보여주기 사이 빈공간 -->

<!-- 카카오톡 메인 화면 -->
 <div id="kakao1" style="height:500px; width:33%; border:2px solid black; float:left; data-toogle:drop-down; background-color:#A6CCE6; box-sizing: border-box;">
 	<div id="kakao_head1" style="height:13%; width:100%; border:2px solid black float:left; background-color:#A5C3E6">
    	<div id="kakao_profile" style="width:70%; height:100%; border:1px solid black; float:left; ">
        	<a href="/kakaoIdView.do"><img name="project_icon" src="../../img/kakao%20profile.png"" style="float:left; width:50px; height:50px; margin-top:5px; margin-left:5px; border-radius: 40px;"></a>
        </div>
        
        <div id="kakao_menu" style="width:23%; height:65%; border:1px solid black; float:left;margin = 10px; padding:10px;">
        	<img src="../../img/%EA%B8%B0%EB%B3%B8%EB%B3%B4%EA%B8%B0.png" style="float:left; width:30px; height:30px;">
            <img src="../../img/%EB%AA%A8%EC%95%84%EB%B3%B4%EA%B8%B03.png" style="float :left width:30px; height:30px;">
            <img src="../../img/%EB%AA%A8%EC%95%84%EB%B3%B4%EA%B8%B02.png" style="float : left width:30px; height:30px;">
        </div>
	</div>
 	<div id="kakao_body1" style="height:87%; width:100%; border:1px solid blue; box-sizing: border-box;" >           
		<div id="kakao_body1-1" style="height:98%; width:95%; border:1px solid yellow; overflow:auto; display:inline-block; box-sizing: border-box;">
        	<div name="kakao_talkData1" style="float:right; border:1px solid black; width:100%; box-sizing: border-box;">
        	  	<div name="kakao_Contents" style="float:left; width:80%; height:80%; border:2px solid pink; box-sizing: border-box;">
            	<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px; margin-right:30px;float:right; box-sizing: border-box;">
            	<ul></ul>                
                   <div class="bubbleRight bubbleRight:after bubbleRight:before" class="text text-r" id="talkText1" style="background-color:white !important;" >                   								
						이거?
                   </div><br><br>
            	</div>
            	</div> 
        	  	<div name="kakao_profileImg" style="border:2px solid yellow; width:20%; height:60%; float:left; box-sizing: border-box;" >
             	<img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; margin-top:30px;">
             	</div>
            	<div name="kakao_id" style="border:2px solid purple; width:20%; height:40%; float:left; box-sizing:border-box;" >
            			<%= k.getViewId()%>
            	</div> 
          </div>  
            <div name="kakao_talkData2" style="float:right; border:1px solid red; width:100%"> 
                <img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; float:left; margin-top:30px; margin-left:20px;">
            	<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px;margin-left:30px; float:left">
            		<ul></ul>
                	<div style="float:right">
                    	<div class="bubbleLeft bubbleLeft:after bubbleLeft:before" class="text text-r" id="talkText2" style="background-color:white !important;" >								
								ㅋㅋ	
                    	</div><br><br>
                  	</div>
           		</div>
            </div>
	 <% // 카카오톡 말풍선 보여지기
	 System.out.println("req:" + request.getAttribute("iskakaoList"));
	 
	 if(request.getAttribute("iskakaoList")=="1"){%>
	 			
	 <%
	 	ArrayList<KakaoTalk> kakaoList = (ArrayList<KakaoTalk>)request.getAttribute("kakaoList");
	 	System.out.println(kakaoList.get(0).getContent());

	 
	 		
	 		for(int i=0; i<kakaoList.size(); i++) {
	 			
	 			if(i%2==0){
	 %>		
	 		<div name="kakao_talkData2" style="float:right; border:1px solid red; width:100%"> 
                <img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; float:left; margin-top:30px; margin-left:20px;">
            	<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px;margin-left:30px; float:left">
            		<ul></ul>
                	<div style="float:right">
                    	<div class="bubbleLeft bubbleLeft:after bubbleLeft:before" class="text text-r" id="talkText2" style="background-color:white !important;" >
									<%=kakaoList.get(i).getContent()%>
                    	</div><br><br>
                  	</div>
           		</div>
            </div>
            
            	<%}else{%>
            	
            <div name="kakao_talkData1" style="float:right; border:1px solid black; width:100%; box-sizing: border-box;">
        		<div name="kakao_Contents" style="float:left; width:80%; height:80%; border:2px solid pink; box-sizing: border-box;">
            		<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px; margin-right:30px;float:right; box-sizing: border-box;">
            			<ul></ul>                
               			<div class="bubbleRight bubbleRight:after bubbleRight:before" class="text text-r" id="talkText1" style="background-color:white !important;" >                   								
							<%=kakaoList.get(i).getContent()%>
               			 </div><br><br>
            		</div>
            	</div> 
        		<div name="kakao_profileImg" style="border:2px solid yellow; width:20%; height:60%; float:left; box-sizing: border-box;" >
             		<img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; margin-top:30px;">
          		</div>
           		<div name="kakao_id" style="border:2px solid purple; width:20%; height:40%; float:left; box-sizing:border-box;" >
            			<%= kakaoList.get(i).getDateWithTime()%>
           		</div> 
          	</div>  
            	
            	
            	
            	<%} %>
	 		<%}%>
	 <%}%>        
        </div>    
    </div>    
  </div>
 
    
    <div id="kakao_white_space2" style="width:5%; height:100%; float:left;"></div><!-- 보여주기, 붙여넣기 사이 빈공간 -->
    
    
    <!-- 카톡 붙여넣기 화면 -->
    <div id="kakao2" style="height:500px; width:30%; border:1px solid black; float:left;">
        <div id="kakao_head2" style="height:13%; width:100%; border:1px solid black; background-color:#3F0000" >
            <div id="kakao_profile" style="width:100%; height:100%; border:1px solid black; float:left;" >
            </div>
        </div>
        <form action="/paste.do" method="post" style="height:100%;">
        <div id="kakao_body2" style="height:67%; width:80%; border:1px solid blue; margin-left:10px; margin-top:25px; overflow:auto; display:inline-block;">  
            <input type="text" class="form-control" id="contents" name="kakaoString" style = "height:100%; width:100%"/>
        </div>
        <div id="kakao_footer2" style="height:10%; width:100%; border:2px;  float:left; margin-top:20px;" align="center">           
                 
        <input type="submit" style=" font-size:17px; background-color:yellow;" value="붙여넣기">
        <input type="reset" style="font-size:17px; background-color:yellow;"value="취소">
        </div>
   		</form>
    </div>
</div>
</center>

  <script>
  
	function pasteKatalk() {
		
		var conetents = document.getElementbyId("contents").value;
		
		var talkText =  document.getElementbyId("talkText");
		
		talkText.innerHTML=contents;
		
		return true;
 	}
	
	
	function idToolView() {
		 
		var kakao_id_tool = document.getElementById("kakao_id_tool");
		
		kakao_id_tool.style.display="block";
		 
		return true;
 	}
	
	function id_tool_close(){
		 
		var kakao_id_tool = document.getElementById("kakao_id_tool");
		
		kakao_id_tool.style.display="none";
		
		
		return true;
	}
	
	// 아이디툴 보여주기 안보여주기
	 <%
	 
	 if(request.getAttribute("is_id_tool")=="1"){%>
	 		<%System.out.println("여기>>>");%>
	 		idToolView();
	 		
	 <%}else{%>
	 
	 	var kakao_id_tool = document.getElementById("kakao_id_tool");
		
		kakao_id_tool.style.display="none";
	 
	 <%} %> 
 </script>
</body>
</html>
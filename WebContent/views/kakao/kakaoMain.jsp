<%@page import="com.ttotto.kakao.controller.KakaoIdViewServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ttotto.kakao.model.dao.KakaoDao"%>
<%@page import="com.ttotto.kakao.model.vo.KakaoTalk"%>
<%@page import="com.ttotto.kakao.model.vo.KakaoTalkId"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  
<title>카카오톡 모아보기</title>
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


<!--header-->
	<%@ include file="/views/layout/header.jsp"%>
	
	
	
	
	<br><br><br>
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
			
			<div  name="editDiv" style="width:100%; height:10%; float:left; border:2px solid pink; box-sizing: border-box; color:grey">
				<img src="../../img/edit.PNG" style="width:50px; height:50px; box-sizing: border-box; border-radius: 50px; ">
				<br>편집
			</div>
			
			
			<div id = "kakaoIdList" style="text-align:left">
			
			</div>
		</div>	
	</div>	
	
	
	<script>				

				
				//kakaoId 툴의 리스트를 보여주는 ajax			
				$(function(){
					$.ajax({
				
					url : "/kakaoIdList.do",
					data : {
						
					},
					type : "post",
					success : function(kakaoIdList){
						
						console.log("길이"+kakaoIdList.length);
						console.log(kakaoIdList);
						
						for(var i=0;i<kakaoIdList.length;i++)
						{
							var kakao_div=$("<div style='border:2px solid red; height:15%; width:100%; float:left; text-align:left;'></div>")
							$(kakao_div).append(
									"<a><img src='../../img/kakao%20profile.png' style='width:35px; height:35px; box-sizing: border-box; border-radius: 40px;'>"+kakaoIdList[i][0]+"</a>"									
							  )
							  
							  
							var kakao_ul = $("<ul class='hide'></ul>");
							
							  
							for(var j=1;j<kakaoIdList[i].length;j++){
									
								$(kakao_ul).append(
											"<li>"+kakaoIdList[i][j]+"</li>"
								);
						 	}
							
							
							$(kakao_div).append(				
									kakao_ul
							)
							
							$("#kakaoIdList").append(kakao_div);
						}
					},
					error : function(){
						console.log("kakaoId ajax 통신 에러");
					},
					
					complete:function(){
						
 						$("#kakaoIdList ul").slideUp()
						
						
						$("#kakaoIdList a").click(function(){
							 
							 console.log("kakaoIdList 누름");
							 var submenu = $(this).next("ul");
							 
							 if(submenu.is(":visible")){
								 submenu.slideUp();
							 }else
								 submenu.slideDown();
								 
						 });	
						
						
					}
					
					});
					
				});
				
				
</script>			
	
	
	
	

				
				
<div id="kakao_white_space1" style="width:1%; height:100%; float:left;"></div><!-- 아이디 관리, 보여주기 사이 빈공간 -->

<!-- 카카오톡 메인 화면 -->
 <div id="kakao1" style="height:500px; width:33%; border:2px solid black; float:left; data-toogle:drop-down; background-color:#A6CCE6; box-sizing: border-box;">
 	<div id="kakao_head1" style="height:13%; width:100%; border:2px solid black float:left; background-color:#A5C3E6">
    	<div id="kakao_profile" style="width:50%; height:100%; border:1px solid black; float:left; ">
        	<a href="/kakaoIdView.do"><img name="project_icon" src="../../img/kakao%20profile.png"" style="float:left; width:50px; height:50px; margin-top:5px; margin-left:5px; border-radius: 40px;"></a>
        </div>
        
        <div id="kakao_menu" style="width:35%; height:65%; border:1px solid black; float:left;margin:10px; padding:10px;">
        
        <!-- ajax이용하여 전체보기, 날짜별 모아보기, 중요도별 모아보기 기능 제공-->
        
        	<img id="allView" src="../../img/%EA%B8%B0%EB%B3%B8%EB%B3%B4%EA%B8%B0.png" style="float:left; width:35px; height:30px;">
        	
            <img id="dateView" src="../../img/%EB%AA%A8%EC%95%84%EB%B3%B4%EA%B8%B03.png" style="float :left width:35px; height:30px;">
            
            <img id="importanceView" src="../../img/%EB%AA%A8%EC%95%84%EB%B3%B4%EA%B8%B02.png" style="float : left width:35px; height:30px;">
            
        </div>
	</div>
 	<div id="kakao_body1" style="height:87%; width:100%; border:1px solid blue; box-sizing: border-box;">           
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
            			id
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
	 //System.out.println("req:" + request.getAttribute("iskakaoList"));
	 
	 if(request.getAttribute("iskakaoList")=="1"){%>
	 			
	 <%
	 	ArrayList<KakaoTalk> kakaoList = (ArrayList<KakaoTalk>)request.getAttribute("kakaoList");
	 	//System.out.println(kakaoList.get(0).getContent());

	 
	 		
	 		for(int i=0; i<kakaoList.size(); i++) {
	 			
	 			if(i%2==0){
	 %>		
	 		
	 		  <div name="kakao_talkData1" style="float:right; border:1px solid black; width:100%; box-sizing: border-box;">
        		<div name="kakao_Contents" style="float:left; width:80%; height:80%; border:2px solid pink; box-sizing: border-box;">
            		<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px; margin-right:30px;float:right; box-sizing: border-box;">
            			<ul></ul>                
               			<div id="kakao_talk_bubble1_<%=i%>" class="bubbleRight bubbleRight:after bubbleRight:before" class="text text-r" id="talkText1" style="background-color:white !important;" >                   								
							<script>
								$("#kakao_talk_bubble1_<%=i%>").append("<div id='container"+<%=i%>+"' class='container'></div>")
								
									var data_content1_1=$("<button>☆</button>");
									var data_content1_2=$("<button>☆</button>");
									var data_content1_3=$("<button>☆</buttton>");
								
									$("#container"+<%=i%>).append("<a href='#' data-toggle='popover' title='중요도 선택하기' data-content="+
											data_content1_1.html()+
											data_content1_2.html()+
											data_content1_3.html()+
											"><%=kakaoList.get(i).getContent()%></a>");
								</script>
               			 </div><br><br>
            		</div>
            	</div> 
        		<div name="kakao_profileImg" style="border:2px solid yellow; width:20%; height:60%; float:left; box-sizing: border-box;" >
             		<img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; margin-top:30px;">
          		</div>
           		<div name="kakao_id" style="border:2px solid purple; width:20%; height:40%; float:left; box-sizing:border-box;" >
            			<%= kakaoList.get(i).getInputId()%>
           		</div> 
          	  </div>   		
	 		
	 		
            
            	<%}else{%>           	
          
            	
            	
            <div name="kakao_talkData2" style="float:right; border:1px solid red; width:100%">
            	
            	<div name="kakao_Contents" style="float:right; width:80%; height:80%; border:2px solid pink; box-sizing: border-box;">
            		<div class="col-sm-3 col-sm-offset-4 frame" style=" margin-top:15px; margin-left:30px;float:left; box-sizing: border-box;">
            			<ul></ul>                
               			<div id="kakao_talk_bubble2_<%=i%>" class="bubbleLeft bubbleLeft:after bubbleLeft:before" class="text text-r" id="talkText2" style="background-color:white !important;" >                  								
														
								<script>
								$("#kakao_talk_bubble2_<%=i%>").append("<div id='container"+<%=i%>+"' class='container'></div>")
								
									var data_content2_1=$("<button>☆</button>");
									var data_content2_2=$("<button>☆</button>");
									var data_content2_3=$("<button>☆</buttton>");
								
									$("#container"+<%=i%>).append("<a href='#' data-toggle='popover' title='중요도 선택하기' data-content="+
											data_content2_1.html()+
											data_content2_2.html()+
											data_content2_3.html()+
											"><%=kakaoList.get(i).getContent()%></a>");
								</script>
								
							</div>
														
               			 
            		</div>
            	</div> 
            	
            	<div name="kakao_profileImg" style="border:2px solid yellow; width:20%; height:60%; float:left; box-sizing: border-box;" >
                	<img src="../../img/kakao%20profile.png" alt="Jane Doe" class="mr-3 mt-3 rounded-circle" style="width:55px; float:left; margin-top:30px; margin-left:10px;">
            	</div>
            	<div name="kakao_id" style="border:2px solid purple; width:20%; height:40%; float:left; box-sizing:border-box;" >
            			<%= kakaoList.get(i).getInputId()%>
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
	$(function(){
		$("#talkText1").click(function(){
			;
			
			
		});
		
				
		$("#talkText2").click(function(){
			;
			
		});
	
	});

</script>

<script>				
				//
				
				$(function(){
					
					$("#allView").click(function(){
					
						$.ajax({
				
						url : "/kakaoAllView.do",
					
						data : {
						
						},
						type : "post",
						success : function(kakaoIdList){
							
						},
					
						error : function(){
							console.log("kakaoId ajax 통신 에러");
						}
					});
					
					});
					
					$("#allView").click(function(){
						
						$.ajax({
				
						url : "/kakaoDateView.do",
					
						data : {
						
						},
						type : "post",
						success : function(kakaoIdList){
							
						},
					
						error : function(){
							console.log("kakaoId ajax 통신 에러");
						}
					});
					
					});
				
				
					$("#allView").click(function(){
						
						$.ajax({
				
						url : "/kakaoimportanceView.do",
					
						data : {
						
						},
						type : "post",
						success : function(kakaoIdList){
							
						},
					
						error : function(){
							console.log("kakaoId ajax 통신 에러");
						}
					});
					
					});
					
				});
					
</script>


<!-- 중요도 팝업 부분을 위한 메소드 및 변수들 -->
<script>

	


	$(document).ready(function(){
		
   		$('[data-toggle="popover"]').popover();  
	
		$(data_content2_1).click(function(){
	
		console.log("입력은?");
		});
		
		
	});
	
	
	
	
</script>



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
 

 	<br><br><br>
 	<%@ include file="/views/layout/footer.jsp"%>
 	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ttotto.project.model.vo.*"
    import = "java.util.ArrayList"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TTO TTO</title>
 <link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<title>TTO TTO</title>
    
    <style>
    
      .fakeimg { height: 200px; background: #aaa;}
      .card { margin-bottom: 20px;}
      a:link { color: black; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: grey; text-decoration: none;}
      
    </style>
    
</head>
    
<body>


   <%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
   <script>
   		
   		var userId = <%((Member)session.getAttribute("member")).getUserId();%>   		
   		
   		$(function(){
   			$.ajax({
   				url : "/projectList.do",
   				data : {userId:userId},
   				type : "post",
   				success :  function(list){
   					list
   					
   					
   				},
   			
   				error : function(list){
   					console.log("에러");
   				},
   			
   				complete:function(list){
   					consolse.log("리스트 가져오기 complete");
   				}
   			
   			});
   		
   		});
   		
   		
   
   </script>  --%>
    
    
    
<%
	
	ArrayList<Project> projList = (ArrayList<Project>)request.getAttribute("projectList");

	session.setAttribute("projList",projList);

	//System.out.println(list.get(0).getCreaterId());
%>

    
    <!--header-->
     <%@ include file = "/views/layout/header.jsp" %>

    <!-- body -->
    <div class="container" style="margin-top:30px">
        <div class="row">
            <!-- left section-->
            <div class="col-sm-4">
                <h4>프로젝트 만들기</h4>
                <hr>
                
               <%@ include file = "/views/project/projectCreate.jsp" %>
 
                <p style = "margin-top: 10px">새 프로젝트를 만들어 팀플을 시작하세요!</p>
                
                <br><br>
                
                <h4>진행중인 프로젝트</h4>
                <hr>
                <%if(projList==null){ %>
                	진행중인 프로젝트가 없습니다.
                <%}else{%>
                <ul class="list-group">
                	<% for(Project p : projList) { %>
                		<li class="list-group-item d-flex justify-content-between align-items-center">
                		<a href= "/views/board/board.jsp?projNo=<%=p.getProjNo()%>"> <%=p.getProjName()%> </a>
                		<form>
                			
                		</form>
                   	    </li>
                	

                		<%} %>
                	
                	<%}%>
                	
                </ul>

            </div>
            
            <!-- right section-->
            <div class="col-sm-8">
                <h3>PROJECT ISSUE</h3>
                <hr>
            
                <!-- 해당 프로젝트 링크 버튼-->
                <div class = "btn btn-outline-primary btn-sm" style = "margin-bottom: 10px"> 또또 프로젝트</div>
                <!-- 해당 프로젝트 이슈 내용-->
                <div class = "card text-center">
                    <div class = "card-header">제목 :
                        <span id = "issue-title">새 아이디어 공유</span>
                    </div>
                    
                    <div class = "card-body">
                        <div class  = "fakeimg">이미지 있으면 여기로 load</div>
                        <div>이슈 내용...</div>
                    </div>
                
                    <div class = "card-footer">
                        <span id = "issue-maker-id">bj먹방</span>
                        <span id = "issue-maker-action">님이 댓글을 달았습니다.</span>
                    </div>
                </div>
            
                <!-- 해당 프로젝트 링크 버튼-->
                <div class = "btn btn-outline-primary btn-sm" style = "margin-bottom: 10px"> 뚜뚜 팀플 </div>
                <!-- 해당 프로젝트 이슈 내용-->
                <div class = "card text-center">
                    <div class = "card-header">제목 :
                        <span id = "issue-title">bootstrap 조사</span>
                    </div>
                    
                    <div class = "card-body">
                        <div>이슈 내용...</div>
                    </div>
                    
                    <div class = "card-footer">
                        <span id = "issue-maker-id">solsol</span>
                        <span id = "issue-maker-action">님이 새 글을 작성했습니다.</span>
                    </div>
                </div>
                
                <!-- 해당 프로젝트 링크 버튼-->
                <div class = "btn btn-outline-primary btn-sm" style = "margin-bottom: 10px"> 뚜뚜 팀플 </div>
                <!-- 해당 프로젝트 이슈 내용-->
                <div class = "card text-center">
                    <div class = "card-header">제목 :
                        <span id = "issue-title">bootstrap 조사</span>
                    </div>
                    
                    <div class = "card-body">
                        <div>이슈 내용...</div>
                    </div>
                    
                    <div class = "card-footer">
                        <span id = "issue-maker-id">solsol</span>
                        <span id = "issue-maker-action">님이 새 글을 작성했습니다.</span>
                    </div>
                </div>
                
                <!-- 해당 프로젝트 링크 버튼-->
                <div class = "btn btn-outline-primary btn-sm" style = "margin-bottom: 10px"> 뚜뚜 팀플 </div>
                <!-- 해당 프로젝트 이슈 내용-->
                <div class = "card text-center">
                    <div class = "card-header">제목 :
                        <span id = "issue-title">bootstrap 조사</span>
                    </div>
                    
                    <div class = "card-body">
                        <div>이슈 내용...</div>
                    </div>
                    
                    <div class = "card-footer">
                        <span id = "issue-maker-id">solsol</span>
                        <span id = "issue-maker-action">님이 새 글을 작성했습니다.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file = "/views/layout/footer.jsp" %>
    
    
<script type = "text/javaxcript" src = "JS/bootstrap.js">

</script>
</body>
</html>
</body>
</html>
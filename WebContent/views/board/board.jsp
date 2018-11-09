<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ page import="com.ttotto.member.model.vo.*" %>
<%@ page import = "com.ttotto.project.model.vo.*"
    import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 페이지</title>
<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>




<body>

	<!--header-->
	<%@ include file="/views/layout/header.jsp" %>	
	<%@ include file="/views/layout/header_login.jsp" %>

	<%		
		int projNo = Integer.parseInt((String)request.getParameter("projNo"));
	
		session.setAttribute("projNo",projNo);
		
		ArrayList<Project> projList = (ArrayList<Project>)session.getAttribute("projList");
		
		Member member1 = (Member)session.getAttribute("member");
	
		String userId=member1.getUserId();
		
		session.setAttribute("userId",userId);
	%>




	<div class="container" style="margin-top: 30px">
		<div class="row">
			<!-- left section-->
			<div class="col-sm-4">
				<h4>게시물 만들기</h4>
				<hr>
				
				<a  href="/post.do" class="btn btn-primary"> 게시물 리스트 페이지</a>
				<p style="margin-top: 10px">새로운 이야기장을 만들어 보세요!</p>
				

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

			<!-- postList section-->
			<div class="col-sm-8">
				    <h3>게시물 작성</h3>
                <br><br>
<!-- 게시물 작성-->
                <div class="card" style="width:700px; height:550px">
  <div class="card-body">
     <form action="/postWrite.do" method="post">
    <div class="form-group" >
     
     <label for="subject">프로젝트명</label>
       
    <input type="subject" class="form-control" id="subject" name="subject" style="width:500px;" readonly>
        <a href="#" class="btn btn-primary">normal</a>  
      </div>
      
        <div class="form-group" >
        <label for="name">제목입력</label>    
     <input type="title" class="form-control" id="title" name="title" style="width:500px;">
      </div>
      
      <div class="form-group">
    <label for="exampleTextarea">내용 입력</label>
    <textarea class="form-control" id="exampleTextarea" name="contents" rows="5"></textarea>
  </div>
     
      
      

   <div class="form-group">
  <label for="fileInput">업로드 할 파일 선택(gif, jpg, png외 불가)</label><br>
     <form action="/upload.do" method="post" enctype="multipart/form-data">
   <input type="file" name="upfile" /><br>
      <!-- <input type="file" id="fileInput" name="file" accept=".gif, .jpg, .png"> -->
         
</div>
     
       <div class="center-block" style=" text-align:center" > 
           <input type="submit" value="업로드">  
           <input type="reset" value="취소"></div> 

   
  </div>
      </form>                    
</div>
				
				
				
				
				
				
				
				


			</div>
		</div>
	</div>
	

	<%@ include file="/views/layout/footer.jsp"%>
	<script type="text/javaxcript" src="JS/bootstrap.js"></script>
</body>
</html>
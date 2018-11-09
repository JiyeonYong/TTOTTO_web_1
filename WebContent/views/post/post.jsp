<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ttotto.postpost.vo.Post"
		import="java.util.ArrayList" 
		import="com.ttotto.postpost.vo.PostListData"
		import="com.ttotto.project.model.vo.*"
		import="com.ttotto.postpost.vo.Comment"%>   
		
<%	
	int projNo = (int)session.getAttribute("projNo");

	ArrayList<Post> list= (ArrayList<Post>)(request.getAttribute("postList"));
	
	ArrayList<Project> projList = (ArrayList<Project>)session.getAttribute("projList");
				
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기본페이지</title>
</head>
<body>
 
<!DOCTYPE html>
<html>
<head>
    
    
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap4 CDN방식-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>    
    <style>
    
      .fakeimg {
        height: 200px;
        background: #aaa;
      }
        
        .card {
            margin-bottom: 20px;
        }
    
      a:link { color: red; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: blue; text-decoration: underline;}
      
    </style>
</head>
    
<body>
    
  <!DOCTYPE html>
<html>
<head>
    
    
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap4 CDN방식-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <style>
    
      .fakeimg {
        height: 200px;
        background: #aaa;
      }
        
        .card {
            margin-bottom: 20px;
        }
    
      a:link { color: red; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: blue; text-decoration: underline;}
      
    </style>
</head>
    
<body>
    
<!DOCTYPE html>
<html>
<head>
    
    
    
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap4 CDN방식-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <style>
    
      .fakeimg {
        height: 200px;
        background: #aaa;
      }
        
        .card {
            margin-bottom: 20px;
        }
    
      a:link { color: red; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: blue; text-decoration: underline;}
      
    </style>
</head>
    
<body>
   

    
   	<!--header-->
	<%@ include file="/views/layout/header.jsp" %>	
	<%@ include file="/views/layout/header_login.jsp" %>
   

    <!-- body -->
    <div class="container" style="margin-top:30px">
        <div class="row" style="margin-bottom:200px">
            <!-- left section-->
            <div class="col-sm-4">
                <h4>프로젝트 만들기</h4>
                <a  href="/views/board/board.jsp?projNo=<%=projNo%>" class="btn btn-primary" style="color:white;">+ 새 게시물 작성</a>
                <p style = "margin-top: 10px">새 프로젝트를 만들어 친구들과 팀플을 시작하세요!</p>
                
                <br><br><br><br>
                
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
                
                    <!--<hr class="d-sm-none">-->
            </div>
            
 <!-- right section-->
            <div class="col-sm-8">
                <h3>게시물 리스트</h3>
                <hr>
            
               
    <!-- 해당 프로젝트 조회창-->


	<%-- <%for(Comment c : list1){ %>
		<%=c.getContents()%> 
	<%} %> --%>




    
 	<%for(Post p :list){%>
	<!-- /* 	for(Comment co :list1){ */ -->
	


	
	
    
                <div class = "card text-center">
                    <div class = "card-header"><pre>POST제목 : <%=p.getSubject()%>                 
                    						      작성자 :<%=p.getUserId()%></pre>
                     <!--    <span id = "post-title">Post 조회창</span> -->
                    </div>
                    
                    <div class = "card-body" style="height:400px">
                      
                        <div class="row" style="height:200px; width:100%">
                            
              <p>이미지<p><br>         
              <img src="cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="100" height="100"> <br>
             <img src="cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="100" height="100"><br>
            <img src="cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="100" height="100">
                        
                    </div>
                    
                     <div class="row"  style="height:180px; width:100%">
                        <%=p.getContents()%>
                       
                    </div>
                    </div>
                    <div class = "card-footer" >
             	  		<input type="hidden" name="postNo" value="<%=p.getPostNo()%>"/> 
                        <span id = "post-maker-id"><%=p.getUserId()%></span>
                      <%--   <span id = "post-maker-action"> 님: <%=co.getContents()%> </span><br> --%>
                        <!-- <span id = "post-maker-id">한솔</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span><br>
                        <span id = "post-maker-id">유진</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span><br>
                        <span id = "post-maker-id">지연</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span>
 -->                            
                    </div>
                </div>
            
            <%}%>
              <%-- <%} --%>
                <!--Todo : loadMore 버튼 구현하기-->
                <!--<div id="loadMore" style="">
                    <a href="#">Load More</a>
                </div>-->
            </div>
        </div>
    </div>
    
    
    <!-- footer -->
    <div class="jumbotron text-center" style="margin-bottom:0px">
        <p>TTO TTO Project</p>
    </div>
</body>
</html>
 
</body>
</html>
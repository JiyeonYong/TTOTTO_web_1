<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ttotto.postpost.vo.Post"
		import="java.util.ArrayList" 
		import="com.ttotto.postpost.vo.PostListData"
		import="com.ttotto.postpost.vo.Comment"%>   
		
<%
	PostListData pld = (PostListData)request.getAttribute("PostListData");

	ArrayList<Post> list= pld.getList();
	ArrayList<Comment> list1 = pld.getList1();
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
    <div class="jumbotron text-center" style="margin-bottom: 0; margin-top: 0">
        <h1>TTO TTO</h1>
        <p>팀프로젝트 함께 하자!</p> 
    </div>

    
    <!--nav-->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
        <a class="navbar-brand" href="#" style = "margin-left: 10px">
            <img src = "/img/logo_sample3.png" style = "width:40px; height:40px"/>
        </a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar" style = "margin-top: 0">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="collapsibleNavbar">   
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                <a class="nav-link" href="#">MyPage</a>
                </li>   
            
            </ul>
      
            <!--search-->
            <form class="form-inline my-2 my-lg-0" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="프로젝트를 찾아보세요!">
                <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            
        </div> 
    </nav>

    <!-- body -->
    <div class="container" style="margin-top:30px">
        <div class="row" style="margin-bottom:200px">
            <!-- left section-->
            <div class="col-sm-4">
                <h4>프로젝트 만들기</h4>
                <button id = "createProjectBtn" type = "button" class = "btn btn-primary">+ NEW 프로젝트</button>
                <p style = "margin-top: 10px">새 프로젝트를 만들어 친구들과 팀플을 시작하세요!</p>
                
                <br><br><br><br>
                
                <h4>진행중인 프로젝트</h4>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a href = "#">또또 프로젝트 </a>
                    <!-- 해당 프로젝트에 최근 이슈(새 댓글,게시글 등) 몇개 있는지 알려주는 badge-->
                    <span class="badge badge-primary badge-pill">12</span>
                    </li>
                    
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a href= "#">뚜뚜 팀플</a>
                    <span class="badge badge-primary badge-pill">50</span>
                    </li>
                    
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                    <a href= "#">어사출또 개발 프로젝트</a>
                    <span class="badge badge-primary badge-pill">99</span>
                    </li>
                    </ul>
        
                    <!--<hr class="d-sm-none">-->
            </div>
            
 <!-- right section-->
            <div class="col-sm-8">
                <h3>POST 조회창</h3>
                <hr>
            
               
    <!-- 해당 프로젝트 조회창-->


	<%for(Comment c : list1){ %>
		<%=c.getContents()%> 
	<%} %>




    
	<%for(Post p :list){
		for(Comment co :list1){
	
	%>    
	

	
	
    
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
                        <span id = "post-maker-action"> 님: <%=co.getContents()%> </span><br>
                        <!-- <span id = "post-maker-id">한솔</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span><br>
                        <span id = "post-maker-id">유진</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span><br>
                        <span id = "post-maker-id">지연</span>
                        <span id = "post-maker-action">님이 댓글을 달았습니다.</span>
 -->                            
                    </div>
                </div>
            
              <%} %>
              <%} %>
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
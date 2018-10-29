<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!--header-->
    <%@ include file = "/views/layout/header.jsp" %>

    <!-- body -->
    <div class="container" style="margin-top:30px">
        <div class="row">
            <!-- left section-->
            <div class="col-sm-4">
                <h4>프로젝트 만들기</h4>
                <button id = "createProjectBtn" type = "button" class = "btn btn-primary">+ NEW 프로젝트</button>
                <p style = "margin-top: 10px">새 프로젝트를 만들어 친구들과 팀플을 시작하세요!</p>
                
                <br><br>
                
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
                
                <!--Todo : loadMore 버튼 구현하기-->
                <!--<div id="loadMore" style="">
                    <a href="#">Load More</a>
                </div>-->
            </div>
        </div>
    </div>
    
    <%@ include file = "/views/layout/footer.jsp" %>
    
    
<script type = "text/javaxcript" src = "JS/bootstrap.js"></script>
</body>
</html>
</body>
</html>
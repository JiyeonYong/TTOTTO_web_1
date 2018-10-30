<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ttotto.member.model.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TTO TTO </title>
 <link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>
<head>
    
    <style>
    
      .fakeimg { height: 200px; background: #aaa;}
      .card { margin-bottom: 20px;}
      a:link { color: black; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: grey; text-decoration: none;}
      
    </style>
    
</head>
    
<body>
    

<%
	session = request.getSession(false);
	
	if(session.getAttribute("member") != null){ // 로그인 성공 시
		Member member = (Member)session.getAttribute("member");
%>
	<script>
	location.href= "views/project/projectList.jsp";
	</script>
	
<% }else{%>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>TTO TTO</h1>
</div>
 
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">TTOTTO</a> <!--로고들어갈자리-->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar"> 
    </div>  
    <div class="pull-right">
        <form class="form-inline pull-right" action="/action_page.php">
            <input class="form-control mr-sm-2" type="text" placeholder="(공개프로젝트만)">
            <button class="btn btn-success" type="submit">검색</button>
        </form>
    </div>
</nav>

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-6">
      <h2>이미 계정이 있다면?</h2>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="btn btn-primary" href="/views/member/login.html">로그인</a>
        </li>
      </ul>
    </div>
    <div class="col-sm-6">
      <h2>회원가입</h2>
  <form action="/enroll.do" method="post">
    <div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" id="id" placeholder="아이디 입력" name="userId">
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호 입력" name="userPwd">
    </div>
    <div class="form-group">
      <label for="Name">Name</label>
      <input type="text" class="form-control" id="name" placeholder="이름 입력" name="userName">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" placeholder="이메일 입력" name="userEmail">
    </div>
    <div class="form-group">
      <label for="phone">Phone</label>
      <input type="text" class="form-control" id="phone" placeholder="전화번호 입력" name="Phone">
    </div>
    <a href="#">이메일 확인</a><br><br>
    <button type="submit" class="btn btn-primary">회원가입</button>
  </form>
</div>

    </div>
  </div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>


<% } %>   
<script type = "text/javaxcript" src = "JS/bootstrap.js"></script>
</body>
</html>
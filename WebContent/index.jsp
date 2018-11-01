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

<script>
	function idCheck(){
		var userId = document.getElementById("userId").value;
		window.open("/views/member/idCheck.jsp?userId="+userId ,"_blank","width=500px,height=100px");
		
		return false;
	}
</script>

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
        <input type="text" class="form-control" id="userId" placeholder="아이디 입력" name="userId"> 
    </div>
    <div class="form-group">
    	<button type="button" class="btn btn-outline-dark" onclick="return idCheck();">ID 중복확인</button>
        <input type="hidden" class="form-control" id="checkFlag" value=0>
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="userPwd">
    </div>
    <div class="form-group">
      <label for="Name">Name</label>
      <input type="text" class="form-control" id="userName" placeholder="이름 입력" name="userName">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="userEmail" placeholder="이메일 입력" name="userEmail">
    </div>
    <div class="form-group">
      <label for="phone">Phone</label>
      <input type="text" class="form-control" id="Phone" placeholder="전화번호 입력 ('-'없이 입력해 주세요)" name="Phone">
    </div><br>
    <button type="submit" class="btn btn-primary" onclick="return check();">회원가입</button>
  </form>
</div>

    </div>
  </div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>


<% } %>  

<script>
	function check(){
		
		var checkFlag = document.getElementById("checkFlag").value;
		var userId = document.getElementById("userId").value;
		var userPwd = document.getElementById("userPwd").value;
		var userName = document.getElementById("userName").value;
		var userEmail = document.getElementById("userEmail").value;
		var userPhone = document.getElementById("Phone").value;
		if(checkFlag==0){
			alert("ID 중복확인을 먼저 진행해 주세요");
			return false;
		}
		else if(userId == ""){
			alert("ID를 입력해 주세요");
			return false;
		}
		else if(userPwd == ""){
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		else if(userName == ""){
			alert("이름을 입력해 주세요");
			return false;
		}
		else if(userEmail == ""){
			alert("이메일을 입력해 주세요");
			return false;
		}
		else if(userPhone == ""){
			alert("전화번호를 입력해 주세요");
			return false;
		}
	}
</script>
 
<script type = "text/javaxcript" src = "JS/bootstrap.js"></script>
</body>
</html>
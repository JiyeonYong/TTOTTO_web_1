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
	location.href= "/views/project/projectList.jsp";
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
    <div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" id="userId" placeholder="아이디 입력" name="userId">
    </div>
    <div class="form-group">
    	<button type="button" class="btn btn-outline-dark" id="check">ID 중복확인</button>
    	<span style="float:left;" id="idCheckText"></span>
        <input type="hidden" class="form-control" id="checkFlag" value=0>
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="userPwd">
    </div>
    <div class="form-group">
      <label for="name">Name</label>
      <input type="text" class="form-control" id="userName" placeholder="이름  입력" name="userName">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="userEmail" placeholder="이메일 입력" name="userEmail">
    </div>
    <div class="form-group">
      <label for="phone">Phone</label>
      <input type="text" class="form-control" id="Phone" placeholder="전화번호 입력" name="Phone">
    </div>
    <button type="submit" class="btn btn-primary" onclick="return check();" id="enroll">회원가입</button>
    
</div>

    </div>
  </div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>


<% } %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery 선언 -->

<script>
$(function(){
	$("#check").click(function(){
		var userId = $("#userId").val();
		var idCheckText = $("#idCheckText");
		$.ajax({
			url : "/check.do",
			data : {userId:userId},
			type : "post",
			success : function(isUserId){
				var isUserId = isUserId;
				//console.log(typeof(isUserId)+" / "+isUserId);
				if(isUserId == "true"){
					idCheckText.html("&nbsp;중복된 ID가 있습니다.");
					idCheckText.attr("style","color:red");
					
				}
				else{
					idCheckText.html("&nbsp;사용 가능한 ID 입니다.");
					idCheckText.attr("style","color:blue");
				}
			},
			error : function(){
				alert("문제가 발생하였습니다. 지속적으로 문제 발생 시 관리자에게 문의 바랍니다.");
			}
		});
	});
	$("#enroll").click(function(){
		var userId = $("#userId").val();
		var userPwd = $("#userPwd").val();
		var userName = $("#userName").val();
		var userEmail = $("#userEmail").val();
		var Phone = $("#Phone").val();
		
		if(userId==""){
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
		else if(Phone == ""){
			alert("전화번호를 입력해 주세요");
			return false;
		}
		
		$.ajax({
			url : "/enroll.do",
			type : "post",
			data : {userId:userId,userPwd:userPwd,userName:userName,userEmail:userEmail,Phone:Phone},
			success : function(result){
				if(result==1){
					alert("회원가입 완료");
				}
				else if(result==0){
					alert("회원가입 실패");
				}
			} ,
			error : function(){
				alert("문제가 발생하였습니다. 지속적으로 문제 발생 시 관리자에게 문의 바랍니다.");
			}
		});
	});
});
</script>
 
<script type = "text/javaxcript" src = "JS/bootstrap.js"></script>
</body>
</html>
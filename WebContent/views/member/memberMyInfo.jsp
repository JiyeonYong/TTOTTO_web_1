<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ttotto.member.model.vo.*" %>
    <%@ page import="com.ttotto.member.model.service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
</head>
<body>
<%
	// DB에서 데이터를 가져와야 하는 작업
	// 1. 세션을 이용하여 해당 유저의 ID값을 추출
	session = request.getSession(false);
	Member member = (Member)session.getAttribute("member");
	
	// 1-1. 이전 페이지에서 입력한 비밀번호와 세션에 있는 비밀번호를 확인하는 작업
	String userPwd = request.getParameter("userPwd");
	Member m = (Member)request.getAttribute("member");
	
	if(userPwd.equals(member.getUserPwd())){ // 비밀번호

%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

     <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    
    <script>
    	function leave(){
        	var result = window.confirm("정말로 탈퇴하시겠습니까?");
        if(result==true){
           	 var password = window.prompt("비밀번호 입력");
            	document.getElementById("password").value = password;
           	 return true;
        }
        else{
            alert("취소되었습니다.");
            return false;
        }
            
    }
    </script>
    
    <div class="jumbotron text-center" style="margin-bottom:0">
  <h1>TTOTTO</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">TTOTTO</a>
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
        <h2>비밀번호 수정</h2>
        <form action="/infoUpdate.do" method="post">
        <div class="form-group">
            <label for="pwd">Password</label>
            <input type="password" class="form-control" id="userPwd" placeholder="(수정할 비밀번호 입력)" name="userPwd" value="<%=member.getUserPwd() %>">
            </div>
        <div class="form-group">
                <input type="password" class="form-control" id="userPwd_re" placeholder="(수정할 비밀번호 확인입력)" value="<%=member.getUserPwd()%>">
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="phone" class="form-control" id="phone" placeholder="전화번호 입력" name="phone" value="<%=member.getPhone() %>">
        </div>
          <button type="submit" class="btn btn-primary">수정하기</button>
          <button type="reset" class="btn btn-primary">취소</button>
    </form>
    </div>
    <div class="col-sm-6">
      <h2>회원탈퇴</h2>
      <form action="/mdelete.do" method="post">
      	<input type="hidden" id="password" name="password"/>
        <button type="submit" class="btn btn-primary" onclick="return leave();">탈퇴하기</button>
    </form>
    </div>
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>
<% } else { %>
	<script>
		alert("비밀번호를 재확인 해주세요!");
		location.href="/index.jsp";
	</script>

<% } %>

    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ttotto.member.model.vo.*" %>
    <%@ page import="com.ttotto.member.model.service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    /* The image used */
    background-image: url("/img/top.jpg");

    /* Full height */
    height: 35%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.caption {
  position: absolute;
  left: 0;
  top: 20%;
  width: 100%;
  text-align: center;
  color: #000;
}

.caption span.mainTitle {
 /*  background-color: #fff; */
  color: #000;
  padding: 10PX;
  font-size: 45px;
  letter-spacing: 10px;
}

.border{
	border : 1px solid black ;
}

/* h3 {
  letter-spacing: 5px;
  text-transform: uppercase;
  font: 20px "Lato", sans-serif;
  color: #111;
} */

#loginStatusNav {
    padding: 0px;
}
</style>
<title>My Page</title>
</head>
<body>
<%
	// DB에서 데이터를 가져와야 하는 작업
	// 1. 세션을 이용하여 해당 유저의 ID값을 추출
	session = request.getSession(false);
	Member member = (Member)session.getAttribute("member");
	
	// 1-1. 이전 페이지에서 입력한 비밀번호와 세션에 있는 비밀번호를 확인하는 작업
	String userPwd = request.getParameter("password");
	System.out.println(userPwd);
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

	<!-- 멤버 객체 중복때문에 header구현 -->
    
    <% if(member != null) { %>
	<nav id = "loginStatusNav" class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-end">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class = "nav-link"><%=member.getUserName() %>님 환영합니다!</a>
			</li>
			<li class="nav-item">
				<a Class="nav-link" href="/views/member/passCheckInfo.jsp">MyPage</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/logout.do">logout</a>
			</li>
			<% } %>
		</ul>
	</nav>
	
	<!--header-->
	
    <div class = "bg">
    	<div class="caption">
   		 <span class="mainTitle">TTO TTO</span><br>
    	</div>
  </div>
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
                	<a class="nav-link" href="/index.jsp">TTOTTO</a>
                </li>
				            
            </ul>
      
            <!--search-->
            <form class="form-inline my-2 my-lg-0" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="프로젝트를 찾아보세요!">
                <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            
        </div> 
    </nav>

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-6">
        <h3>비밀번호 수정</h3>
        <br>
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
      <h3>회원탈퇴</h3>
      <br>
        <a class="btn btn-primary" href="/views/member/passCheckDelete.jsp">탈퇴하기</a>
    </div>
  </div>
</div>


<br><br><br><br>
<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>
<% } else { %>
<script>
	location.href="/views/project/projectList.jsp";
</script>
<% } %>

    
</body>
</html>
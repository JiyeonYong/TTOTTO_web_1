<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ttotto.member.model.vo.*" %>

<%
	session = request.getSession(false);
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부에 아래와 같이 명시 -->
	<%-- <%@ include file = "/views/layout/header.jsp" %> --%>
	
	<!--header-->
	<script>
	 function info_passCheck(){
		var password = window.prompt("개인 정보 보호를 위하여 확인 차 비밀번호를 입력해 주세요.");
		document.getElementById("password").value = password;
		if(password==null){
			alert("취소되었습니다.");
			return false;
		}
 	}
	</script>

	<% if(member != null) { %>
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li><%=member.getUserName() %>님 환영합니다.</li>
			<li class="nav-item">
			<form action="/views/member/memberMyInfo.jsp" method="post">
      			<input type="hidden" id="password" name="password"/>
        		<button type="submit" class="nav-link" onclick="return info_passCheck();">MyPage</button>
    		</form>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/logout.do">logout</a>
			</li>
			<% } else { %>
			<li class="nav-item">
				<a class="nav-link" href="/views/member/login.html">Login</a>
			</li>
			<% } %>
		</ul>
	</nav>
	
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
                	<a class="nav-link" href="/projectList.do">TTOTTO</a>
                </li>
            
                <li class="nav-item">
                	<a class="nav-link" href="#">MyPage</a>
                </li>
                   
                <li>
                	<a class="nav-link" href = "/views/kakao/kakaoMain.jsp">카카오톡 모아보기</a>
                </li>
                
                <li>
                	<a class="nav-link" href = "/views/scheduler/scheduler.jsp">스케줄러</a>
                </li>
            
            </ul>
      
            <!--search-->
            <form class="form-inline my-2 my-lg-0" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="프로젝트를 찾아보세요!">
                <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            
        </div> 
    </nav>
	
	
	
</body>
</html>
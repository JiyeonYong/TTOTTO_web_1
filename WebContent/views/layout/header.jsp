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
<title>TTO TTO</title>
</head>
<body>
	<!-- 선언부에 아래와 같이 명시 -->
	<%-- <%@ include file = "/views/layout/header.jsp" %> --%>
	
	<!--header-->
	
	
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
        
        
        <%if (member != null) {%>
      	<li class="nav-item">
                	<a class="nav-link" href="/projectList.do">TTOTTO</a>
                </li>
        <%} %>
				            
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ttotto.member.model.vo.*"%>

<%
	session = request.getSession(false);
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부에 아래와 같이 명시 -->
	<%-- <%@ include file = "/views/layout/header_login.jsp" %> --%>

	
	
	<% if(member != null) { %>
	<nav class="navbar navbar-expand-sm bg-light justify-content-center">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="/views/board/boardList.jsp">프로젝트</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/views/kakao/kakaoMain.jsp">카카오톡 모아보기</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/views/scheduler/scheduler.jsp">스케줄러</a>
		</li>
		<li class="nav-item">
			<a class="nav-link disabled" href="#">기여도</a>
		</li>
	</ul>
	</nav>

	<% } %>

</body>
</html>
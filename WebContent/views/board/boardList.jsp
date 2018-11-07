<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ttotto.board.model.vo.*"
	import="java.util.ArrayList"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("boardList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>
	

		<% for (Board b : list) {%>
		<li class="list-group-item d-flex justify-content-between align-items-center">
			<a href=""><%=b.getBoardName()%></a> 
		</li>

		<%}

			if (list.isEmpty()) {
		%>
		<li class="list-group-item d-flex justify-content-between align-items-center">
			아직 만든 게시판이 없습니다.</li>
		<%
			}
		%>

	<script type="text/javaxcript" src="JS/bootstrap.js"></script>
</body>
</html>
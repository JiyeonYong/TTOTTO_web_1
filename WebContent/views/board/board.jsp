<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 페이지</title>
<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>




<body>

	<%		
		int projNo = Integer.parseInt((String)request.getParameter("projNo"));
	
		session.setAttribute("projNo",projNo);
	%>


	<!--header-->
	<%@ include file="/views/layout/header.jsp" %>
	<%@ include file="/views/layout/header_login.jsp"%>

	<div class="container" style="margin-top: 30px">
		<div class="row">
			<!-- left section-->
			<div class="col-sm-4">
				<h4>게시판 만들기</h4>
				<hr>
				<button id="createBoardBtn" type="button" class="btn btn-primary">+ NEW 게시판</button>
				<p style="margin-top: 10px">새로운 이야기장을 만들어 보세요!</p>
				

				<br><br>
			
				<h4>게시판 목록</h4>
				<hr>
				<ul class = "list-group">
				<!--  include file="/views/board/boardList.jsp"  -->
				</ul>

			</div>

			<!-- postList section-->
			<div class="col-sm-8">
				<h3>PROJECT ISSUE</h3>


			</div>
		</div>
	</div>


	<%@ include file="/views/layout/footer.jsp"%>
	<script type="text/javaxcript" src="JS/bootstrap.js"></script>
</body>
</html>
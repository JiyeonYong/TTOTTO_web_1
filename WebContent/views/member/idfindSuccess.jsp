<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ttotto.member.model.vo.*" %>

<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID find Success</title>
</head>
<body>
<script>
	alert("ID : <%=member.getUserId() %>");
	location.href="/views/member/login.html";
</script>


</body>
</html>
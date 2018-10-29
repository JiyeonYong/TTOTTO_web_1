<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.or.iei.member.model.service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
</head>
<body>
<% String checkId = request.getParameter("userId"); %>

<% 
	boolean result = new MemberService().checkId(checkId);
	// 해당 ID가 이미 존재했다면 true 전환 - 사용 불가
	// 해당 ID가 존재하지 않는다면 false 리턴 - 사용 가능
%>
<script>
	var userId = '<%=checkId%>';
	var checkFlag = 0; // 중복확인 체크
	
<% 
	if(result){
%>
	// 참일 경우 동작 코드 (참 일 때 : 해당 ID가 중복일 때)
	window.onload=function(){
		var msg = document.getElementById('msg');
		msg.innerHTML = '해당 ID는 사용 불가';
		msg.style.color='red';
		userId="";
	}
<%} else { %>
	// 거짓일 경우 동작 코드 (거짓 일 때 : 해당 ID가 중복이 아닐 때)
	window.onload=function(){
		var msg = document.getElementById('msg');
		msg.innerHTML = '해당 ID는 사용 가능';
		msg.style.color='blue';
		checkFlag = 1;
	}
<% } %>
	
	function backBtn(){
		opener.document.getElementById("userId").value = userId;
		opener.document.getElementById('checkFlag').value = checkFlag;
		window.close(); // 브라우저 종료 (내 자신 : 팝업 창)
	}
	
</script>

<center>
<span id="msg"></span> <button onclick="backBtn();">확인</button>
</center>

</body>
</html>
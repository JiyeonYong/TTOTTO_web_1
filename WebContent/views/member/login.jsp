<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

     <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 	
<title>sign_in Page</title>
<link rel="stylesheet" href="/CSS/bootstrap.css">
</head>
<body>

<!-- header  -->
<%@ include file = "/views/layout/header.jsp" %>


<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
    </div>
    <div class="col-sm-5">
      <h2>로그인</h2>
        <div class="jumbotron">
        <div class="form-group">
        <label for="id">ID</label>
        <input type="text" class="form-control" id="userId" placeholder="아이디 입력" name="userId">
        </div>
        <div class="form-group">
        <label for="pwd">Password</label>
        <input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="userPwd">
        </div>
        <button type="submit" class="btn btn-primary" id="login">로그인</button>
        <a class="btn btn-primary" href="find.jsp">아이디/비밀번호 찾기</a>
        </div>
    </div>
  </div>
</div>

<!-- footer -->
<%@ include file = "/views/layout/footer.jsp" %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery 선언 -->

<script>
	
	$(function(){
		$("#login").click(function(){
			var userId = $("#userId").val();
			var userPwd = $("#userPwd").val();
			
			if(userId == ""){
				alert("ID를 입력해 주세요.");
				return false;
			}
			else if(userPwd == ""){
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			
			$.ajax({
				url : "/login.do",
				data : {userId:userId,userPwd:userPwd},
				type : "post",
				success : function(isMember){
					if(isMember == "1"){
						alert("로그인 성공");
						location.href="/projectList.do";
					}
					else{
						alert("ID와 비밀번호를 다시 확인해 주세요.");
						$("#userId").val("");
						$("#userPwd").val("");
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
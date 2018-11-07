<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Id Password find Page</title>
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
        function find(){
              var password = window.prompt("수정할 비밀번호 입력");
              document.getElementById("password").value = password;
              return true;
        }
    </script>
    
    
<!-- header  -->
<%@ include file = "/views/layout/header.jsp" %>


<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-6">
      <h3>아이디 찾기</h3>
      <br>
      <form method="post">
        <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="idEmail" placeholder="이메일 입력" name="email">
    </div>
          <button type="submit" class="btn btn-primary" id="idCheck" onclick="return false">검색</button>
          <a class="btn btn-primary" href="/views/member/login.jsp">로그인</a>
        </form>
    </div>
    <div class="col-sm-6">
      <h3>비밀번호 찾기</h3>
   	  <br>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="pwdEmail" placeholder="이메일 입력" name="email">
        </div>
        <div class="form-group">
            <label for="pwd">Phone</label>
            <input type="phone" class="form-control" id="phone" placeholder="전화번호 입력" name="phone">
        </div>
        <input type="hidden" id="password" name="password"/>
        
        <button type="submit" class="btn btn-primary"  id="pwdCheck">비밀번호 수정</button>
   		<br><br><br><br>
    </div>
</div>
</div>

<!-- footer -->
<%@ include file = "/views/layout/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery 선언 -->

<script>
	$(function(){
		$("#idCheck").click(function(){
			var email = $("#idEmail").val();
			$.ajax({
				url : "/find_id.do",
				data : {email:email},
				type : "post",
				success : function(data){
					alert("ID : "+data);
				},
				error : function(){
					alert("문제가 발생하였습니다. 지속적으로 문제 발생 시 관리자에게 문의 바랍니다.");
				}
			});
		});
		$("#pwdCheck").click(function(){
			var email = $("#pwdEmail").val();
			var phone = $("#phone").val();
			var password = window.prompt("수정할 비밀번호 입력");
            console.log(password);
            
			$.ajax({
				url : "/find_pw.do",
				data : {email:email, phone:phone, password:password},
				type : "post",
				success : function(result){
					var result = result;
					if(result==1){
						alert("수정완료");
					}
					else if(result==0){
						alert("이메일과 전화번호를 다시 입력해주세요.");
					}
				},
				error : function(){
					alert("문제가 발생하였습니다. 지속적으로 문제 발생 시 관리자에게 문의 바랍니다.");
				}
			});
		});
	});
</script>
</body>
</html>
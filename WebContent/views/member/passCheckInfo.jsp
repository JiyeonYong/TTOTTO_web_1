<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
 <link rel="stylesheet" href="/CSS/bootstrap.css">
 
 <style>
    
      .fakeimg { height: 200px; background: #aaa;}
      .card { margin-bottom: 20px;}
      a:link { color: black; text-decoration: none;}
      a:visited { color: black; text-decoration: none;}
      a:hover { color: grey; text-decoration: none;}
      
    </style>
    
</head>
<body>
		<!--header-->
     	<%@ include file = "/views/layout/header.jsp" %>
     	
    <div class="container" style="margin-top:30px">
  		<div class="row">
  		<div class="col-sm-4">
  		</div>
    		<div class="col-sm-5">
    		<div class="jumbotron">
    		<h5>개인정보 보호를 위해 비밀번호를 입력해 주세요</h5>
    			<form action="/views/member/memberMyInfo.jsp" method="post">
    			<div class="form-group">
        			<label for="id">Password</label>
        			<input type="password" class="form-control" id="userPwd" placeholder="비밀번호 입력" name="password"><br>
        			<button type="submit" class="btn btn-primary" id="passCheck">MyPage</button>
    			</div>
    			</form>
    			</div>
    		</div>
    	</div>
    </div>
    
     	<!-- footer -->	
     	<%@ include file = "/views/layout/footer.jsp" %>

<script type = "text/javaxcript" src = "JS/bootstrap.js">

</script>

</body>
</html>
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
    			<div class="form-group">
        			<label for="id">Password</label>
        			<input type="password" class="form-control" id="password" placeholder="비밀번호 입력"><br>
        			<button type="submit" class="btn btn-primary" id="passCheck">탈퇴</button>
    			</div>
    			</div>
    		</div>
    	</div>
    </div>
    
     	<!-- footer -->	
     	<%@ include file = "/views/layout/footer.jsp" %>

<script type = "text/javaxcript" src = "JS/bootstrap.js">

</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery 선언 -->
<script>
	$(function(){
		$("#passCheck").click(function(){
			var password = $("#password").val();
			$.ajax({
				url : "/mdelete.do",
				data : {password:password},
				type: "post",
				success : function(result){
					if(result==1){
						alert("탈퇴완료");
						location.href="/index.jsp";
					}
					else{
						alert("탈퇴 실패");
						$("#password").val("");
					}
				},
				error : function(){
					
				}
			});
		});
	});
</script>
</body>
</html>
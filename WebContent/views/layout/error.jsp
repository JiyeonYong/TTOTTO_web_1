<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
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
    <div class="col-sm-12">
     <h2>Error</h2>
     <div class="fakeimg">요청하신 페이지를 찾을 수 없습니다.</div><br>
      
      
      <hr class="d-sm-none">
    </div>
    
  </div>
</div>
     	
    <!-- footer -->	
     	<%@ include file = "/views/layout/footer.jsp" %>

<script type = "text/javaxcript" src = "JS/bootstrap.js">

</script>

</body>
</html>
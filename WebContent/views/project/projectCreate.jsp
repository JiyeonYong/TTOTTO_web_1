<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.ttotto.member.model.vo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- Latest compiled and minified CSS -->

	<link rel="stylesheet" href="/CSS/bootstrap.css">

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<div class="container">
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#firstModal">+ 새 프로젝트</button>
		<form>
			<input type="hidden" id="create" value="0"/>
			<!-- The Modal -->
			<div class="modal fade" id="firstModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" id="modal1">
					<div class="progress">
						<div class="progress-bar" style="width:20%;">
						</div>
						</div>

						<!-- Modal Header -->
						<div class="modal-header">
						
							<h4 class="modal-title">
								1.프로젝트 주제를 골라보세요!<br>(해시태그 및 검색어 입력)
							</h4>

						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<input class="form-control mr-sm-2" type="text" id="HashSearch"
								placeholder="해시태그는 앞에 #를 붙여 검색하시길 바랍니다."> <br>
							<button type="button" onclick="inputHash(0);" class="btn btn-primary" id="HashBtn0">스마트 폰</button>
							<button type="button" onclick="inputHash(1);" class="btn btn-primary"id="HashBtn1">멤버쉽</button>
							<button type="button" onclick="inputHash(2);" class="btn btn-primary"id="HashBtn2">게임</button>
							<button type="button" onclick="inputHash(3);" class="btn btn-primary"id="HashBtn3">소개팅</button>
							<button type="button" onclick="inputHash(4);" class="btn btn-primary"id="HashBtn4">스터디</button>
							<br> <br>
							<button type="button" onclick="inputHash(5);" class="btn btn-primary"id="HashBtn5">운동</button>
							<button type="button" onclick="inputHash(6);" class="btn btn-primary"id="HashBtn6">SNS</button>
							<button type="button" onclick="inputHash(7);" class="btn btn-primary"id="HashBtn7">독서</button>
							<button type="button" onclick="inputHash(8);" class="btn btn-primary"id="HashBtn8">chat</button>
							<button type="button" onclick="inputHash(9);" class="btn btn-primary"id="HashBtn9">쇼핑</button>
							<br> <br>


						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target="#secondModal"
								data-dismiss="modal">Next</button>

						</div>


					</div>



				</div>
			</div>
			<div class="modal fade" id="secondModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" id="modal2">
					<div class="progress">
						<div class="progress-bar" style="width:70%;">
						</div>
						</div>
						<div class="modal-header2">
							<h4 class="modal-title2">2.프로젝트 명을 입력해주세요.</h4>
							<br>

						</div>
						<div class="modal-body">
							<input type="text" class="form-control"
								id="projectName" placeholder="(프로젝트 명을 입력해주세요.)" />
						</div>
						<hr>
						<h4 class="modal-title3">3. 프로젝트 공개 / 비공개 선택</h4>
						<pre>  <button onclick="clickPublic();" type="button" class="btn">공개</button>  <button
								onclick="clickPrivate();" type="button" class="btn">비공개</button>
					</pre>

						<div class="modal-footer">
							<button class="btn btn-secondary" data-targer="#firstModal">Pre</button>
							<button class="btn btn-secondary" data-toggle="modal"
								data-target="#thirdModal" data-dismiss="modal">Next</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="thirdModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content" id="modal2">
						<div class="modal-header3">
						<div class="progress">
						<div class="progress-bar" style="width:90%;">
						</div>
						</div>
							<h4 class="modal-title4">4.추가할 회원을 검색하세요!(생략 가능 )</h4>
							<br>

						</div>
						<div class="modal-body">
							<span class="input-group-text">@ <br> <input
								type="text" class="form-control" placeholder="UserId">
							</span>
						</div>
						<div class="modal-footer">
							<button onclick="finishCreate();" class="btn btn-secondary" data-toggle="modal"
								data-dismiss="modal">완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
<script>

	var isClickHash = new Array(10);
	
	for(var i=0;i<10;i++)
		isClickHash[i]=true;
	
	function inputHash(num){		
		
		if(isClickHash[num]){
		
		var hashSearch = document.getElementById('HashSearch').value;
		hashSearch= hashSearch + "#" +$("#HashBtn"+num).html() + " ";
		document.getElementById('HashSearch').value=hashSearch;		
		isClickHash[num]=false;
		
		}
		
	} 	
	
	
	function finishCreate(){
		
		
		$("#projNameSubmit").val($("#projectName").val());
		
		document.getElementById('projForm').submit();
		
	}
	
	function clickPrivate(){
		$("#projTypeSubmit").val("private");
	}
	
	function clickPublic(){
		$("#projTypeSubmit").val("public");
	}
	
	
</script>

<form action = "/projectCreate.do" method="post" style="display:none;" id="projForm">
<input type="text" id="projCreaterIdSubmit" name="projCreaterId"/>		<!-- 프로젝트 제작자 아이디 -->
<input type="text" id="projNameSubmit" name="projName"/>	<!-- 프로젝트명 -->
<input type="text" id="projTypeSubmit" name="projType"/>	<!-- 프로젝트 타입 -->


</form>

</body>
</html>

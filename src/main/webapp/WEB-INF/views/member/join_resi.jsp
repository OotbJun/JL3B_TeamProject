<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer {
	margin: 0 auto;
	text-align: center;
}

#xxx * {
	background-color: rgba(255, 255, 255, 0.0);
}

#xxx {
	background-color: rgba(255, 255, 255, 0.0);
}
</style>

<script type="text/javascript">

// 아이디 중복확인 가능 ajax  
var isConfirmId = false;
	function confirmId(){
		var inputValue = document.getElementById("id").value;
		
		
		var xmlhttp = new XMLHttpRequest();
		
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){	
				alert(xmlhttp.responseText);
				if(xmlhttp.responseText == 'true'){	
					isConfirmId = true;
					alert("사용 가능한 ID입니다.");
				}else{
					isConfirmId = false;
					alert("중복된 ID가 존재합니다.");
				}
			}
		};	
		xmlhttp.open("post", "./confirmId.jan" , true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("id=" + inputValue);
	}

</script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div class="container text-center" style="margin-top: 50px">
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<img
					src="${pageContext.request.contextPath }/resources/img/join-page.png">
			</div>
			<div class="col-2"></div>
		</div>
		<form action="./join_resi_process.jan" method="post">
			<div class="container mt-3">

				<div class="row mt-5">
					<!-- id -->
					<div class="col-1"></div>
					<div class="col-2">ID( e-mail)</div>
					<div class="col">
						<input placeholder="ID로 @ 사용할. 이메일" type="text" name="resi_id"
							class="form-control" id="id"><br> <input
							type="button" value="아이디확인" onclick="confirmId()">
					</div>
					<div class="col-2"></div>
					<div class="col-1"></div>
				</div>
				<div class="row mt-1">
					<!-- pw -->
					<div class="col-1"></div>
					<div class="col-2">PW</div>
					<div class="col">
						<input placeholder="사용할  password " name="resi_pw" type="password"
							class="form-control"><br>
					</div>
					<div class="col-2"></div>
					<div class="col-1"></div>
				</div>

				<div class="row mt-1">
					<!-- 이름 -->
					<div class="col-1"></div>
					<div class="col-2">이름</div>
					<div class="col">
						<input type="text" name="resi_rname" class="form-control"><br>
					</div>
					<div class="col-2"></div>
					<div class="col-1"></div>
				</div>
				<div class="row mt-1">
					<!-- 인증번호 -->
					<div class="col-1"></div>
					<div class="col-2">인증번호</div>
					<div class="col">
						<input placeholder="부여받은 인증번호 입력 reis-xxx-xxxx" name="npki_key"
							type="text" class="form-control"><br>
					</div>
					<div class="col-2"></div>
					<div class="col-1"></div>
				</div>
				<div class="row mt-1">
					<!-- 이메일 -->
					<div class="col-1"></div>
					<div class="col-2">이메일</div>
					<div class="col">
						<input placeholder="메일 수신할 이메일 등록, ID 와 동일해도 됨" type="text"
							name="resi_mail" class="form-control"><br>
					</div>
					<div class="col-2"></div>
					<div class="col-1"></div>
					<input type="hidden" value="1" name="resi_grade"> <input
						type="hidden" value="0" name="resi_point">
				</div>
				<div class="row mt-3">
					<!-- 로그인 버튼 -->
					<div class="col-3"></div>
					<div class="col-1"></div>
					<div class="col">
						<input type="submit" value="회원가입"
							class="btn btn-primary btn-block">
					</div>
					<div class="col-1"></div>
					<div class="col-3"></div>
				</div>

			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>
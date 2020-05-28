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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div class="container text-center" style="margin-top: 250px">

		<form action="./login_process.jan" method="post">
			<div class="container mt-5">
				<div class="row">
					<div class="col-3"></div>
					<div class="col text-center">
						<h1>로그인</h1>
					</div>
					<div class="col-3"></div>
				</div>
				<div class="row mt-5">
					<!-- id -->
					<div class="col-2"></div>
					<div class="col-1"></div>
					<div class="col-1">ID</div>
					<div class="col">
						<input placeholder="ID 입력" name="resi_id" type="text"
							class="form-control">
					</div>
					<div class="col-2"></div>
					<div class="col-2"></div>
				</div>
				<div class="row mt-1">
					<!-- pw -->
					<div class="col-2"></div>
					<div class="col-1"></div>
					<div class="col-1">PW</div>
					<div class="col">
						<input placeholder="password 입력해라" name="resi_pw" type="password"
							class="form-control">
					</div>
					<div class="col-2"></div>
					<div class="col-2"></div>

				</div>
				<div class="row mt-3">
					<!-- 로그인 버튼 -->
					<div class="col-3"></div>
					<div class="col-1"></div>
					<div class="col">
						<input type="submit" value="로그인" class="btn btn-primary btn-block">
					</div>
					<div class="col-1"></div>
					<div class="col-3"></div>
				</div>

			</div>
		</form>
		<!-- 가입 버튼 -->
		<div class="row mt-2">

			<div class="col-4"></div>
			<div class="col-1"></div>
			<div class="col">
				<a class="btn btn-outline-primary btn-block"
					href="./join_member_choice.jan">회원 가입</a>
			</div>
			<div class="col-1"></div>
			<div class="col-4"></div>


		</div>
	</div>


	<jsp:include page="../commons/include_footer.jsp"></jsp:include>
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
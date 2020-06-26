<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>에러 안내 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<div class="container text-center">
		<nav id="xxx" class="navbar navbar-expand-lg navbar-light pl-5">
			<div class="container">
				<a class="navbar-brand" style="margin-right: -3%"
					href="${pageContext.request.contextPath }/board/main.do"> <img
					src="${pageContext.request.contextPath }/resources/img/navi-logo.png"
					style="max-width: 75%; height: auto; margin: 0">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<ul class="nav navbar-nav pr-5">
					<li class="nav-item" style="list-style: none"><a
						class="nav-link"
						href="${pageContext.request.contextPath }/board/main.do">메인페이지</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container text-center">
		<div class="row">
			<div class="col-5">
				<img
					src="${pageContext.request.contextPath }/resources/img/error.gif"
					style="margin: 0px 0px -50px 0px; max-width: 80%; height: auto;">
			</div>
			<div class="col-5 text-left">
				<h2 style="padding-top:40%">잘못된 접근 입니다.</h2>
				<p style="border-top: solid medium; border-top-color: navy; padding-top: 2%">
				이용에 불편함을 드려 죄송합니다.
				조속한 시일 내에 해결하도록 하겠습니다.</p>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<jsp:include page="../commons/include_footer.jsp"></jsp:include>
	</footer>
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
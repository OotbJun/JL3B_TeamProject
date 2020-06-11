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
	<div class="container text-center">
		<div class="col" style="max-width: 100%; height: auto">
			<img
				src="${pageContext.request.contextPath }/resources/img/join-choice-page.png">
		</div>
	</div>


	<div class="container text-center">


		<!--메뉴 분할해서 출력해주기  -->


		<!-- 개별 메뉴 -->
		<div class="row mt-1">
			<div class="col-8" style="width: 100%">
				<a href="${pageContext.request.contextPath }/board/notice.jan"><img
					src="${pageContext.request.contextPath }/resources/img/noticepage.png"
					style="max-width: 100%; height: auto"></a>
			</div>
			<div class="col"></div>

		</div>
		<div class="mt-2"></div>
		<div class="row mt-1">
			<div class="col"></div>
			<div class="col-8">
				<a href="${pageContext.request.contextPath }/board/board.jan"><img
					src="${pageContext.request.contextPath }/resources/img/boardpage.png"
					style="max-width: 100%; height: auto"></a>
			</div>
		</div>
		<div class="mt-2">
			<div class="row mt-1">
				<div class="col-8">
					<a href="${pageContext.request.contextPath }/board/idea.jan"><img
						src="${pageContext.request.contextPath }/resources/img/ideapage.png"
						style="max-width: 100%; height: auto"></a>
				</div>
				<div class="col"></div>
			</div>
		</div>
		<div class="mt-2"></div>
		<div class="row mt-1">
			<div class="col"></div>
			<div class="col-8">
				<a href="${pageContext.request.contextPath }/vote/vote_choice.jan"><img
					src="${pageContext.request.contextPath }/resources/img/votepage.png"
					style="max-width: 100%; height: auto"></a>
			</div>
		</div>



	</div>

	<br>
	<footer class="mt-5">
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
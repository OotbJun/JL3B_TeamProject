<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

#wrap {
	min-height: 100%;
	position: relative;
}

#content {
	padding-bottom: 72px;
}

footer {
	margin-top: -72px;
	height: 72px;
	bottom: 0;
	left: 0;
	right: 0;
}

#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
	padding: 10px;
}

</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
		<div id="content">

	<div class="col mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<img
					src="${pageContext.request.contextPath }/resources/img/candyfix.png">
			</div>
			<div class="col"></div>
		</div>
	</div>
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading -->
		<h1 class="my-4">
			${round }회차 입주민 선거 <small>투표</small>
		</h1>
		<form
			action="${pageContext.request.contextPath }/vote/vote_process.do">
			<div class="row">
				<c:forEach var="candyList" items="${candyList }">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top"
								src="/upload/${candyList.candyImgList.candy_img_title}">
							<div class="card-body">
								<h4 class="card-title">
									<a
										href="${pageContext.request.contextPath }/vote/candy_read.do?candy_no=">${candyList.memberVo.member_rname }</a>
								</h4>
								<div class="card-text">${candyList.candyVo.candy_intro}</div>
								<input type="radio" value="${candyList.candyVo.candy_no}"
									name="candy_no" checked>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<c:if test=""></c:if>
			<div class="row text-center">
				<div class="col-5"></div>
				<div class="col-1">
					<input class="btn btn-outline-success" type="submit" value="투표">
				</div>
				<div class="col-4"></div>
				<div class="col-2 text-right">
					<a href="${pageContext.request.contextPath }/vote/vote_choice.do">돌아가기</a>
				</div>
			</div>
		</form>
	</div>



	<!-- /.container -->

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



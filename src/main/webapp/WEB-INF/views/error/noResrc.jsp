<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>에러 안내 페이지</title>
<style type="text/css">
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
	margin-bottom: 72px;
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
	
			<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #000000">
				<div class="container">
					<a class="navbar-brand" href="${pageContext.request.contextPath }/">Touche Nubes</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<c:choose>
						<c:when test="${!empty sessionUser || !empty sessionCenter }">
							
							<ul class="nav navbar-nav navbar-right">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <c:set var="member"
											value="${sessionUser.npki_key }"></c:set> <c:if
											test="${fn:contains(member,'admin') }">${sessionUser.member_rname }님</c:if>
										<c:if test="${fn:contains(member,'nubes-1') }">${sessionUser.member_rname }님</c:if>

										<c:set var="center" value="${sessionCenter.npki_key }"></c:set>
										<c:if test="${fn:contains(center,'center') }">${sessionCenter.center_name }님</c:if>

								</a>
									<div class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<a class="dropdown-item"
											href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
										<a class="dropdown-item"
											href="${pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
										<a class="dropdown-item"
											href="${pageContext.request.contextPath }/member/mypage.do">Something
											else here</a>
									</div>
									</li>
							</ul>
						</c:when>
						<c:otherwise>
						<ul class="nav navbar-nav pr-5">
								<li class="nav-item" style="list-style: none"><a
									class="nav-link" href="${pageContext.request.contextPath }/">메인페이지</a>
								</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		
		<div id="content">
	<div class="container text-center" style="padding-top: 100px">
		<div class="row">
			<div class="col-5">
				<img
					src="${pageContext.request.contextPath }/resources/img/error.gif"
					style="margin: 0px 0px -50px 0px; max-width: 80%; height: auto;">
			</div>
			<div class="col-5 text-left">
						<h2 style="padding-top: 40%">잘못된 페이지 입니다.</h2>
						<p
							style="border-top: solid medium; border-top-color: navy; padding-top: 2%">
							이용에 불편함을 드려 죄송합니다.<br> 주소 확인 부탁드립니다.
						</p>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
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
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
		<div class="container text-center">
		
		
			<nav id="xxx" class="navbar navbar-expand-lg navbar-light pl-5">
				<div class="container">
					<a class="navbar-brand" style="margin-right: -3%"
						href="${pageContext.request.contextPath }/"> <img
						src="${pageContext.request.contextPath }/resources/img/navi-logo.png"
						style="max-width: 75%; height: auto; margin: 0">
					</a>
				<c:if test="${!empty sessionAdmin }">
					<a class="navbar-brand" style="margin-right: -3%"
						href="${pageContext.request.contextPath }/admin/main.do"> <img
						src="${pageContext.request.contextPath }/resources/img/navi-logo.png"
						style="max-width: 75%; height: auto; margin: 0">
					</a>
				</c:if>	
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
		</div>
		<div id="content">
	<div class="container text-center">
		<div class="col" style="max-width: 100%; height: auto">
			<img
				src="${pageContext.request.contextPath }/resources/img/TEXTTOUCHE NUBES.png">
		</div>
		<div>
			<h1>잘못된 페이지 입니다</h1>
			
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
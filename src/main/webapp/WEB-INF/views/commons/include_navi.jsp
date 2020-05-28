<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="xxx" class="navbar navbar-expand-lg navbar-light mr-5 pl-5 pr-5">
	<a class="navbar-brand"
		href="${pageContext.request.contextPath }/board/main.jan">
		<img src="${pageContext.request.contextPath }/resources/img/navi-logo.png" width="100px">
		</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath }/board/main.jan">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active">
				<a class="nav-link" href="${pageContext.request.contextPath }/board/notice.jan">공지사항 <span class="sr-only">(current)</span></a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath }/board/board.jan">자유게시판</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="#">선거 </a>
			  </li>
			   <li class="nav-item">
				<a class="nav-link" href="#">공과금</a>
			  </li>

		</ul>
		<c:choose>
			<c:when test="${!empty sessionUser }">
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							${sessionUser.resi_rname }님 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/member/logout_process.jan">로그아웃</a>
							<a class="dropdown-item" href="#">마이페이지</a> <a
								class="dropdown-item" href="#">Something</a>
						</div></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li class="nav-item" style="list-style: none"><a
						class="nav-link"
						href="${pageContext.request.contextPath }/member/login.jan">로그인</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>

	</div>
</nav>


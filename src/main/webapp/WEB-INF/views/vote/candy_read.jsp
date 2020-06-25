<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<title>후보자 상세 소개</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<jsp:include page="../commons/include_navi.jsp"></jsp:include>
<body>
	<div class="col mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col" style="margin-top:4%">
				<img
					src="${pageContext.request.contextPath }/resources/img/candyfix.png">
			</div>
			<div class="col"></div>
		</div>
	</div>


	<div class="container mt-3">
		<!-- 후보 이미지 -->
		<div class="row">
			<div class="col-4" style="padding-left: 0px">
				<div class="row">
					<img style="max-width: 100%; height: auto"
						src="/upload/${readCandy.candyImgList.candy_img_title}">
				</div>
			</div>

			<!-- 후보 소개 및 공약 내용 -->
			<div class="col-8 pl-5">
				<div class="row mt-4">
					<div class="col-2"
						style="font-weight: bold; font-size: 16px; border-right: medium solid; border-right-color: #f4f4f4">
						후보자 이름</div>
					<div class="col-10 pl-5">${readCandy.memberVo.member_rname }</div>
				</div>
				<div class="row mt-5 mb-5">
					<div class="col-2"
						style="font-weight: bold; font-size: 16px; border-right: medium solid; border-right-color: #f4f4f4">
						후보자 소개</div>
					<div class="col-10 pl-5">${readCandy.candyVo.candy_intro }</div>
				</div>
				<div class="row mt-5">
					<div class="col-2"
						style="font-weight: bold; font-size: 16px; border-right: medium solid; border-right-color: #f4f4f4">
						후보자 공약</div>
					<div class="col-10 pl-5" style="word-break: break-all">${readCandy.candyVo.candy_content }</div>
				</div>
			</div>

			<!-- 메뉴 버튼 -->
			<div class="container mt-5" style="border-top: solid thick; border-top-color: #f4f4f4">
				<div class="row mt-3">
					<div class="col-1 text-left">
						<a class="btn btn-sm btn-light" type="submit"
							href="${pageContext.request.contextPath }/vote/candy.do?election_round=${round}">목록</a>
					</div>

					<div class="col-10"></div>
					<div class="col-1 text-right">
						<c:if
							test="${!empty sessionUser && sessionUser.member_no == readCandy.memberVo.member_no}">
							<a class="btn btn-sm btn-outline-info"
								href="${pageContext.request.contextPath}/vote/candy_change.do?candy_no=${readCandy.candyVo.candy_no}">수정</a>
						</c:if>
					</div>
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
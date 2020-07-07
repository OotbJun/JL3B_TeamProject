<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 공지 글읽기</title>
<style>
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
margin: 0;
	padding: 0;
}
html,body{
height:100%;
}
#wrap{
min-height: 100%;
position: relative;
}
#content{
margin-bottom: 72px;
}
footer{
margin-top:-72px;
height : 72px;
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

	<div class="col mt-4" > 
		<div class="row">
			<div class="col-1"></div>
			<div class="col text-center" style="margin-top: 4% ">
				<img
					src="${pageContext.request.contextPath }/resources/img/noticefix.png"
					style="max-width: 75%; height: auto;">
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<div class="container"
		style="margin-top: 60px; border-bottom: solid medium; border-bottom-color: #f4f4f4">
		<div class="row mt-1">
			<div class="col" style="font-size: medium; font-weight: bold;">${readNotice.noticeVo.notice_title}</div>
		</div>
		<div class="row mt-2 mb-1">
			<div class="col-1 " style="font-size: small;">
				${readNotice.memberVo.member_rname}${readNotice.adminVo.admin_name }</div>
			<div class="col"></div>
			<div class="col-1" style="font-size: small;"></div>
			<div class="col-1" style="font-size: small"></div>
			<div class="col-2" style="font-size: small">
				작성일 :
				<fmt:formatDate value="${readNotice.noticeVo.notice_wdate}"
					pattern="yyyy.MM.dd"></fmt:formatDate>
			</div>
			<div class="col-1" style="font-size: small;">조회수 :
				${readNotice.noticeVo.notice_hits}</div>
		</div>
	</div>
	<!-- 게시글 내용-->
	<div class="container" style="margin-top: 20px;">

		<div class="row mt-1">
			<div class="col" style="font-size: 20px; word-break: break-all;">${readNotice.noticeVo.notice_content}</div>
		</div>

	</div>

	<div class="container mt-5 text-right"
		style="border-top: solid thin; border-top-color: #f4f4f4">
		<div class="row">
			<!-- 마우스 올리면 주소창 뜨는 거 막음 -->
			<div class="col-2 text-left" style="padding: 4px">
				<a
					href="${pageContext.request.contextPath}/board/notice.do?currentPage=${currentPage }"
					class="btn btn-light btn-sm">목록</a>
			</div>
			<div class="col"></div>
			<div class="col-3">
				<div class="row" style="padding-top: 4px; margin-right: 4px">
					<div class="col"></div>
					<div class="col-2" style="margin-right: 4px">
						<c:if test="${sessionUser.member_grade>=2 || !empty sessionAdmin }">
							<form
								action="${pageContext.request.contextPath }/board/notice_change.do"
								method="post" class="form-control-sm" style="padding: 0px">
								<input type="hidden" name="notice_no"
									value="${readNotice.noticeVo.notice_no}"> <input
									type="hidden" name="member_no"
									value="${readNotice.noticeVo.member_no}"> <input
									type="hidden" name="currentPage" value="${currentPage }">
								<input class="btn btn-outline-info btn-sm" type="submit"
									value="수정">
							</form>
						</c:if>
					</div>
					<div class="col-2">
						<c:if test="${(sessionUser.member_grade>=2 && sessionUser.member_no==readNotice.noticeVo.member_no) || !empty sessionAdmin }">
							<form
								action="${pageContext.request.contextPath }/board/notice_delete_process.do"
								method="post" class="form-control-sm" style="padding: 0px;">

								<input type="hidden" name="notice_no"
									value="${readNotice.noticeVo.notice_no}"> <input
									type="hidden" name="member_no"
									value="${readNotice.noticeVo.member_no}"> <input
									class="btn btn-outline-danger btn-sm" type="submit" value="삭제">
							</form>
						</c:if>
					</div>
				</div>
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
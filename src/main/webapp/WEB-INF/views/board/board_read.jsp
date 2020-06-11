<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자게</title>
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

ul {
	list-style: none;
	float: left;
}

li {
	margin-left: 6px;
	float: left;
}
</style>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<div class="col mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<img
					src="${pageContext.request.contextPath }/resources/img/boardfix.png">
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="container"
		style="margin-top: 60px; border-bottom: solid thin;; border-bottom-color: #f4f4f4">
		<div class="row mt-1">
			<div class="col" style="font-size: medium; font-weight: bold;">${readBoard.boardVo.board_title}</div>
		</div>
		<div class="row mt-1 mb-1">
			<div class="col-1 " style="font-size: small;">
				${readBoard.resiVo.resi_rname}</div>
			<div class="col-1" style="font-size: small">
				<fmt:formatDate value="${readBoard.boardVo.board_wdate}"
					pattern="yyyy.MM.dd"></fmt:formatDate>
			</div>
			<div class="col"></div>
			<div class="col-1" style="font-size: small;">조회
				${readBoard.boardVo.board_hits}</div>
			<div class="col-1" style="font-size: small">댓글
				${readBoard.replyCount}</div>
			<div class="col-1" style="font-size: small;">좋아요
				${readBoard.upCount}</div>
		</div>
	</div>

	<!-- 게시글 내용 및 이미지 -->
	<div class="container" style="margin-top: 20px;">

		<c:forEach items="${readBoard.boardImgList}" var="BoardImgVo">
			<img style="max-width: 50%; height: auto"
				src="/upload/${BoardImgVo.board_img_title}">
			<br>
		</c:forEach>
		<div class="row mt-1">
			<div class="col" style="font-size: 20px;">${readBoard.boardVo.board_content }</div>
		</div>
	</div>


	<!-- 추천! -->
	<div class="container" style="margin-top: 20px;">
		<div class="row"
			style="border-bottom: solid thin; border-bottom-color: black">
			<div class="col-2"></div>
			<div class="col-8 text-center ">
				<div class="row">
					<div class="col-5"></div>
					<div class="col-2">
						<span style="color: red">${readBoard.upCount }</span> <a
							href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=Y&board_no=${readBoard.boardVo.board_no}"
							style="text-decoration: none;"> <img
							src="${pageContext.request.contextPath }/resources/img/heart.ico"
							style="width: 40%; height: auto">
						</a> <a
							href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=N&board_no=${readBoard.boardVo.board_no }">
							<img
							src="${pageContext.request.contextPath }/resources/img/sad.png"
							style="width: 25%; height: auto">
						</a> <span style="color: red">${readBoard.downCount }</span>

					</div>
					<div class="col-5"></div>
				</div>
			</div>
			<div class="col-2 text-right" style="font-size: x-small;">
				<ul>
					<li><c:set var="admin" value="${sessionUser.npki_key}"></c:set>
						<c:if
							test="${!empty sessionUser && sessionUser.resi_no == readBoard.resiVo.resi_no || fn:contains(admin, 'admin') }">
							<a
								href="${pageContext.request.contextPath}/board/board_delete_process.jan?board_no=${readBoard.boardVo.board_no}">삭제</a>
						</c:if></li>
					<li><c:if
							test="${!empty sessionUser && sessionUser.resi_no == readBoard.resiVo.resi_no}">
							<a
								href="${pageContext.request.contextPath}/board/board_change.jan?board_no=${readBoard.boardVo.board_no}">수정</a>
						</c:if></li>
					<li><c:if
							test="${!empty sessionUser && sessionUser.resi_no == readBoard.resiVo.resi_no}">
							<a
								href="${pageContext.request.contextPath}/board/delete_board_img.jan?board_no=${readBoard.boardVo.board_no}">이미지삭제</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 댓글 리스트 -->
	<div class="container"
		style="margin-top: 20px; border-bottom: solid thin;; border-bottom-color: #f4f4f4">
		<c:forEach items="${boardReplList}" var="boardReplList">
			<div class="row">
				<div class="col-2" style="font-size: large; font-weight: bold;">${boardReplList.resiVo.resi_rname }</div>
				<div class="col-8">${boardReplList.boardReVo.board_re_content }</div>
				<div class="col-2 text-right" style="font-size: small;">
					<fmt:formatDate value="${boardReplList.boardReVo.board_re_wdate }"
						pattern="yyyy-MM-dd" />
				</div>
			</div>
		</c:forEach>
		<!-- 댓글 작성 -->
		<form
			action="${pageContext.request.contextPath }/board/write_reply_process.jan">
			<div class="row mt-3">
				<!-- 댓글 입력 -->
				<div class="col-2">댓글</div>
				<div class="col-9">
					<textarea class="form-control" id="reply_content"
						name="board_re_content"></textarea>
					<input type="hidden" value="${readBoard.boardVo.board_no}"
						name="board_no">
				</div>
				<div class="col text-right" style="padding-right: 0">
					<input type="submit" class="btn btn-primary" value="작성 ">
				</div>
			</div>
		</form>
	</div>
	<div class="container text-right mt-2" style="padding: 0px">
		
			<a href="${pageContext.request.contextPath}/board/board.jan"
				class="btn btn-light">목록으로</a>
		
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="col mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col">
			<img src="${pageContext.request.contextPath }/resources/img/14.jpg" width=80%>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="container" style="margin-top: 60px">
		<div class="row">
			<div class="col">
				제목 :${readBoard.boardVo.board_title} <br> 글쓴이
				:${readBoard.resiVo.resi_rname } <br> 조회수
				:${readBoard.boardVo.board_hits } <br> 내용
				:${readBoard.boardVo.board_content } <br>

				<!-- 이미지 -->
				<c:forEach items="${readBoard.boardImgList}" var="BoardImgVo">
					<img src="/upload/${BoardImgVo.board_img_title}">
					<br>
				</c:forEach>
				<br> <br> <br>
				
				<!-- 추천! -->
				<a href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=Y&board_no=${readBoard.boardVo.board_no }">좋아요</a>
				${readBoard.upCount }
				<a href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=N&board_no=${readBoard.boardVo.board_no }">싫어요</a>
				${readBoard.downCount }
				
				
			</div>
		</div>

		<div class="row">
			<!-- 댓글 리스트 박스 -->
			<div class="col" id="reply_box">
				<!-- 리스트 컨텐트 박스 -->
				<div class="row">
					<!-- 1번 댓글 -->
					<div class="col-8">
						<!-- 닉네임 -->

					</div>
					<div class="col">
						<!-- 날짜 -->

					</div>
				</div>
				<div class="row">
					<div class="col">
						<!-- 내용 -->

					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 댓글 입력 -->
			<div class="col">댓글</div>
			<div class="col-8">
				<textarea class="form-control" id="reply_content"></textarea>
			</div>
			<div class="col">
				<input type="button" class="btn btn-primary" value="작성"
					onclick="writeReply()">
			</div>
		</div>
	</div>
	
	<br><br><br><br><br>

	<a href="${pageContext.request.contextPath}/board/board.jan">목록으로</a>
	<c:if
		test="${!empty sessionUser && sessionUser.resi_no == readBoard.resiVo.resi_no }">
		<a href="${pageContext.request.contextPath}/board/delete_board_process.jan?board_no=${readBoard.boardVo.board_no}">삭제</a>
		<a href="${pageContext.request.contextPath}/board/change_board.jan?board_no=${readBoard.boardVo.board_no}">수정</a>
	</c:if>
	
		

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
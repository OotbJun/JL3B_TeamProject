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

	제목 :${readIdea.ideaVo.idea_title}
	<br> 글쓴이 :${readIdea.resiVo.resi_rname }
	<br> 조회수 :${readIdea.ideaVo.idea_hits }
	<br> 내용 :${readIdea.ideaVo.idea_content }
	<br>
	<c:forEach items="${readIdea.ideaImgList}" var="IdeaImgVo">
		<img style="width: 60%; height: auto"
			src="/upload/${IdeaImgVo.idea_img_title}">
		<br>
	</c:forEach>

	<a href="${pageContext.request.contextPath}/board/idea.jan">목록</a>
	<c:if
		test="${!empty sessionUser && sessionUser.resi_no == readIdea.resiVo.resi_no }">
		<a
			href="${pageContext.request.contextPath}/board/idea_delete_process.jan?idea_no=${readIdea.ideaVo.idea_no}">삭제</a>
		<a
			href="${pageContext.request.contextPath}/board/idea_answer.jan?idea_no=${readIdea.ideaVo.idea_no}">답글</a>
		<a
			href="${pageContext.request.contextPath}/board/idea_change.jan?idea_no=${readIdea.ideaVo.idea_no}">수정</a>
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
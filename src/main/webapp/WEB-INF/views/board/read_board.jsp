<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	제목 :${readBoard.boardVo.board_title}<br>
	글쓴이 :${readBoard.resiVo.resi_rname }<br>
	조회수 :${readBoard.boardVo.board_hits }<br>
	내용 :${readBoard.boardVo.board_content }<br>
	<a href="${pageContext.request.contextPath}/board/board.jan">목록으로</a>
	<c:if test="${!empty sessionUser && sessionUser.resi_no == readBoard.resiVo.resi_no }">
	<a href="${pageContext.request.contextPath}/board/delete_board_process.jan?board_no=${readBoard.boardVo.board_no}">삭제</a>
	<a href="${pageContext.request.contextPath}/board/change_board.jan?board_no=${readBoard.boardVo.board_no}">수정</a>
	</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/board/change_board_process.jan" method="post">
   닉네임 :${readBoard.resiVo.resi_rname}<br>
   제목 :<input type="text" name="board_title" value="${readBoard.boardVo.board_title}"><br>
   내용  : <br>
  <textarea rows="10" cols="40" name="board_content">${readBoard.boardVo.board_content}</textarea><br> 
  <br>
  <input type="hidden" name="board_no" value="${readBoard.boardVo.board_no}">
  <input type="submit" value="수정">
</form>

</body>
</html>
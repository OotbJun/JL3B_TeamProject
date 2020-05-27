<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${pageContext.request.contextPath }/board/write_board_process.jan" method="post" enctype="multipart/form-data">
		닉네임 : ${sessionUser.resi_rname }<br>
		말머리 : ${horseheadList.horseheadVo.horsehead_sort }<br>
		제목 : <input type="text" name="board_title"><br>
		내용 : <br>
		<textarea rows="10" cols="40" name="board_content"></textarea><br>
		<input type="hidden" name="horsehead_sort" value="공지">	<!-- 말머리 수정 필요 -->
		<input type="submit" value="확인">
	</form>
	
	
</body>
</html>
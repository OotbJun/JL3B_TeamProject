<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${pageContext.request.contextPath }/board/change_notice_process.jan" method="post">
		닉네임 : ${readNotice.resiVo.resi_rname }<br>
		제목 : <input type="text" name="notice_title" value="${readNotice.noticeVo.notice_title }"><br>
		내용 : <br>
		<textarea rows="10" cols="40" name="notice_content">${readNotice.noticeVo.notice_content }</textarea>
		
		<br><br><br><br><br><br>
		
		<input type="submit" value="수정"> 
		<input type="hidden" name="notice_no" value="${readNotice.noticeVo.notice_no }">
		<a href="${pageContext.request.contextPath }/board/notice.jan">목록</a>
	</form>
	
</body>
</html>
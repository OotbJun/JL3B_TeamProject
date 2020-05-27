<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="./login_process.jan" method="post">
		ID:<input type="text" name="resi_id"><br> PW:<input type="password" name="resi_pw"><br>
		<input type="submit" value="로그인">
	</form>
	<a href="./join_resi.jan">회원가입</a>
</body>
</html>
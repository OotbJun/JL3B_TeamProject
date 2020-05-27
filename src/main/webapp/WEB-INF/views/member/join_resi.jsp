  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입</h1>

<form action="./join_resi_process.jan" method="post">
ID(E메일): <input type="text" name="resi_id"><br>
PW: <input type="password" name="resi_pw"><br>
닉네임 : <input type="text" name="resi_rname"><br>
거주민인증 : <input type="text" name="npki_key">
메일 : <input type="text" name="resi_mail">
<input type="hidden" value="1" name="resi_grade">
<input type="hidden" value="0" name="resi_point">

<input type="submit" value="회원가입"><br>

</form>
</body>
</html>
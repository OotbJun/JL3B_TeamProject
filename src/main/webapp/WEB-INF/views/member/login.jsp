<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

body {
 background-image: "${pageContext.request.contextPath }/resources/img/login.jpg"
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login2.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
 <jsp:include page="../commons/include_navi.jsp"></jsp:include>
 
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Icon -->
    <div class="fadeIn first mt-3">
      <img src="${pageContext.request.contextPath }/resources/img/navi-logo.png" id="icon" alt="User Icon" />
    </div>
    <!-- Login Form -->
   <form action="./login_process.jan" method="post" >
      <input type="text" id="login" class="fadeIn second" name="resi_id" placeholder="아이디 ">
      <input type="password" id="password" class="fadeIn third" name="resi_pw" placeholder="비밀번호">
      <input type="submit" class="fadeIn fourth" value="Log In" style="margin: 24px 20px 24px 20px">
    </form>
     <div id="formFooter">
      <a class="underlineHover" href="./join_member_choice.jan" style="text-decoration: none; color: #56baed" >회원 가입</a>
      <a class="underlineHover" href="./login_center.jan" style="text-decoration: none; color: #56baed" >센터 로그인</a>
    </div>
  </div>
</div>
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
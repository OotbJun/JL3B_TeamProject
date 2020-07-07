<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>센터 등록하기</title>
<style>
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
margin: 0;
	padding: 0;
}
html,body{
height:100%;
}
#wrap{
min-height: 100%;
position: relative;
}
#content{
margin-bottom: 72px;
}
footer{
margin-top:-72px;
height : 72px;
bottom: 0;
left: 0;
right: 0;
}
#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
	padding: 10px;
}
</style>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
   
   
</head>
<body>
<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div id="content">
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
   <div class="container" role="main" style="margin-top: 5%;">
      <h2 class="text-center" style="color: #28364a">센터등록</h2>
      <form
         action="${pageContext.request.contextPath }/center/center_write_process.do"
         method="post" enctype="multipart/form-data">
         <div class="mb-3">
            <label for="title">수강제목</label> <input type="text"
               class="form-control" name="info_pr" id="info_pr"
               placeholder="제목을 입력해 주세요" maxlength="200">
         </div>
         <div class="mb-3"></div>
         <div class="mb-3"></div>
         <div class="mb-3">
            <label for="classContent">교육소개</label>
            <textarea class="form-control" rows="10" name="info_about"
               id="info_about" placeholder="소개를 입력해주세요" maxlength="4000"></textarea>
         </div>
         <div class="mb-3">
            <div class="row mb-5">
               <div class="col">
                  <label for="tag">이미지첨부</label> <input type="file"
                     name="centerFile" multiple accept="image/*"><br>
               </div>
            </div>
            <div class="row mb-3">
               <div class="col-6">
                  <a href="${pageContext.request.contextPath }/center/center_choice.do"
                     class="btn btn-secondary btn-lg btn-block">목록으로</a>
               </div>
               <div class="col-6">
                  <input type="submit" value="확인"
                     class="btn btn-primary btn-lg btn-block">
               </div>
            </div>
         </div>
      </form>
   </div>
 </div>
	
</div>
<jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>

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


</html>
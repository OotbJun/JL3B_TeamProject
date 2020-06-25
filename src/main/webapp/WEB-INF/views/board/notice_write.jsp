<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>공지 글쓰기</title>
<style>
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

   <div class="container text-center" role="main" style="margin-top:7% " >
    <h2 class="mb-5">공지 게시판 글쓰기</h2>
    <form class="text-left" action="${pageContext.request.contextPath }/board/notice_write_process.do" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="title">제목</label>
        <input type="text" class="form-control" name="notice_title" id="title" placeholder="제목을 입력해 주세요" maxlength="50">
    </div>
    <div class="mb-3">
    </div>
    <div class="mb-3">
    </div>
     <div class="mb-3">
       <label for="content">글내용</label>
         <textarea class="form-control" rows="10" cols="40" name="notice_content" id="content" placeholder="내용을 입력해 주세요" maxlength="4000"></textarea>
    </div>
    <div class="mb-3">
        <div class="row mb-5">
        <div class="col">
             
        </div>
         </div>
         <div class="row mb-3">
        <div class="col-8"></div>
        <div class="col-2">
          <a href="${pageContext.request.contextPath }/board/notice.do" class="btn btn-secondary btn-lg btn-block">목록으로</a>
        </div>
        <div class="col-2">
          <input type="submit" value="확인" class="btn btn-primary btn-lg btn-block">
        </div>
       </div>
    </div>
   </form>
   </div>
   	<jsp:include page="../commons/include_footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
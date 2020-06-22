<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 공지 글읽기</title>
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

ul {
   list-style: none;
   float: left;
}

li {
   margin-left: 6px;
   float: left;
}
</style>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>
<body>
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>
   <div class="col mt-4">
      <div class="row">
         <div class="col-1"></div>
         <div class="col text-center">
            <img
               src="${pageContext.request.contextPath }/resources/img/noticefix.png"  style="max-width: 75%; height: auto;">
         </div>
         <div class="col-1"></div>
      </div>
   </div>
   <div class="container"
      style="margin-top: 60px; border-bottom: solid thin;; border-bottom-color: #f4f4f4">
      <div class="row mt-1">
         <div class="col" style="font-size: medium; font-weight: bold;">${readNotice.noticeVo.notice_title}</div>
      </div>
      <div class="row mt-1 mb-1">
         <div class="col-1 " style="font-size: small;">
            ${readNotice.resiVo.resi_rname}</div>
         <div class="col-1" style="font-size: small">
            <fmt:formatDate value="${readBoard.boardVo.board_wdate}"
               pattern="yyyy.MM.dd"></fmt:formatDate>
         </div>
         <div class="col"></div>
         <div class="col-1" style="font-size: small;">조회
            ${readNotice.noticeVo.notice_hits}</div>
         <div class="col-2" style="font-size: small">말머리 :
            ${readNotice.horseheadVo.horsehead_title }</div>
         <div class="col-1" style="font-size: small;"></div>
      </div>
   </div>
   <!-- 게시글 내용-->
   <div class="container" style="margin-top: 20px;">

      
      <div class="row mt-1">
         <div class="col" style="font-size: 20px;white-space: pre-line; ">${readNotice.noticeVo.notice_content}</div>
      </div>
   </div>
   <div class="container" style="margin-top: 20px;">
   <c:set var="admin" value="${sessionUser.npki_key}"></c:set>
      <c:if test="${fn:contains(admin,'admin')}">
      
      <!-- 마우스 올리면 주소창 뜨는 거 막음 -->
   <form action="${pageContext.request.contextPath }/board/notice_delete_process.jan" method="post">
      
      <input type="hidden" name="notice_no" value="${readNotice.noticeVo.notice_no}">
      <input type="hidden" name="resi_no" value="${readNotice.noticeVo.resi_no}">
      <input class="btn btn-outline-danger" type="submit" value="삭제">
      
   </form>   
   </c:if>
	
	<c:set var="admin" value="${sessionUser.npki_key}"></c:set>
      <c:if test="${fn:contains(admin,'admin')}">	
		<form action="${pageContext.request.contextPath }/board/notice_change.jan" method="post">
			<input type="hidden" name="notice_no" value="${readNotice.noticeVo.notice_no}">
      		<input type="hidden" name="resi_no" value="${readNotice.noticeVo.resi_no}">
      		<input type="hidden" name="currentPage" value="${currentPage }">
      		<input class="btn btn-outline-info" type="submit" value="수정">
		</form>
	</c:if>	
		
   </div>

   <div class="container text-right mt-2" style="padding: 0px">
      
         <a href="${pageContext.request.contextPath}/board/notice.jan?currentPage=${currentPage }"
            class="btn btn-light">목록으로</a>
      
   </div>   

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
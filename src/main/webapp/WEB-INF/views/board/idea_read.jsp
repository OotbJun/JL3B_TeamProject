<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청원 글읽기</title>
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
			<div class="col"></div>
			<div class="col">
				<img
					src="${pageContext.request.contextPath }/resources/img/ideafix.png">
			</div>
			<div class="col"></div>
		</div>
	</div>


   <div class="container"
      style="margin-top: 60px; border-bottom: solid medium; border-bottom-color: #f4f4f4">
      <div class="row mt-1"
         style="border-bottom: solid thin; border-bottom-color: #f4f4f4">
         <div class="col" style="font-size: medium; font-weight: bold;">${readIdea.ideaVo.idea_title}</div>
      </div>
      <div class="row mt-1 mb-1">
         <div class="col-1 " style="font-size: small;">
            ${readIdea.resiVo.resi_rname }</div>
         <div class="col-1" style="font-size: small">
            <fmt:formatDate value="${readBoard.boardVo.board_wdate}"
               pattern="yyyy.MM.dd"></fmt:formatDate>
         </div>
         <div class="col"></div>
         <div class="col-1" style="font-size: small;">조회수
            ${readIdea.ideaVo.idea_hits }</div>
         <div class="col-1" style="font-size: small">댓글
            ${readIdea.replyCount}</div>
         <div class="col-1" style="font-size: small;">좋아요
            ${readIdea.upCount}</div>
      </div>
   </div>

   <!-- 게시글 내용 및 이미지 -->
   <div class="container" style="margin-top: 20px;">

      <c:forEach items="${readIdea.ideaImgList}" var="IdeaImgVo">
         <img style="width: 60%; height: auto"
            src="/upload/${IdeaImgVo.idea_img_title}">
         <br>
      </c:forEach>
      <div class="row mt-1">
         <div class="col" style="font-size: 20px;">${readIdea.ideaVo.idea_content }</div>
      </div>
   </div>


   <!-- 추천! -->
   <div class="container" style="margin-top: 20px;">
      <div class="row"
         style="border-bottom: solid threedshadow; border-bottom-color: #f4f4f4">
         <div class="col-2"></div>
         <div class="col-8 text-center ">
            <div class="row">
               <div class="col-4"></div>
               <div class="col-4" style="padding: 0%">

                  <a
                     href="${pageContext.request.contextPath }/board/choose_idea_like_process.jan?idea_like=Y&idea_no=${readIdea.ideaVo.idea_no }">청원</a>
                  ${readIdea.upCount }


               </div>
               <div class="col-4"></div>
            </div>
         </div>
         <div class="col-2 text-right" style="font-size: x-small;">

            <!-- 관리자만 삭제 가능 -->
            <c:set var="admin" value="${sessionUser.npki_key}"></c:set>

            <c:if test="${fn:contains(admin,'admin')}">
               <a
                  href="${pageContext.request.contextPath}/board/idea_delete_process.jan?idea_no=${readIdea.ideaVo.idea_no}">삭제</a>
               <a
                  href="${pageContext.request.contextPath}/board/idea_answer.jan?idea_no=${readIdea.ideaVo.idea_no}">답글</a>
               <a
                  href="${pageContext.request.contextPath}/board/idea_change.jan?idea_no=${readIdea.ideaVo.idea_no}">수정</a>
            </c:if>
         </div>
      </div>
   </div>


   <!-- 댓글 리스트 -->
   <div class="container" style="margin-top: 20px;">

      <c:forEach items="${boardReplList}" var="boardReplList">
         <div class="row">
            <div class="col-2" style="font-size: large; font-weight: bold;">${boardReplList.resiVo.resi_rname }</div>
            <div class="col-8">${boardReplList.boardReVo.board_re_content }</div>
            <div class="col-2 text-right" style="font-size: small;">
               <fmt:formatDate value="${boardReplList.boardReVo.board_re_wdate }"
                  pattern="yyyy-MM-dd" />
            </div>
         </div>
      </c:forEach>

      <!-- 댓글 작성 -->
   </div>
   <div class="container">
      <div class="row">
         <div class=col-9></div>
         <div class="col-2">
           <a href="${pageContext.request.contextPath}/board/idea_answer.jan?idea_no=${readIdea.ideaVo.idea_no}"
               class="btn btn-light">답글달기</a>
         </div>
         <div class="col-1" style="padding: 0px">
            <a href="${pageContext.request.contextPath}/board/idea.jan"
               class="btn btn-light">목록으로</a>
         </div>
    </div>
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
</html>
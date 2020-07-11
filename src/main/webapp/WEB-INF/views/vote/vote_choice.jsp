<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

#wrap {
	min-height: 100%;
	position: relative;
}

#content {
	padding-bottom: 72px;
}

footer {
	margin-top: -72px;
	height: 72px;
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

<body style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
		<div id="content">
   <div class="container text-center" style="margin-top: 100px">

      <div id="ViewTimer"></div>

      <div class="row" style="margin: 0 auto; text-align: center;">
         <div class="col">
            <img
               src="${pageContext.request.contextPath }/resources/img/join-choice-page.png">
         </div>
      </div>
      <div class="col">

         <c:if test="${empty status || status.equals('E_END') }"><h1>현재 진행중인 선거가 없습니다.</h1></c:if>
         <!-- admin만 가능 -->
         <!-- 관리자 페이지에서 하자 
         <c:if test="${!status.equals('C_ING') && !status.equals('V_ING') }">
            <div class="row">
               <div class="col text-center">
                  <div class="col-md-12 text-center">
                     <a href="${pageContext.request.contextPath }/vote/vote_start.do"><img
                        src="${pageContext.request.contextPath }/resources/img/newVote.png"
                        style="max-width: 800px; height: auto"></a>
                  </div>
               </div>
            </div>
         </c:if>
		-->

         <c:if
            test="${!empty round && !empty sessionUser && status.equals('C_ING') && sessionUser.member_no != candyVo.member_no }">
            <div class="row">
               <div class="col text-center mt-5">
                  <div class="col-md-12 text-center">
                     <a
                        href="${pageContext.request.contextPath }/vote/candy_write.do">

                        <img
                        src="${pageContext.request.contextPath }/resources/img/resiCandy.png"
                        style="max-width: 45%; height: auto">
                     </a>
                  </div>
               </div>
            </div>
         </c:if>

         <div class="row">
            <div class="col text-center mt-5">
               <div class="col-md-12 text-center">
                  <c:if
                     test="${!empty round && !empty sessionUser && !status.equals('E_END') }">
                     <!-- 회차 있어야 출력됨. -->
                     <a
                        href="${pageContext.request.contextPath }/vote/candy.do?election_round=${round}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/candyList.png"
                        style="max-width: 45%; height: auto">
                     </a>
                  </c:if>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col text-center mt-5">
               <div class="col-md-12 text-center">
                  <c:if
                     test="${!empty round && !empty sessionUser && status.equals('V_ING') }">
                     <!-- 회차 있어야 출력됨. -->
                     <a
                        href="${pageContext.request.contextPath }/vote/vote.do?election_round=${round}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/Vote.png"
                        style="max-width: 45%; height: auto">
                     </a>
                  </c:if>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col text-center mt-5">
               <div class="col-md-12 text-center">
                  <c:if test="${!empty round && status.equals('E_END')}">
                     <!-- 회차 있어야 출력됨. -->
                     <a
                        href="${pageContext.request.contextPath }/vote/vote_result.do?election_round=${(round-1)+1}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/voteResult.png"
                        style="max-width: 45%; height: auto">
                     </a>
                  </c:if>
               </div>
            </div>
         </div>
      </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
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
</style>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">


<!-- aaaaaaaaaaaa 
   <script language="JavaScript">
   
      var setTime = 5;      // 최초 설정 시간(기본 : 초)

      function msg_time() {   // 1초씩 카운트
         
         m = Math.floor(setTime / 60) + "분 " + (setTime % 60) + "초";   // 남은 시간 계산
         
         var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
         
         document.all.ViewTimer.innerHTML = msg;      // div 영역에 보여줌 
               
         setTime--;               // 1초씩 감소
         
         if (setTime < 0) {         // 시간이 종료 되었으면..
            
            clearInterval(tid);      // 타이머 해제
            alert("종료");
         }
         
      }

      window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
      
   </script>

-->

</head>
<body>
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <div class="container text-center" style="margin-top: 100px">

      <div id="ViewTimer"></div>

      <div class="row" style="margin: 0 auto; text-align: center;">
         <div class="col">
            <img
               src="${pageContext.request.contextPath }/resources/img/join-choice-page.png">
         </div>
      </div>
      <div class="col">
		
		<!-- 선거 없을 때 -->
         <c:if test="${status.equals('E_END') || empty status }"><h1>진행중인 선거가 없습니다.</h1></c:if>
         <!-- admin으로 이동 -->
         <!-- 
         <c:if test="${!empty sessionAdmin && !status.equals('C_ING') && !status.equals('V_ING') }">
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
		
		<c:if test="${!empty status && !status.equals('E_END') }"><h1>${round }회차 입주민 대표 선거가 진행 중입니다.</h1></c:if>
		
		<!-- 후보 등록 기간 -->
         <c:if
            test="${!empty round && !empty sessionUser && status.equals('C_ING') && sessionUser.member_no != candyVo.member_no }">
            후보 등록 기간 : <fmt:formatDate value="${electionVo.candy_startdate }" pattern="yy.MM.dd"/>
		 												~<fmt:formatDate value="${electionVo.candy_enddate }" pattern="yy.MM.dd"/>
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
	
		<c:if test="${!empty round && !empty sessionUser && status.equals('V_ING') }">
		투표 기간 : <fmt:formatDate value="${electionVo.vote_startdate }" pattern="yy.MM.dd"/>~
															<fmt:formatDate value="${electionVo.vote_enddate }" pattern="yy.MM.dd"/>
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
         
         
         <!-- 투표 기간 -->
         <c:if test="${!empty round && !empty sessionUser && status.equals('V_ING') }">
         		
         <div class="row">
            <div class="col text-center mt-5">
               <div class="col-md-12 text-center">
                  
                     <!-- 회차 있어야 출력됨. -->
                     <a
                        href="${pageContext.request.contextPath }/vote/vote.do?election_round=${round}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/Vote.png"
                        style="max-width: 45%; height: auto">
                     </a>
               </div>
            </div>
         </div>
         </c:if>
         
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
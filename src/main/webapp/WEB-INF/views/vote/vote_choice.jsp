<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

         <c:set var="admin" value="${sessionUser.npki_key}"></c:set>
         <!-- admin만 가능 -->
         <c:if test="${fn:contains(admin, 'admin') && !status.equals('C_ING') && !status.equals('V_ING') }">
            <div class="row">
               <div class="col text-center">
                  <div class="col-md-12 text-center">
                     <a href="${pageContext.request.contextPath }/vote/vote_start.jan"><img
                        src="${pageContext.request.contextPath }/resources/img/newVote.png"
                        style="max-width: 800px; height: auto"></a>
                  </div>
               </div>
            </div>
         </c:if>


         <c:if
            test="${!empty round && !empty sessionUser && status.equals('C_ING') }">
            <div class="row">
               <div class="col text-center mt-5">
                  <div class="col-md-12 text-center">
                     <a
                        href="${pageContext.request.contextPath }/vote/candy_write.jan">

                        <img
                        src="${pageContext.request.contextPath }/resources/img/resiCandy.png"
                        style="max-width: 800px; height: auto">
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
                        href="${pageContext.request.contextPath }/vote/candy.jan?election_round=${round}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/candyList.png"
                        style="max-width: 800px; height: auto">
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
                        href="${pageContext.request.contextPath }/vote/vote.jan?election_round=${round}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/Vote.png"
                        style="max-width: 800px; height: auto">
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
                        href="${pageContext.request.contextPath }/vote/vote_result.jan?election_round=${(round-1)+1}">
                        <img
                        src="${pageContext.request.contextPath }/resources/img/voteResult.png"
                        style="max-width: 800px; height: auto">
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
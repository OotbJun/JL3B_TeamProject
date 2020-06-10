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
</style>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>
<body>
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>
   <div class="col text-center mt-3">
      <div class="row">
         <div class="col">
            <h1>홈페이지 대표이미지 출력</h1>
         </div>
      </div>
   </div>

   <div class="container text-center">
      <div class="row">

         <!--메뉴 분할해서 출력해주기  -->
         <div class="col-2"></div>
         <div class="col-8">

            <!-- 개별 메뉴 -->
            <div class="row mt-1">
               <div class="col-6" style="width: 100%">
                  <img
                     src="${pageContext.request.contextPath }/resources/img/MAIN_NOTICE.jpg"
                     style="max-width: 380px; height: auto">
               </div>
               <div class="col"></div>
               <div class="col-5" style="padding-top: 30px">
                  <a href="${pageContext.request.contextPath }/board/notice.jan"><button
                        class="btn btn-outline-secondary" style="width: 100%; border-color: white;">공지사항</button></a>
               </div>
            </div>
            <div class="mt-2"></div>
            <div class="row mt-1">
               <div class="col-5" style="padding-top: 30px">
                  <a href="${pageContext.request.contextPath }/board/board.jan"><button
                        class="btn btn-outline-secondary" style="width: 100%; border-color: white;">자유게시판</button></a>
               </div>
               <div class="col"></div>
               <div class="col-6">
                  <img
                     src="${pageContext.request.contextPath }/resources/img/MAIN_FREEBOARD.jpg"
                     style="width: 380px">
               </div>
            </div>
            <div class="mt-2">
               <div class="row mt-1">
                  <div class="col-6"><img
                     src="${pageContext.request.contextPath }/resources/img/MAIN_IDEA.jpg"
                     style="max-width: 380px; height: auto"></div>
                  <div class="col"></div>
                  <div class="col-5" style="padding-top: 30px">
                  <a href="${pageContext.request.contextPath }/board/idea.jan"><button
                        class="btn btn-outline-secondary" style="width: 100%; border-color: white;">주민청원</button>
                     </a>
                  </div>
               </div>
            </div>
            <div class="mt-2">
               <div class="row mt-1">
                  <div class="col-5" style="padding-top: 30px">
                  <a href="${pageContext.request.contextPath }/vote/vote_choice.jan"><button
                        class="btn btn-outline-secondary" style="width: 100%; border-color: white;">주민투표</button>
                     </a>
                  </div>
                  <div class="col"></div>
                  <div class="col-6"><img
                     src="${pageContext.request.contextPath }/resources/img/MAIN_VOTE.jpg"
                     style="max-width: 380px; height: auto"></div>
               </div>
            </div>

            <div class="col-2"></div>
         </div>
      </div>
   </div>






   <!-- 
      <div class="row mt-4">
         <div class="col-2"></div>
         <div class="col">
            <div class="row mt-4">
               <div class="col">
                  <div class="row">
                     <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath }/member/login.jan"><button
                              class="btn btn btn-danger btn-round" style="width: 100%">로그인</button></a>
                     </div>
                  </div>
               </div>
               <div class="col">
                  <div class="row">
                     <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath }/member/join_member_choice.jan"><button
                              class="btn btn btn-danger btn-round" style="width: 100%">회원가입</button></a>
                     </div>
                  </div>
               </div>
            </div>

         </div>
         <div class="col-2"></div>
      </div>
   </div>

 -->
   <br>
   <footer class="mt-5">
      <jsp:include page="../commons/include_footer.jsp"></jsp:include>
   </footer>
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
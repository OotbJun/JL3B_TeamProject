<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<style>
body {
   background-image:
      url("${pageContext.request.contextPath }/resources/img/welcome1.png");
   background-size: 100%;
   overflow-x: hidden;
   background-repeat: no-repeat;
}

<!--
background-image: url ("${pageContext .request.contextPath
   
}

/
resources /img/welcomepage.jpeg "); -->footer {
   margin: 0 auto;
   text-align: center;
}
</style>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>

<body>
   <div class="row mt-5 text-center" style="margin: 0px auto">
      <div class="col mt-5" style="size: max-width">
         <img
            src="${pageContext.request.contextPath }/resources/img/welcometext.png">
      </div>
   </div>
   <div class="container text-center" style="margin-top: 70px">
<c:choose>
         <c:when test="${empty sessionUser }">
      <div class="row mt-4">
         <div class="col-2"></div>
         <div class="col">
            <div class="row mt-4">
               <div class="col">
                  <div class="row">
                     <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath }/member/login.jan"><button
                              class="btn btn-outline-secondary" style="width: 100%">로그인</button></a>
                     </div>
                  </div>
               </div>
               <div class="col">
                  <div class="row">
                     <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath }/member/join_member_choice.jan"><button
                              class="btn btn-outline-secondary" style="width: 100%">회원가입</button></a>
                     </div>
                  </div>
               </div>
            </div>

         </div>
         <div class="col-2"></div>
      </div>
      </c:when>
         <c:otherwise>
         
         <div class="row mt-4">
         <div class="col-2"></div>
         <div class="col">
            <div class="row mt-4">
               <div class="col">
                  <div class="row">
                     <div class="col-md-12 text-center">
                        <a href="${pageContext.request.contextPath }/board/main.jan"><button
                              class="btn btn-outline-secondary" style="width: 50%">Main Page</button></a>
                     </div>
                  
                  </div>
               </div>
            </div>

         </div>
         <div class="col-2"></div>
      </div>
         </c:otherwise>
      </c:choose>
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
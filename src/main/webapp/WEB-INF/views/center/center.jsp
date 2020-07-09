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
<title>센터페이지</title>
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

h1 {
   border-bottom: solid medium;
   border-top: solid medium;
}

#pagepr {
   font-style: italic;
   text-transform: uppercase;
   font-size: x-large;
   color: #000248;
   word-spacing: 2px;
}
.cardtitle{
   opacity:initial;
   background-color: #fcfcfc33;
}
</style>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<meta charset="UTF-8">
</head>
<body style="overflow-x: hidden;">
   <div id="wrap">
      <jsp:include page="../commons/include_navi.jsp"></jsp:include>

      <div id="content">

         <div class="col text-center">
            <div class="row">
               <div class="col-2"></div>
               <div class="col" style="margin-top: 100px">
                  <h1 class="pt-2 pb-2">TOUCHE NUBES 클래스에 오신 여러분을 환영합니다.</h1>
                  <p class="mt-3" id="pagepr">데이클래스를 통해 아파트 생활의 즐거움을 경험하세요</p>
                  <p id="pagepr">Have fun Touche Nubes lifes through Day-class !</p>
               </div>
               <div class="col-2"></div>
            </div>
         </div>

         <div class="container mt-5">
            <!-- 센터 대표 이미지 출력페이지 -->
            <div class="row row-cols-1 row-cols-md-2 mb-5">
               <c:forEach var="centerList" items="${centerList }">
                  <div class="col mb-4">
                     <div class="card">
                        <img src="/upload/${centerList.centerImgList.center_img_title}"
                           class="card-img-top" style="max-width: 538px; height: 400px">

                        <div class="card-img-overlay pl-4" style="padding-top:45%"
                           onmouseover="this.style.backgroundColor='#fcfcfc4c';"
                           onmouseout="this.style.backgroundColor=''" onclick="pageMove()">
                           <h5 class="card-title">
                           <a style="text-decoration: none; color: white"
                              href="${pageContext.request.contextPath }/center/center_read.do?center_no=${centerList.centerVo.center_no }">
                              ${centerList.centerVo.center_name }
                           </a>
                           </h5>
                           <p class="card-text">${centerList.centerVo.center_pr }</p>
                        </div>

                     </div>
                  </div>
               </c:forEach>
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
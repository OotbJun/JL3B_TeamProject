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
   
   <div class="container text-center" style="margin-top: 100px">
   
      <div class="row" style="margin: 0 auto; text-align: center;">
         <div class="col">
            <img src="${pageContext.request.contextPath }/resources/img/join-choice-page.png">
         </div>
      </div>
      <div class="col">
      <div class="row">
         <div class="col text-center">
            <div class="col-md-12 text-center">
               <a href="${pageContext.request.contextPath }/center/center.jan"><button
                     class="btn btn btn-danger btn-round" style="width: 100%">클래스 리스트</button></a>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col text-center mt-5">
            <div class="col-md-12 text-center">
            
            <c:if test="${!empty sessionCenter && sessionCenter.center_no != centerInfoVo.center_no }">
               <a href="${pageContext.request.contextPath }/center/center_write.jan">
               <button class="btn btn btn-danger btn-round" style="width: 100%">클래스 등록</button></a>
            </c:if>
            
            </div>
         </div>
         <div class="row">
         <div class="col text-center mt-5">
            <div class="col-md-12 text-center">

            <c:if test="${!empty sessionCenter }">
               <a href="${pageContext.request.contextPath }/center/center_modify.jan?info_no=${info_no}">
               <button class="btn btn btn-danger btn-round" style="width: 100%">클래스 수정</button></a>
            </c:if>   

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
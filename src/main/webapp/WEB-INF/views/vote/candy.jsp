<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   background-color: rgba(255, 255, 255, 0.0); . container { padding-right
   : 15px;
   padding-left: 15px;
   margin-right: auto;
   margin-left: auto;
}
}
</style>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>
<body>
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>
   <!-- Page Content -->
   <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">
         싸발적 동대표 투표 <small>후보자</small>
      </h1>

      <div id="carouselExampleCaptions" class="carousel slide"
         data-ride="carousel">
         <ol class="carousel-indicators">
         <c:forEach var="candyList" items="${candyList }">
            <li data-target="#carouselExampleCaptions" data-slide-to="0"></li>
         </c:forEach>
         </ol>
         <div class="carousel-inner">
            
             
            
               <div class="carousel-item active"
                  style="background-color: #f4f4f4;">
                  
                 
                  <c:forEach var="candyList" items="${candyList }">
                  <div>
                     <img class="card-img-top" style="width: 300px"
                        src="/upload/${candyList.candyImgList.candy_img_title}">


                     <div class="carousel-caption d-none d-md-block">
                        <h5>
                           <a
                              href="${pageContext.request.contextPath }/vote/candy_read.jan?candy_no=${candyList.candyVo.candy_no}">${candyList.resiVo.resi_rname }</a>
                        </h5>
                        <p>${candyList.candyVo.candy_intro}</p>
                     </div>
                  </div>
                  </c:forEach>     
                  
                  
               </div>
               
             

               <!-- 화살표 버튼 -->
               <a class="carousel-control-prev" href="#carouselExampleCaptions"
                  role="button" data-slide="prev"> <span
                  class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                  class="sr-only">Previous</span>
               </a>
               <a class="carousel-control-next" href="#carouselExampleCaptions"
                  role="button" data-slide="next"> <span
                  class="carousel-control-next-icon" aria-hidden="true"></span> <span
                  class="sr-only">Next</span>
               </a>
      
         </div>
         
         <div>
            <a href="${pageContext.request.contextPath }/vote/vote_choice.jan">돌아가기</a>
         </div>
      </div>



      <!-- /.row -->
      <!-- Pagination -->

   </div>
   <!-- /.container -->
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
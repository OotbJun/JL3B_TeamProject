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

   <div class="col mt-4">
      <div class="row">
         <div class="col"></div>
         <div class="col">
            <img
               src="${pageContext.request.contextPath }/resources/img/candyfix.png">
         </div>
         <div class="col"></div>
      </div>
   </div>
   <div class="container" role="main" style="margin-top: 5%;">
      <h2 class="text-center" style="color: #28364a">후보등록하기</h2>
      <form
         action="${pageContext.request.contextPath }/vote/candy_write_process.jan"
         method="post" enctype="multipart/form-data">
         
         <div class="mb-3">후 보 자 : ${sessionUser.resi_rname }</div>
         <div class="mb-3">
            <label for="title">소개</label> <input type="text" class="form-control"
               name="candy_intro" id="title" placeholder="후보자 약력을 작성해주세요">
         </div>
         <div class="mb-3"></div>
         <div class="mb-3"></div>
         <div class="mb-3">
            <label for="content">공약사항</label>
            <textarea class="form-control" rows="10" name="candy_content"
               id="content" placeholder="공약을 입력해주세요"></textarea>
         </div>

         <div class="mb-3">
            <div class="row mb-5">
               <div class="col">
                  <label for="tag">파일첨부</label> <input type="file"
                     name="candyFile" accept="image/*"><br>
               </div>
            </div>
            <div class="row mb-3">

               <div class="col-6">
                  <a href="${pageContext.request.contextPath }/vote/vote_choice.jan"
                     class="btn btn-secondary btn-lg btn-block">돌아가기</a>
               </div>
               <div class="col-6">
                  <input type="submit" value="확인"
                     class="btn btn-primary btn-lg btn-block">
               </div>
            
   
            </div>
         </div>
      </form>

         <div>
            <a href="${pageContext.request.contextPath }/vote/vote_choice.jan">돌아가기</a>
         </div>
   </div>
   </div>
   <div class="col"></div>
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
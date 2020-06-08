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
   <div class="row">
      <div class="col"></div>
      <div class="col-8"></div>
      <div class="col"></div>
   </div>
   <div class="row">
      <div class="col"></div>
      <div class="col-8">
          <div class="row">
         <form
             action="${pageContext.request.contextPath }/vote/candy_write_process.jan"
             method="post" enctype="multipart/form-data" >
             <div class="col mt-3">후 보 자 : ${sessionUser.resi_rname }</div>
             <div class="col mt-4">
             <div>후 보 자 소 개 </div><br>
              <textarea rows="10" cols="40" name="candy_intro"></textarea>
             </div>
             <div class="col mt-4">
             <div>공 약 내 용</div><br>
              <textarea rows="10" cols="40" name="candy_content"></textarea>
             </div>
            <input type="file" name="candyFile" multiple accept="image/*"><br> 
            <input type="submit" value="확인">
         </form>
         
         <div><a href="${pageContext.request.contextPath }/vote/vote_choice.jan">돌아가기</a></div>
         
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
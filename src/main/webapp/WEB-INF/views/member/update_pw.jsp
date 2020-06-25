<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
   
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script type="text/javascript">

//비밀번호 확인
$(function() {
   
   $('#member_pw').keyup(function() {
      $('#pwCheck').html('');
   });
      
      
   $('#member_pw2').keyup(function() {
      if ($('#member_pw').val() != $('#member_pw2').val()) {
         
         $('#pwCheck').html("비밀번호 불일치");
         $('#pwCheck').attr('color', '#f82a2aa3');
         $("#update_submit").attr("disabled", true);
      } else {
         $('#pwCheck').html("비밀번호 일치 ");
         $('#pwCheck').attr('color', '#199894b3');
         $("#update_submit").attr("disabled", false);
      }

   });
});



function submit_btn(){
   
   if(confirm("비밀번호를 수정하시겠습니까?")== true){
      document.getElementById("update_pw").submit();
      
   }else 
      false;
}


</script>

</head>
<body>
<jsp:include page="../commons/include_navi.jsp"></jsp:include>

<div class="container">
   
   <h2 class="mt-4 mb-3">비밀번호 확인
   <small></small>
   </h2>
   <hr>
   
   <ol class="breadcrumb">
   
      <li class="breadcrumb-item active">
         <a href="${path}/member/mypage.do">회원 정보<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item ">
         <a href="#">예약 내역</a>
      </li>
      <li class="breadcrumb-item ">
         <a href="#">내가 쓴 글 확인하기</a>
      </li>   
   </ol>
   
   <form id="update_pw" action="${path}/member/update_pw_process.do" method="post">
   <div class="card mb-4">
      <div class="col">
         <div class="row">
            <div class="col"></div>
            <div class="col-8">
               <div class="row mt-4">         
                  <div class="col">
                     <h5><strong>비밀번호 변경 </strong></h5>
                  </div>
                  <div class="col"></div>
                  <div class="col"></div>
               </div>   
               <hr color="black" size="4">
               <small>안전한 비밀번호로 내정보를 보호하세요.</small> 
               <br><br>
               
               <!-- 새로운 PW -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>새 PW</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="password" class="form-control" name="member_pw" id="member_pw" maxlength="20">
                           <input type="hidden" name="member_no" value="${sessionUser.member_no }">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               <!-- 확인 PW -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>새 PW 확인</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="password" class="form-control" id="member_pw2" maxlength="20">   
                           
                        </div>   
                        <div class="col">
                            <font id= "pwCheck" size="2"></font>
                        </div>
                                          
                     </div>                     
                  </div>   
                                             
               </div>
               <br><br><br><br>
               
                                             
            </div>
            <div class="col"></div>
         
         
         </div>
      </div>
      
   
   
   
   
   <!-- 밑에 부분 -->   
      <div class="card-footer text-muted">
         <div class="col">
            <div class="row">
               <div class="col-5"></div>
               <div class="col-5"></div>
               <div class="col">
               <input type="submit" value="확인" class="btn btn-secondary btn-sm" id="update_submit" disabled></div>
            </div>
         </div>
      
      
      </div>
   </div></form>
   
   
   

</div>



</body>


   
</html>
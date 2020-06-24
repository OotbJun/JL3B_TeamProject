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
   
   <form action="${path}/member/confirm_pw_process.do" method="post">
   <div class="card mb-4">
      <div class="col">
         <div class="row">
            <div class="col"></div>
            <div class="col-8">
               <div class="row mt-4">         
                  <div class="col">
                     <h5><strong>비밀번호 확인 </strong></h5>
                  </div>
                  <div class="col"></div>
                  <div class="col"></div>
               </div>   
               <hr color="black" size="4">
               <small>회원님의 소중한 정보 보호를 위해, 현재 비밀번호를 확인해 주세요.</small> 
               <br><br>
               
               <!-- 아이디 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>ID &nbsp &nbsp  &nbsp  &nbsp|</b></label>
                        <div class="col-sm-4">   
                           
                           <input class="form-control" type="text" name="member_id" id="member_id" placeholder="${sessionUser.member_id }" value="${sessionUser.member_id }" readonly>                  
                        
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               <!-- PW -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>PW &nbsp &nbsp  &nbsp|</b></label>
                        <div class="col-sm-4">                        
                           <input class="form-control" type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력해주세요">   
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
               <input type="submit" value="확인" class="btn btn-outline-secondary btn-sm"></div>
            </div>
         </div>
      
      
      </div>
   </div></form>
   
   
   

</div>



</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
</html>
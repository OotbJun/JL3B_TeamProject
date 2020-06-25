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

<div class="container" style="margin-top:5%">
   
   <h2 class="mt-4 mb-3">마이페이지
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
   
   
   <div class="card mb-4">
      <div class="col">
         <div class="row">
            <div class="col"></div>
            <div class="col-8">
               <div class="row mt-4">         
                  <div class="col">
                     <h5><strong>내정보 관리 </strong></h5>
                  </div>
                  <div class="col"></div>
                  <div class="col"></div>
               </div>   
               <hr color="black" size="4">
               <!-- 이름 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>NAME</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="member_name" name="member_name" value="${sessionUser.member_rname }">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               <!-- 아이디 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>ID</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="member_id" name="member_id" value="${sessionUser.member_id }">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- PW -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>PW</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="member_pw" name="member_pw" value="●●●●●●●●●">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               <!-- Email -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>Email</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="member_email" name="member_mail" value="${sessionUser.member_mail }">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- 회원등급 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>회원등급</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="member_grade" name="member_grade" value="${sessionUser.member_grade }등급">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               
               <!-- 가입일자 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>가입일자</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">
                           <fmt:formatDate pattern="yyyy.MM.dd" value="${sessionUser.member_jdate }"/>                  
                            <!-- <input type="text" readonly class="form-control-plaintext" id="member_joindate" name="member_joindate" value="${memberDate }"> -->
                              
                        </div>                     
                     </div>                     
                  </div>                              
               </div>         
               
               
                                 
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
               <a href="${path}/member/confirm_pw.do"><input type="button" value="정보수정" class="btn btn-outline-secondary btn-sm"></a></div>
            </div>
         </div>
      
      
      </div>
   </div>
   

   

</div>
      <jsp:include page="../commons/include_footer.jsp"></jsp:include>


</body>
</html>
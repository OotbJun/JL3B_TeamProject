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
      
      <c:if test="${!empty sessionCenter }">
         <a href="${path }/center/mylesson.do">예약 내역</a>
      </c:if>   
         
      </li>
      <li class="breadcrumb-item ">
      <c:if test="${!empty sessionUser }">
         <a href="${path}/member/mywrite.do">내가 쓴 글 확인하기</a>
      </c:if>   
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
                             
                        <c:if test="${!empty sessionUser }">                   
                           <input type="text" readonly class="form-control-plaintext" id="member_rname" name="member_rname" value="${sessionUser.member_rname }">   
                        </c:if>
                        <c:if test="${!empty sessionCenter }">                   
                           <input type="text" readonly class="form-control-plaintext" id="center_name" name="center_name" value="${sessionCenter.center_name }">   
                        </c:if>
                        
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
                                          
                        <c:if test="${!empty sessionUser }">      
                           <input type="text" readonly class="form-control-plaintext" id="member_id" name="member_id" value="${sessionUser.member_id }">
                        </c:if>
                        <c:if test="${!empty sessionCenter }">      
                           <input type="text" readonly class="form-control-plaintext" id="center_id" name="center_id" value="${sessionCenter.center_id }">
                        </c:if>
                           
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
                        
                        <c:if test="${!empty sessionUser }">
                           <input type="text" readonly class="form-control-plaintext" id="member_email" name="member_mail" value="${sessionUser.member_mail }">
                        </c:if>
                        <c:if test="${!empty sessionCenter }">
                           <input type="text" readonly class="form-control-plaintext" id="center_email" name="center_mail" value="${sessionCenter.center_mail }">
                        </c:if>
                           
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- 회원등급 -->
               <c:if test="${!empty sessionUser }">
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
               </c:if>
               
               <!-- 인증키 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>인증 KEY</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">
                        
                        <c:if test="${!empty sessionUser }">                        
                           <input type="text" readonly class="form-control-plaintext" id="npki_key" name="npki_key" value="${sessionUser.npki_key }">
                        </c:if>
                        <c:if test="${!empty sessionCenter }">                        
                           <input type="text" readonly class="form-control-plaintext" id="npki_key" name="npki_key" value="${sessionCenter.npki_key }">
                        </c:if>
                           
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
                           <!--<fmt:formatDate pattern="yyyy.MM.dd" value="${sessionUser.member_jdate }"/>-->
                           
                           <c:if test="${!empty sessionUser }">                  
                            <input type="text" readonly class="form-control-plaintext" id="member_jdate" name="member_jdate" value="${memberDate }">
                           </c:if>
                           <c:if test="${!empty sessionCenter }">                  
                            <input type="text" readonly class="form-control-plaintext" id="center_jdate" name="center_jdate" value="${centerDate }">
                           </c:if>
                           
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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      
</html>
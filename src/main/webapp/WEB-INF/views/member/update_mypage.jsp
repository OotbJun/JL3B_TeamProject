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
<title>회원 정보 수정</title>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">

<script type="text/javascript">
function submit_btn(){
   
   if(confirm("회원정보를 수정하시겠습니까?")== true){
      document.getElementById("update_mypage").submit();
      
   } 
}
function drop_btn(){
   if(confirm("회원탈퇴를 하시겠습니까?")==true){
	  document.getElementById("member_drop").submit();
      alert("정상적으로 처리 되었습니다.");  location.href="../";
      
   }
   
}
</script>

</head>
<body>
<jsp:include page="../commons/include_navi.jsp"></jsp:include>

<div class="container" style="margin-top:5%">
   
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
      <c:if test="${!empty sessionUser }">
         <a href="#">내가 쓴 글 확인하기</a>
      </c:if>   
      </li>   
   </ol>
   
   <form id="update_mypage" action="${path}/member/update_mypage_process.do" method="post">
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
                        <label class="col-sm-2 col-form-label"><b>NAME</b> </label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">
                        
                         <c:if test="${!empty sessionUser }">                        
                           <input type="text" class="form-control" id="member_rname" name="member_rname" value="${sessionUser.member_rname }">
                         </c:if>
                         <c:if test="${!empty sessionCenter }">                        
                           <input type="text" class="form-control" id="center_name" name="center_name" value="${sessionCenter.center_name }">
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
                           <input type="text" class="form-control" id="member_id" name="member_id" value="${sessionUser.member_id }" placeholder="${sessionUser.member_id }" readonly>   
                         </c:if>
                         <c:if test="${!empty sessionCenter }">
                           <input type="text" class="form-control" id="center_id" name="center_id" value="${sessionCenter.center_id }" placeholder="${sessionCenter.center_id }" readonly>   
                         </c:if>
                         
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- PW -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>PW </b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                        
                        <c:if test="${!empty sessionUser }">
                           <input type="text" readonly class="form-control-plaintext" id="member_pw" name="member_pw" value="●●●●●●●●●">   
                           <input type="hidden" name="member_no" value="${sessionUser.member_no }">
                        </c:if>
                        <c:if test="${!empty sessionCenter }">
                           <input type="text" readonly class="form-control-plaintext" id="center_pw" name="center_pw" value="●●●●●●●●●">   
                           <input type="hidden" name="center_no" value="${sessionCenter.center_no }">
                        </c:if>
                        
                        </div>   
                        <div class="col">
                            <a href="${path}/member/update_pw.do"><input type="button" value="비밀번호 변경" class="btn btn-secondary btn-sm"></a>
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
                           <input type="text" class="form-control" id="member_mail" name="member_mail" value="${sessionUser.member_mail }" placeholder="${sessionUser.member_mail }" readonly>
                         </c:if>
                         <c:if test="${!empty sessionCenter }">          
                           <input type="text" class="form-control" id="center_mail" name="center_mail" value="${sessionCenter.center_mail }" placeholder="${sessionCenter.center_mail }" readonly>
                         </c:if>
                              
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- 회원등급 -->
               <!-- 
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
                -->
               
               <!-- 가입일자 -->
               <!--  
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>가입일자</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">
                           
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
                     -->
                              
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
               <input type="button" value="수정 완료" class="btn btn-secondary" onclick="submit_btn()">
               </div>
            </div>
         </div>
      </div>
   </div>
   </form>
    <form action="${path}/member/member_drop_process.do" id="member_drop">
    <div class="col">
    
    <c:if test="${!empty sessionUser }">
     <input type="hidden" name="member_no" value="${sessionUser.member_no }">
     </c:if>
    <c:if test="${!empty sessionCenter }">
     <input type="hidden" name="center_no" value="${sessionCenter.center_no }">
     </c:if>
      
     <input type="button" value="회원탈퇴" class="btn btn-danger" onclick="drop_btn()">
      </div>
   </form>
</div>

   <jsp:include page="../commons/include_footer.jsp"></jsp:include>

</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
</html>
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
<title>센터 마이페이지</title>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<style type="text/css">
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
margin: 0;
	padding: 0;
}
html,body{
height:100%;
}
#wrap{
min-height: 100%;
position: relative;
}
#content{
margin-bottom: 72px;
}
footer{
margin-top:-72px;
height : 72px;
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
</style>

</head>
<body>
<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div id="content">
<div class="container" style="margin-top:5%">
   
   <h2 class="mt-4 mb-3">마이페이지
   <small></small>
   </h2>
   <hr>
   
   <ol class="breadcrumb">
   
      <li class="breadcrumb-item active">
         <a href="${path}/center/mypage.do">회원 정보<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item ">
         <a href="#">예약 현황</a>
      </li>
      <li class="breadcrumb-item ">
         <a href="${path}/center/mywrite.do">센터 클래스</a>
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
                           <input type="text" readonly class="form-control-plaintext" id="center_name" name="center_name" value="${sessionCenter.center_name }">   
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
                           <input type="text" readonly class="form-control-plaintext" id="center_id" name="center_id" value="${sessionCenter.center_id }">   
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
                           <input type="text" readonly class="form-control-plaintext" id="center_pw" name="center_pw" value="●●●●●●●●●">   
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
                           <input type="text" readonly class="form-control-plaintext" id="center_mail" name="center_mail" value="${sessionCenter.center_mail }">   
                        </div>                     
                     </div>                     
                  </div>                              
               </div>
               
               
               <!-- 인증키 -->
               <div class="row mt-1">
                  <div class="col mt-1">
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label"><b>인증 KEY</b></label>
                        <div class="col-1"><b>|</b></div>
                        <div class="col-sm-4">                        
                           <input type="text" readonly class="form-control-plaintext" id="npki_key" name="npki_key" value="${sessionCenter.npki_key }">   
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
                           <fmt:formatDate pattern="yyyy.MM.dd" value="${sessionCenter.center_jdate }"/>                  
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
               <a href="${path}/center/confirm_pw.do"><input type="button" value="정보수정" class="btn btn-outline-secondary btn-sm"></a></div>
            </div>
         </div>
      
      
      </div>
   </div>
   

   

</div>
     </div>
	
</div>
<jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>

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


</html>

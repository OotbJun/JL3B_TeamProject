<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>아이디 비밀번호 찾기</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script type="text/javascript">
function search_check(num) {
   if (num == '1') {
      document.getElementById("searchP").style.display = "none";
      document.getElementById("searchI").style.display = "";   
   } else {
      document.getElementById("searchI").style.display = "none";
      document.getElementById("searchP").style.display = "";
   }
}
var idV = "";
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
   $.ajax({
      type:"post",
      url:"${pageContext.request.contextPath}/member/find_resi_process.jan?resi_rname="+$('#resi_rname').val()+"&npki_key="+$('#npki_key').val(),   
      success:function(data){
         if(data == 0){
            $('#id_value').text("가입된 아이디가 없습니다.");   
         } else {
            $('#id_value').text(data);
            idV = data;
         }
      }
   });
}
$('#modal').modal("hide");  
$('#modal').modal("show");
</script>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<body>
<div class="full">
      <div class="container">
            <div class="row mb-4" style="font-size: medium;">
               <div class="col">아이디/비밀번호 찾기</div>
               <div class="col">인증된 이메일만 정보 찾기가 가능합니다 :)</div>
            </div>
            <div style="margin-bottom: 10px;">
               <input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
               <label for="search_1">아이디 찾기</label>
            </div>
            <div >
               <input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
               <label for="search_2">비밀번호 찾기</label>
            </div>
            <div id="searchI">
            <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputPhone_1">이름</label>
                  <div>
                     <input type="text" class="form-control" id="resi_rname" name="resi_rname" placeholder="세대주 이름을 입력해주세요">
                  </div>
               </div>
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputPhone_1">입주민번호</label>
                  <div>
                     <input type="text" class="form-control" id="npki_key" name="npki_key" placeholder="nubes-동-호수">
                  </div>
               </div>
               
               <div class="form-group">
               <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal" onclick="idSearch_click()">확인 </button>
               <a class="btn btn-danger btn-block"   href="${pageContext.request.contextPath}/member/login.jan">취소</a>
               </div>
            </div>
            <div id="searchP" style="display: none;">
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputId">아이디</label>
                  <div>
                     <input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) godmisu">
                  </div>
               </div>
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
                  <div>
                     <input type="email" class="form-control" id="inputEmail_2"   name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
                  </div>
               </div>
               <div class="form-group">
                  <button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
               <a class="btn btn-danger btn-block"   href="${pageContext.request.contextPath}/member/login.jan">취소</a>
            </div>
            </div>
         </div>
      </div>
   <!-- 모달창 -->
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
      </div>
      <div class="modal-body">
         <h4>
         <b>입주민 회원 아이디는</b><span class="close">&times;</span>
      </h4><br>
         <h2 id="id_value"></h2>
      <br>
      <button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
      <i class="fa fa-envelope"></i>비밀번호 찾기</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>

</body>
</html>
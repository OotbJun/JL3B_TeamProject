<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>아이디 비밀번호 찾기</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
      url:"${pageContext.request.contextPath}/member/find_member_process.do?member_rname="+$('#member_rname').val()+"&npki_key="+$('#npki_key').val(),   
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

var pwSearch_click = function(){
	   $.ajax({
	      type:"get",
	      url:"${pageContext.request.contextPath}/member/find_password.do?member_id="+$('#member_id').val()+"&member_mail="+$('#member_mail').val(),   
	      success:function(data){
	         if(data == 0){
	           alert("가입된 아이디가 없습니다.");   
	         } else {
	          alert("작성하신 메일로 비밀번호를 발송하였습니다.")
	          location.href="login.do";
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
<body style="overflow-x: hidden;">
	<div id="wrap">
		
		<div id="content">

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
                     <input type="text" class="form-control" id="member_rname" name="member_rname" placeholder="세대주 이름을 입력해주세요">
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
               <a class="btn btn-danger btn-block"   href="${pageContext.request.contextPath}/member/login.do">취소</a>
               </div>
            </div>
            <div id="searchP" style="display: none;">
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="member_id">아이디</label>
                  <div>
                     <input type="text" class="form-control" id="member_id" name="member_id" placeholder="ex) godmisu">
                  </div>
               </div>
               <div class="form-group">
                  <label class="font-weight-bold text-white" for="member_mail">이메일</label>
                  <div>
                     <input type="email" class="form-control" id="member_mail"   name="member_mail" placeholder="ex) E-mail@gmail.com">
                  </div>
               </div>
               <div class="form-group">
                  <button id="searchBtn2" type="button" class="btn btn-primary btn-block" onclick="pwSearch_click()">확인</button>
               <a class="btn btn-danger btn-block"   href="${pageContext.request.contextPath}/member/login.do">취소</a>
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
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div></div>
		
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

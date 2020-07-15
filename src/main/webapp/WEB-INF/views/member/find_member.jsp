<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>아이디/비밀번호 찾기</title>
   <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
   <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<style type="text/css">
* {
   box-sizing: border-box;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   margin: 0;
   padding: 0;
}

html, body {
   height: 100%;
}

#wrap {
   min-height: 100%;
   position: relative;
}

#content {
   margin-bottom: 72px;
}

footer {
   margin-top: -72px;
   height: 72px;
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

ul{
list-style: none;

}
li{

list-style: none;
float: left;
}
.form-control {
    display: block;
    width: 70%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.btn-block {
    display: block;
    width: 70%;
}


</style>

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
   var idSearch_click = function() {
      $
            .ajax({
               type : "post",
               url : "${pageContext.request.contextPath}/member/find_member_process.do?member_rname="
                     + $('#member_rname').val()
                     + "&npki_key="
                     + $('#npki_key').val(),
               success : function(data) {
                  if (data == 0) {
                     $('#id_value').text("가입된 아이디가 없습니다.");
                  } else {
                     $('#id_value').text(data);
                     idV = data;
                  }
               }
            });
   }
   var pwSearch_click = function() {
      $
            .ajax({
               type : "get",
               url : "${pageContext.request.contextPath}/member/find_password.do?member_id="
                     + $('#member_id').val()
                     + "&member_mail="
                     + $('#member_mail').val(),
               success : function(data) {
                  if (data == 0) {
                     alert("가입된 아이디가 없습니다.");
                  } else {
                     alert("작성하신 메일로 비밀번호를 발송하였습니다.")
                     location.href = "login.do";
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
      <div id="content" >
         <div class="full">
            <div class="container" style="margin-top: 4%">
               <div class="row mb-4" style="font-size: medium;">
                  <div class="col" style="text-align:center; font-size: x-large;">아이디/비밀번호 찾기</div>
                   <div class="col"></div>
               </div>
               
               <div style="margin-bottom: 10px; margin-top: 20px;">
                    <div class="row">
              
                    <ul>
                    <li style="margin-left: 650px">
                  <input type="radio" id="search_1" name="search_total"
                     onclick="search_check(1)" checked="checked"> <label
                     for="search_1" style="font-size: large;">아이디 찾기</label>
                  </li>
                       <li style="margin-left: 30px;">
                  <input type="radio" id="search_2" name="search_total"
                     onclick="search_check(2)"> <label for="search_2" style="font-size: large;">비밀번호
                     찾기</label>
                     </li>
                  </ul>
               </div>
               </div>
               <div id="searchI" style="margin-left: 290px">
                  <div class="form-group">
                     <label class="font-weight-bold text-white" for="inputPhone_1">이름</label>
                     <div>
                        <input type="text"  class="form-control" id="member_rname"
                           name="member_rname" placeholder="세대주 이름을 입력해주세요">
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="font-weight-bold text-white" for="inputPhone_1">입주민번호</label>
                     <div>
                        <input type="text" class="form-control" id="npki_key"
                           name="npki_key" placeholder="nubes-동-호수">
                     </div>
                  </div>

                  <div class="form-group">
                     <button type="button" class="btn btn-primary btn-block"
                        data-toggle="modal" data-target="#myModal"
                        onclick="idSearch_click()">확인</button>
                     <a class="btn btn-danger btn-block"
                        href="${pageContext.request.contextPath}/member/login.do">돌아가기</a>
                  </div>
               </div>
               <div id="searchP" style="display: none; margin-left: 290px">
                  <div class="form-group">
                     <label class="font-weight-bold text-white" for="member_id">아이디</label>
                     <div>
                        <input type="text" class="form-control" id="member_id"
                           name="member_id" placeholder="ex) godmisu">
                     </div>
                  </div>
                  <div class="form-group">
                     <label class="font-weight-bold text-white" for="member_mail">이메일</label>
                     <div>
                        <input type="email" class="form-control" id="member_mail"
                           name="member_mail" placeholder="ex) E-mail@gmail.com : 인증된 이메일만 정보 찾기가 가능합니다">
                     </div>
                  </div>
                  <div class="form-group">
                     <button id="searchBtn2" type="button"
                        class="btn btn-primary btn-lg" onclick="pwSearch_click()">확인</button>
                     <a class="btn btn-danger btn-block"
                        href="${pageContext.request.contextPath}/member/login.do">돌아가기</a>
                  </div>
               </div>
            </div>
         </div>
         <!-- 모달창 -->
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                     <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
                  </div>
                  <div class="modal-body">
                     <h4>
                        <b>입주민 회원 아이디는</b><span class="close">&times;</span>
                     </h4>
                     <br>
                     <h2 id="id_value"></h2>
                     <br>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">닫기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>
</html>
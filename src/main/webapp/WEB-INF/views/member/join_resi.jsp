<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
   crossorigin="anonymous"></script>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
   // 아이디 중복확인  ajax   
   function confirmId() {
      var resi_id = document.getElementById("resi_id").value;
      var xmlhttp = new XMLHttpRequest;

      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText == 'true') {
               document.getElementById("id_check").innerText = "사용 할 수 있는 아이디 입니다."
               document.getElementById("id_check").style.color = "#11609c";
               document.getElementById("id_check").style.fontWeight = "bold";
               document.getElementById("id_check").style.fontSize = "large"
               document.getElementById("join_submit").setAttribute("disabled","false");
            } else {
               document.getElementById("id_check").innerHTML = "사용 할 수 없는 아이디 입니다."
               document.getElementById("id_check").style.color = "#ae0e36";
               document.getElementById("id_check").style.fontWeight = "bold";
               document.getElementById("id_check").style.fontSize = "large"
               document.getElementById("join_submit").setAttribute("disabled","true");
            }
         }

      };
      xmlhttp.open("post","${pageContext.request.contextPath}/member/confirmId.jan",true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("resi_id=" + resi_id);
   }

   //비밀번호 일치 확인 ajax

function confirmPw(){
   var pw = document.getElementById("resi_pw").value;
   var check_pw = document.getElementById("check_pw").value

   if (pw==check_pw) {
      document.getElementById("checked_pw").innerText = "비밀번호가 일치합니다"
      document.getElementById("checked_pw").style.color = "#11609c";
      document.getElementById("checked_pw").style.fontWeight = "bold";
      document.getElementById("checked_pw").style.fontSize = "large"
      document.getElementById("join_submit").setAttribute("disabled","false");
   } else {
      document.getElementById("checked_pw").innerText = "비밀번호가 일치하지 않습니다"
      document.getElementById("checked_pw").style.color = "#ae0e36";
      document.getElementById("checked_pw").style.fontWeight = "bold";
      document.getElementById("checked_pw").style.fontSize = "large"
      document.getElementById("join_submit").setAttribute("disabled","true");
   }
}
   //인증번호

function check_npki() {
   var npki_key = document.getElementById("npki_key").value;
   var xmlhttp = new XMLHttpRequest;

      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText == 'true') {
               document.getElementById("checked_npki").innerText = "유효한 인증번호 입니다.";
               document.getElementById("checked_npki").style.color = "#11609c";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large"
               document.getElementById("join_submit").setAttribute("disabled","false");
            } else 
               if(xmlhttp.responseText == 'used')
               {
               document.getElementById("checked_npki").innerText = "이미 등록된 인증번호 입니다. 인증번호를 다시 확인해주세요";
               document.getElementById("checked_npki").style.color = "#20604f";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large"
               document.getElementById("join_submit").setAttribute("disabled","true");
            } 
               else {
               document.getElementById("checked_npki").innerText = "유효하지 않은 인증번호 입니다.";
               document.getElementById("checked_npki").style.color = "#ae0e36";
               document.getElementById("checked_npki").style.fontWeight = "bold";
               document.getElementById("checked_npki").style.fontSize = "large"
               document.getElementById("join_submit").setAttribute("disabled","true");

            ;
         };
         };
      };
      xmlhttp.open("post", "${pageContext.request.contextPath}/member/checkNpkiKey.jan",true);
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("npki_key="+ npki_key);
   };
   
   function pageMove(){
      setTimeout(test , 36*1000);
   }

   
   function test(){
      alert("회원가입시간이 종료되었습니다. 다시 시도해주세욬ㅋㅋㅋㅋㅋㅋㅋㅋ");
      location.href="/touche_nubes/";
   }
   
  function timer() {
    setInterval(timeAttack,1000);
}
   
   
      
        var setTime = 35;      // 최초 설정 시간(기본 : 초)

      function timeAttack() {   // 1초씩 카운트
         
        var m = Math.floor(setTime/60) + "분 ";
         var s = (setTime % 60)+ "초";   // 남은 시간 계산
         var o = "60초";
         console.log(m);
         
         if (setTime < 0) {         // 시간이 종료 되었으면..
             
             clearInterval(timeAttack);      // 타이머 해제
          
        } else if( setTime>60 ){
            document.getElementById("ViewTimer").innerText = m+s;      // div 영역에 보여줌
            document.getElementById("ViewTimer").style.color = "#11609c";
            document.getElementById("ViewTimer").style.fontWeight = "bold";
            document.getElementById("ViewTimer").style.fontSize = "large"
        } else if( setTime<61 && setTime>10 ){
           
           if((setTime%60)==0 ){
           document.getElementById("ViewTimer").innerText = o;      // div 영역에 보여줌      
           document.getElementById("ViewTimer").style.color = "#ae0e36";
            document.getElementById("ViewTimer").style.fontWeight = "bold";
            document.getElementById("ViewTimer").style.fontSize = "large"
            
           }else{
           document.getElementById("ViewTimer").innerText = s;      // div 영역에 보여줌
           document.getElementById("ViewTimer").style.color = "#ae0e36";
            document.getElementById("ViewTimer").style.fontWeight = "bold";
            document.getElementById("ViewTimer").style.fontSize = "large"
        }
        }else if(setTime<=10){
           document.getElementById("ViewTimer").innerText = s;      // div 영역에 보여줌
            document.getElementById("ViewTimer").style.color = "#ae0e36";
            document.getElementById("ViewTimer").style.fontWeight = "bold";
            document.getElementById("ViewTimer").style.fontSize = "x-large"
        }
               
        setTime--;               // 1초씩 감소
         
        
         
      }


     

   </script>

</head>
<body onload="timer(); pageMove()">
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <div class="container text-center" style="margin-top: 50px">
      <div class="row">
         <div class="col-2"></div>
         <div class="col">
            <img style="max-width: 700px"
               src="${pageContext.request.contextPath }/resources/img/join-page.png">
         </div>
         <div class="col-2"></div>
      </div>
      <div class="row" >
         <div class="col-5"></div>
         <div class="col" id="ViewTimer"></div>
         <div class="col-5"></div>
      </div>

      <div class="row">
         <div class="col-2"></div>
         <div class="col">
            <form method="post" class="text-left">
               <!-- 아이디 -->
               <div class="form-group">
                  <label for="resi_id">ID</label> <input type="text"
                     class="form-control" id="resi_id" name="resi_id"
                     placeholder="시용할 ID 입력" required onkeyup="confirmId()">
                  <!-- ajax 처리되서 중복확인 바로 되는 부분 -->
                  <div class="check_font text-center" id="id_check"></div>
               </div>

               <!-- 비밀번호 -->
               <div class="form-group">
                  <label for="resi_pw">비밀번호</label> <input type="password"
                     class="form-control" id="resi_pw" name="resi_pw"
                     placeholder="사용할 비밀번호" required>
                  <div class="check_font" id="pw_check"></div>

               </div>

               <!-- 비밀번호 재확인 -->
               <div class="form-group">
                  <label for="resi_pw2">비밀번호 확인</label> <input type="password"
                     class="form-control" id="check_pw" name="check_pw"
                     placeholder="비밀번호를 한 번 더 입력해주세요" required onkeyup="confirmPw()">
                  <div class="check_font" id="checked_pw"></div>
               </div>

               <!-- 인증번호 -->
               <div class="form-group">

                  <label for="npki_key">인증번호</label> <input type="text"
                     placeholder="부여받은 인증번호 입력 reis-xxx-xxxx" id="npki_key" name="npki_key"
                     class="form-control" onblur="check_npki()" required="required">
                  <div class="check_font" id="checked_npki"></div>
               </div>

               <!-- 이메일 -->
               <div class="form-group">
                  <label for="resi_mail">이메일</label> <input
                     placeholder="메일 수신할 이메일 등록, ID 와 동일해도 됨" type="text"
                     name="resi_mail" class="form-control">
               </div>

               <div class="col-2">
                  <input type="hidden" value="1" name="resi_grade"> <input
                     type="hidden" value="0" name="resi_point">
               </div>
               <!-- 회원가입 버튼 -->
               <div class="col-3">
                  <input id="join_submit" type="submit" value="회원가입"
                     class="btn btn-primary btn-block">
               </div>
         </div>
         <div class="col-2"></div>
      </div>
      </form>
   </div>


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
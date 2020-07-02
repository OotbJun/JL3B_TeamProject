<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 입주민 회원가입</title>
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
   function pageMove(){
         setTimeout(test , 7*1000);
      }
   function test(){
         location.href="/touche_nubes/member/login.do";
      }
   
   function timer() {
       setInterval(timeAttack,1000);
   }
         
   var setTime = 7;      // 최초 설정 시간(기본 : 초)

 function timeAttack() {   // 1초씩 카운트
            
      if (setTime < 0) {         // 시간이 종료 되었으면..
                
         clearInterval(timeAttack);      // 타이머 해제
             
      } else {
               document.getElementById("ViewTimer").innerText = setTime+"초";      // div 영역에 보여줌
               document.getElementById("ViewTimer").style.color = "#11609c";
               document.getElementById("ViewTimer").style.fontWeight = "bold";
               document.getElementById("ViewTimer").style.fontSize = "x-large"
      }
      setTime--;               // 1초씩 감소
   }
   </script>

</head>
<body onload="timer(); pageMove();">
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <div class="container text-center" style="margin-top: 6%">
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
      <div class="row mt-4">
         <div class="col-2">.</div>
         <div class="col"><span style="font-size: large;">후에  로그인페이지로 이동합니다.</span><br>
        </div>
         <div class="col-2"></div>
      </div>
       <div class="row mt-4">
         <div class="col-2">.</div>
         <div class="col"><span style="font-size: large;">작성하신 이메일로 확인메일을 발송하였습니다.</span><br>
        </div>
         <div class="col-2"></div>
      </div>
        <div class="row mt-4">
         <div class="col-2">.</div>
         <div class="col"><span style="font-size: large;">이메일 인증 후 로그인을 부탁드립니다.</span><br>
        </div>
         <div class="col-2"></div>
      </div>
        <div class="row mt-4">
         <div class="col-2">.</div>
         <div class="col"><img src="${pageContext.request.contextPath }/resources/img/93.gif"><br>
        </div>
         <div class="col-2"></div>
      </div>
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
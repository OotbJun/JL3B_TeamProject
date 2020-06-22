<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 로그인</title>
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

body {
   background-image:
      "${pageContext.request.contextPath }/resources/img/login.jpg"
}

/* Style the tab */
.tab {
   overflow: hidden;
   border: none;
   background-color: #ffffff;
   
}

/* Style the buttons that are used to open the tab content */
.tab button {
   background-color: inherit;
   float: left;
   border: none;
   outline: none;
   cursor: pointer;
   padding: 14px 16px;
   transition: 0.05s;
   margin: 0px auto;
}

/* Change background color of buttons on hover */
.tab button:hover {
   background-color: #fffff;
}

/* Create an active/current tablink class */
.tab button.active {
   background-color: #56baed;
}

/* Style the tab content */
.tabcontent {
   display: none;
   padding: 6px 12px;
   border: none;
   border-top: none;
   
}




</style>
<script type="text/javascript">
   

   function open_tab() {
      openCity(event, 'resi')
      document.getElementById("btnresi").style.display = "block";
      document.getElementById("btnresi").className += " active";
   }

   function openCity(evt, cityName) {
      // Declare all variables
      var i, tabcontent, tablinks;

      // Get all elements with class="tabcontent" and hide them
      tabcontent = document.getElementsByClassName("tabcontent");

      for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
      }
      
      // Get all elements with class="tablinks" and remove the class "active"
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
         tablinks[i].className = tablinks[i].className
               .replace(" active", "");
      }

      // Show the current tab, and add an "active" class to the button that opened the tab
      document.getElementById(cityName).style.display = "block";

      evt.currentTarget.className += " active";
   }
</script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/login2.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
</head>


<body onload="open_tab()">
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <script
      src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

   <div class="wrapper fadeInDown">
      <div id="formContent">
         <!-- Icon -->
         <div class="fadeIn first mt-3">
            <img
               src="${pageContext.request.contextPath }/resources/img/navi-logo.png"
               id="icon" alt="User Icon" />
         </div>
         <div class="tab" style="background-color: white; border-color: none;" >
            <div class="row" style="margin: 2px 2px 2px 2px; background-color: white; border-color: none;" >
               <div class="col-1"></div>
               <div class="col-3">
                  <button id='btnresi' class="tablinks" 
                     onclick="openCity(event, 'resi')" style="text-align: left; max-width: 100%">입주민</button>
               </div>
               <div class="col"></div>
               <div class="col-3">
                  <button id='btncenter' class="tablinks" 
                     onclick="openCity(event, 'center')" style="text-align: right; max-width: 100%">센 터</button>
               </div>
               <div class="col-1"></div>
            </div>
         </div>

         <!-- Tab content -->
         <div id="resi" class="tabcontent fadeIn !important">
            <form action="./login_process.jan" method="post">
               <input type="text" id="login" class="second" name="resi_id"
                  placeholder="아이디"> <input type="password" id="password"
                  class="third" name="resi_pw" placeholder="비밀번호"> <input
                  type="submit" class="fourth" value="Log In"
                  style="margin: 24px 20px 24px 20px">
            </form>
         </div>

         <div id="center" class="fadeIn tabcontent">
            <form action="./login_center_process.jan" method="post">
               <input type="text" id="login" class="second"
                  name="center_id" placeholder="아이디 "> <input
                  type="password" id="password" class="third"
                  name="center_pw" placeholder="비밀번호"> <input type="submit"
                  class="fourth" value="Log In"
                  style="margin: 24px 20px 24px 20px;">
            </form>
         </div>



         <!-- Login Form -->

         <div id="formFooter">
           <div>
            <a class="underlineHover" href="./join_member_choice.jan"
               style="text-decoration: none; color: #56baed">회원 가입</a>
               </div>
                 <div>
                 <a class="underlineHover" href="./find_resi.jan"
                 style="text-decoration: none; color: #56baed">아이디 비밀번호 찾기</a>
               </div>
         </div>


      </div>
   </div>
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
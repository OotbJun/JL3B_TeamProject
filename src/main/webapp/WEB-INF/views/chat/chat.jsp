<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 채팅</title>
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

ul {
   list-style: none;
   float: left;
}

li {
   margin-left: 6px;
   float: left;
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
<meta charset="UTF-8">


<script type="text/javascript">
   
   function chatList(){
      
      
      var aaa = document.getElementById("chatBox");
      var div = document.createElement("div");
      var xmlhttp = new XMLHttpRequest();
      
      
      
      xmlhttp.onreadystatechange = function() {
         
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            
            var chatContent = JSON.parse(xmlhttp.responseText);
            
            for (var data of chatContent) {
                     
               var memberName = document.createElement("div");
               var chatContent = document.createElement("div");
               var chatDate = document.createElement("div");
               
               //이름
               memberName.innerText = data.memberVo.member_rname;
               
               //내용
               chatContent.innerText = data.chatVo.chat_content;
               
               //날짜
               var milliseconds = data.chatVo.chat_date;   //날짜 이쁘게 자르자!
               var date = new Date(milliseconds);
               
               chatDate.innerText = (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
               
               div.appendChild(memberName);
               div.appendChild(chatContent);
               div.appendChild(chatDate);
               
               
               
              }
            aaa.appendChild(div);
         };
         
      };
      
      xmlhttp.open("post", "./read_chat.do", true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
       xmlhttp.send("chat_no="+1);
      
   };
   
</script>

</head>

<body onload="chatList()">
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>
   
   <div class="col mt-4">
      <div class="row">
         <div class="col-1" ></div>
         <div class="col text-center" style="margin-top:4%;">
            <h1>입주민 채팅방</h1>
            <p>헛소리 하면 인격살인 들어감</p>
         </div>
         <div class="col-1"></div>

      </div>
   </div>
 
   <div class="container" style="margin-top: 60px; border-bottom: solid thin; border-bottom-color: #f4f4f4">
        <div class="row mt-1">
            <h4>건전하고 유의미한 대화가 이뤄지기를 바랍니다.</h4>
        </div>
    </div>

   <!-- 채팅내용 -->
   <div class="container" style="margin-top: 20px;">
    <!-- ajax 처리하면 이렇게 해야함 -->
    
        <div id="chatBox">

        </div>
        
        
    <!-- chat_list foreach 문 돌아갈 자리-->
    <!-- 
      <c:forEach items="${chatList}" var="chatList">
            <div class="row mt-1">
                <div class="col text-wrap" style="word-break: break-all;">
                ${chatList.chatVo.chat_content }
                </div>
            </div>   
      </c:forEach>
     -->
        
   </div>

  <!-- 채팅 작성 -->
  <!-- 
   <div class="container" style="margin-top: 20px;">
      <label for="content" class="mt-4">채팅 내용~</label>
      <form name="채팅 InsertForm" onsubmit="return false">
         <div class="input-group">
            <input type="hidden" value="1111"
               id="채팅_no" /> 
            
               <input type="text" class="form-control"
               id="채팅_content" name="채팅_content"
               placeholder="내용을 입력하세요." maxlength="1000"> 
            
               <span
               class="input-group-btn pl-2" style="padding-top: 4px">
               <button class="btn btn-outline-primary btn-sm" type="button"
                  name="채팅InsertBtn">전송</button>
            </span>
         </div>
      </form>
   </div>
    -->
   <jsp:include page="../commons/include_footer.jsp"></jsp:include>


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
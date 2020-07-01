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
   
   //채팅 출력
   function chatList(){
      
      var chatNo = ${chat_no};
      var aaa = document.getElementById("chatBox");
      
      var xmlhttp = new XMLHttpRequest();
      
      
      
      xmlhttp.onreadystatechange = function() {
         
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        
            var chatContent = JSON.parse(xmlhttp.responseText);
            var nowUser = ${sessionUser.member_no};
            //
            var length = aaa.childNodes.length;
            for(var i = 0; i < length; i++){
               aaa.removeChild(aaa.childNodes[0]);
            }
            
            for (var data of chatContent) {
               if(data.chatVo.member_no != nowUser ){
                   var inneraaa = document.createElement("div");
                     inneraaa.setAttribute("class","col-8 mr-auto");
                     inneraaa.style.margin = '0px'; 
               
                     var nameTime = document.createElement("div");
                  nameTime.setAttribute("class","row mr-auto alert alert-light");
                  nameTime.style.margin = '0px';
                  nameTime.style.padding = '0px';
               
               var memberName = document.createElement("div");
                  memberName.setAttribute("class","col-2 font-italic text-info");
                  memberName.style.margin = '0px';
                  memberName.style.paddingRight = '0%';
                  memberName.style.marginRight = '0%';
                  memberName.style.fontSize = 'small';
                  
               var chatDate = document.createElement("div");
                  chatDate.setAttribute("class","col-10 weight-light text-black-50");
                  chatDate.style.fontSize = 'x-small';
                  chatDate.style.paddingTop = '1%';
                  nameTime.appendChild(memberName);
                    nameTime.appendChild(chatDate);
                  

               var content = document.createElement("div");
                  content.setAttribute("class","row text-left mr-auto alert alert-secondary");
                  content.style.margin = '0px';
                  content.style.padding = '0px';

               var chatContent = document.createElement("div");
                  chatContent.setAttribute("class","col font-weight-normal");
                  chatContent.style.fontSize = 'medium';

               content.appendChild(chatContent);
 
               
               }else{
                  var inneraaa = document.createElement("div");
                    inneraaa.setAttribute("class","col-8 ml-auto text-right");
                    inneraaa.style.margin = '0px'; 
               

               var nameTime = document.createElement("div");
                  nameTime.setAttribute("class","row ml-auto text-right alert alert-light");
                  nameTime.style.margin = '0px';
                  nameTime.style.padding = '0px';
               
               var memberName = document.createElement("div");
                  memberName.setAttribute("class","col-10 ml-auto font-italic text-info");
                  memberName.style.margin = '0px';
                  memberName.style.fontSize = 'small';
                  
               var chatDate = document.createElement("div");
                  chatDate.setAttribute("class","col-1 weight-light text-black-50");
                  chatDate.style.fontSize = 'x-small';
                  chatDate.style.paddingTop = '1%';
                  chatDate.style.paddingLeft = '0%';
                  chatDate.style.marginLeft = '0%';
                  nameTime.appendChild(memberName);
                    nameTime.appendChild(chatDate);
                  

               var content = document.createElement("div");
                  content.setAttribute("class","row ml-auto text-right alert alert-secondary");
                  content.style.margin = '0px';
                  content.style.padding = '0px';

               var chatContent = document.createElement("div");
                  chatContent.setAttribute("class","col ml-auto font-weight-normal");
                  chatContent.style.fontSize = 'medium';

               content.appendChild(chatContent);
            }
               
               
               //이름
               //memberName.innerText = data.memberVo.member_rname;
               memberName.innerText = data.chatVo.member_rname;
               
               //내용
               chatContent.innerText = data.chatVo.chat_content;
               
               //날짜
               var milliseconds = data.chatVo.chat_date;   //날짜 이쁘게 자르자!
               var date = new Date(milliseconds);
               
               chatDate.innerText = (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
   
               inneraaa.appendChild(nameTime);
               inneraaa.appendChild(content);
               
               aaa.appendChild(inneraaa);
              }
            
         }
         
      };
      
      xmlhttp.open("post", "./read_chat.do", true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("chat_no=" + chatNo);

   };
   //채팅 입력
   function insertChat(){
      
      var content = document.getElementById("chat_content").value;
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
               chatList();
            }
           
         };
         
       xmlhttp.open("post", "./write_chat_process.do", true);
       xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
       xmlhttp.send("chat_content=" + content);
       
       document.getElementById("chat_content").value = '';
     
       
   };
   function onKeyDown(){
     if(event.keyCode == 13){ 
        insertChat();
       
     }
   }
   function refresh(){
      setInterval("chatList()", 3000);
   }
   
   
</script>

</head>

<body onload="refresh()">
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
 
   <div class="container text-center" style="margin-top: 60px; border-bottom: solid thin; border-bottom-color: #f4f4f4">

            <h4>건전하고 유의미한 대화가 이뤄지기를 바랍니다.</h4>

    </div>

   <!-- 채팅내용 -->
   <div class="container overflow-auto" style="size: ">
    <!-- ajax 처리하면 이렇게 해야함 -->
    
        <div id="chatBox">

        </div>
    
   
    <div class="row mt-3" style="border-top: solid thick; border-top-color: black">
        <div class="input-group mt-3">
           
           <div class="col-1 pt-1">내용</div>
           <div class="col-10">
              <input type="text" class="form-control" id="chat_content" onkeydown="onKeyDown()" ></textarea>
           </div>
           <div class="col-1">
              <input type="button" value="입력" onclick="insertChat()">
           </div>
        </div>
       
      </div>
   </div>
    
    
    
   
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
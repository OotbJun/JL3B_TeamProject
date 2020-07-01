<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">

   function chat_on() {
      
      
      var aaa = document.getElementById("all");
      aaa.style.width="300px";
      aaa.style.height="400px";
      aaa.style.backgroundColor="#FAFAFA";
      aaa.style.border="1px solid gray";
          
   };   
      
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
                  
                  var all = document.getElementById("all");
                  //var chatInsert = document.getElementById("chatInsert");
                  
                  all.appendChild(aaa);
                  //all.appendChild(chatInsert);
                 }
               
            }
            
         };
         
         xmlhttp.open("post", "${path}/chat/read_chat.do", true);
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


<div style="position:fixed;bottom:55px;right:20px;">
   <!-- 채팅 박스 -->
   <div id="all" style="overflow:auto;">
   <div id="chatBox"></div>
   <!-- 입력창 -->
   <div id="chatInsert" style="border:gray"> 
   </div>
   </div>
</div>

<div style="position:fixed;bottom:15px;right:10px;">
   <button class="btn btn-outline-secondary" onclick="chat_on(); refresh();">채팅</button>
</div>


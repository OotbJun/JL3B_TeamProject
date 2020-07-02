<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">

//채팅공간 만들기
function chat_on() {
      
      
      var chating = document.getElementById("all");
      chating.style.width="300px";
      chating.style.maxHeight="500px";
      chating.style.border="1px solid gray";
      
      var chatBox = document.getElementById("chatBox");
      chatBox.style.width="300px";
      chatBox.style.height="450px";
      // chatBox.style.margin="0px";
      chatBox.style.paddingBottom="10px";
      chatBox.style.backgroundColor="#FAFAFA";
      chatBox.style.borderBottom="1px solid gray";

      var insertBox = document.getElementById("insertBox");
      insertBox.style.width="300px";
      insertBox.style.height="50px";
      insertBox.style.margin="0px";
      insertBox.style.marginTop="2px";
      insertBox.style.backgroundColor="#ffffff";
      insertBox.style.border="1px solid gray";
      insertBox.style.borderTop="none";
      
            var content_col = document.createElement("div");
            content_col.setAttribute("class", "col-9 pl-1 text-center");
            content_col.style.paddingRight="0px";
            content_col.style.paddingLeft="3px";
          
                var content_type = document.createElement("input");
               content_type.setAttribute("type", "text");
               content_type.setAttribute("id", "chat_content");
               content_type.setAttribute("class", "form-control");
               content_type.setAttribute("onkeydown", "onKeyDown()");
            
            var insert_col = document.createElement("div");
            insert_col.setAttribute("class", "col-3 text-right");
            insert_col.style.paddingRight="2px";
            insert_col.style.paddingLeft="0px";
      
               var insert_type = document.createElement("input");
               insert_type.setAttribute("type", "button");
               insert_type.setAttribute("value", "입력");
               insert_type.setAttribute("onclick", "insertChat()");
               insert_type.setAttribute("class", "btn btn-primary btn");

            content_col.appendChild(content_type);
            insert_col.appendChild(insert_type);
            
         insertBox.appendChild(content_col);
         insertBox.appendChild(insert_col);

      chating.appendChild(chatBox);
      chating.appendChild(insertBox);
   
      
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
                      var innerA = document.createElement("div");
                     innerA.setAttribute("class","col-12 mr-auto");
                     innerA.style.margin = '0px';
                     innerA.style.width="250px";
                      
                        var nameTime = document.createElement("div");
                        nameTime.setAttribute("class","row mr-auto");
                        nameTime.style.margin = '0px';
                        nameTime.style.padding = '0px';
                        nameTime.style.width="250px";
                  
                           var memberName = document.createElement("div");
                           memberName.setAttribute("class","col-3 font-italic text-info ");
                           memberName.style.margin = '0px';
                           memberName.style.paddingRight = '0%';
                           memberName.style.marginRight = '0%';
                           memberName.style.fontSize = 'x-small';
                     
                           var chatDate = document.createElement("div");
                           chatDate.setAttribute("class","col-9 weight-light text-black-50");
                           chatDate.style.fontSize = 'xx-small';
                           chatDate.style.paddingTop = '1%';
                        
                        nameTime.appendChild(memberName);
                        nameTime.appendChild(chatDate);
                     

                        var content = document.createElement("div");
                        content.setAttribute("class","row text-left mr-auto ");
                        content.style.margin = '0px';
                        content.style.padding = '0px';
                        content.style.width="250px";

                           var chatContent = document.createElement("div");
                           chatContent.setAttribute("class","col-10 font-weight-normal text-break text-primary");
                           chatContent.style.fontSize = 'small';
                           chatContent.style.fontWeight = 'bold';

                        content.appendChild(chatContent);
    
                  
                  }else{
                     
                     var innerA = document.createElement("div");
                     innerA.setAttribute("class","col-12 ml-auto text-right");
                     innerA.style.margin = '0px';
                     innerA.style.width="250px";
                     
                        var nameTime = document.createElement("div");
                        nameTime.setAttribute("class","row ml-auto text-right alert alert-light");
                        nameTime.style.margin = '0px';
                        nameTime.style.padding = '0px';
                  
                           var memberName = document.createElement("div");
                           memberName.setAttribute("class","col-9 ml-auto font-italic text-info");
                           memberName.style.margin = '0px';
                           memberName.style.paddingRight = '2px'; 
                           memberName.style.fontSize = 'x-small';
                     
                           var chatDate = document.createElement("div");
                           chatDate.setAttribute("class","col-3 weight-light text-black-50");
                           chatDate.style.fontSize = 'xx-small';
                           chatDate.style.paddingTop = '1%';
                           chatDate.style.paddingLeft = '0%';
                           chatDate.style.paddingRight = '0%';
                           chatDate.style.marginLeft = '0%';
                        
                        nameTime.appendChild(memberName);
                        nameTime.appendChild(chatDate);
                     

                        var content = document.createElement("div");
                        content.setAttribute("class","row ml-auto text-right alert alert-secondary");
                        content.style.margin = '0px';
                        content.style.padding = '0px';

                           var chatContent = document.createElement("div");
                           chatContent.setAttribute("class","col-10 ml-auto font-weight-normal text-break");
                           chatContent.style.fontSize = 'small';
                           chatContent.style.fontWeight = 'bold';

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
      
                  innerA.appendChild(nameTime);
                  innerA.appendChild(content);
                  
                  aaa.appendChild(innerA);
                  
                
                 }
               
            }
            
         aaa.scrollTop= chatBox.scrollHeight;
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
            
          xmlhttp.open("post", "${path}/chat/write_chat_process.do", true);
          xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
          xmlhttp.send("chat_content=" + content);
          
          document.getElementById("chat_content").value = '';
        
          
      };
   
    function onKeyDown(){
       
       var content = document.getElementById("chat_content").value;
        
       if(event.keyCode == 13 && content!=""){ 
           insertChat();
          
        }
      }
   
   
    function refresh(){
         setInterval("chatList()", 3000);
      }

</script>


<div style="position: fixed; bottom: 55px; right: 20px;">
   <!-- 채팅 박스 -->
   <div id="all" class="text-center"  >
      <div id="chatBox" style="overflow: auto;"></div>
      <!-- 입력창 -->
      <div class="row" id="insertBox" style="border: gray"></div>
   </div>
</div>

<div style="position: fixed; bottom: 15px; right: 10px;">
   <button class="btn btn-outline-secondary"
      onclick="chat_on(); refresh(); this.onclick=null;">채팅</button>
</div>
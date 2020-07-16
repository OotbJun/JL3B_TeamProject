<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
var isOpened = true;

function openclo(){
	 var chating = document.getElementById("all");
	 var chatboutton = document.getElementById("chatboutton");
    	if(isOpened==true){
    	 chat_on(); 
         refresh();
         chatboutton.style.opacity = "0.5";
         isOpened = false;
         
    	}else{
         chat_on(); 
         refresh();
         chatboutton.style.opacity = "1";
    	isOpened = true; 
         //refresh();
        
   }
}

var myTimer = null;

function refresh(){
   if(isOpened==true){
	   if(myTimer == null){
	   		myTimer = setInterval("chatList()", 2000);
   		}else{
   			clearInterval(myTimer);
   			setInterval("chatList()", 2000);
   		};
     
    	}else{
          clearInterval(myTimer);
          myTimer = null;

   }
      
};
//채팅공간 만들기
function chat_on() {
   var chating = document.getElementById("all");
   var chatBox = document.getElementById("chatBox");
   var insertBox = document.getElementById("insertBox");
   var content_col = document.getElementById("content_col");
   var insert_col = document.getElementById("insert_col");
   var content_type = document.getElementById("chat_content");
   var insert_type = document.getElementById("insertChat");
   
   insertBox.style.width="300px";
   insertBox.style.margin="0px";
   insertBox.style.marginTop="2px";
   insertBox.style.backgroundColor="#ffffff";
   //insertBox.style.border="1px solid gray";
   insertBox.style.borderTop="none";
   
        
        
   if(isOpened!=false){
	  insertBox.style.display = "grid";
	  chating.style.display = "block";
      chating.style.width="300px";
      chating.style.maxHeight="500px";
      chating.style.border="1px solid gray";
      
      chatBox.style.width="300px";
      chatBox.style.height="450px";
      // chatBox.style.margin="0px";
      chatBox.style.paddingBottom="10px";
      chatBox.style.backgroundColor="#FAFAFA";
      chatBox.style.borderBottom="1px solid gray";


      chating.appendChild(chatBox);
      chating.appendChild(insertBox);
   
   }else{
	   
       chating.style.display = "none";
   }   

};
     //채팅 출력창
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
                        nameTime.setAttribute("class","row mr-auto text-truncate");
                        nameTime.style.margin = '0px';
                        nameTime.style.padding = '0px';
                        nameTime.style.width="250px";
                  
                           var memberName = document.createElement("div");
                           memberName.setAttribute("class","col-3 font-italic text-info text-left");
                           memberName.style.margin = '0px';
                           memberName.style.paddingRight = '0%';
                           memberName.style.marginRight = '0%';
                           memberName.style.fontSize = 'x-small';
                     
                           var chatDate = document.createElement("div");
                           chatDate.setAttribute("class","col-9 weight-light text-black-50 text-left");
                           chatDate.style.fontSize = 'xx-small';
                           chatDate.style.padding = '0';
                           chatDate.style.paddingTop = '1%';
                        
                        nameTime.appendChild(memberName);
                        nameTime.appendChild(chatDate);
                     

                        var content = document.createElement("div");
                        content.setAttribute("class","row text-left mr-auto alert alert-secondary");
                        content.style.margin = '0px';
                        content.style.padding = '0px';
                        content.style.width="250px";

                           var chatContent = document.createElement("div");
                           chatContent.setAttribute("class","col-12 font-weight-normal text-break");
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
                           memberName.setAttribute("class","col-9 ml-auto font-italic text-info text-truncate");
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
                        content.setAttribute("class","row ml-auto text-right alert alert-primary");
                        content.style.margin = '0px';
                        content.style.padding = '0px';

                           var chatContent = document.createElement("div");
                           chatContent.setAttribute("class","col-12 ml-auto font-weight-normal text-break");
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
 
    //채팅 입력창
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
          if(content!=""){ 
        	  xmlhttp.send("chat_content=" + content);             
           }
         
          
          document.getElementById("chat_content").value = '';
        
          
      };
   
   //엔터키로 입력하는 func
    function onKeyDown(){
       
       var content = document.getElementById("chat_content").value;
        
       if(event.keyCode == 13 && content!=""){ 
           insertChat();
          
        }
      }
   
   //전송버튼 활성화
   function makeborder() {
	   var sendbtn = document.getElementById("sendbtn");
	   
	   sendbtn.style.border = "1px solid gray";
}
   //전송버튼 비활성화
   function removeborder() {
	   var sendbtn = document.getElementById("sendbtn");
	   
	   sendbtn.style.border = "none";
	
}
   
   

      
</script>

<c:if test="${!empty sessionUser }">
<div style="position: fixed; bottom: 105px; right: 20px; z-index: 3;">
   <!-- 채팅 박스 -->
   <div id="all" class="text-center mb-2" style="opacity: 0.9" >
      <div id="chatBox" style="overflow: auto;"></div>
      
   </div>
   <!-- 입력창 -->
      <div class="row" id="insertBox" style="border: gray; display: none;" >
        	<div class="col" style="padding-top:2px; padding-right: 3px; padding-left: 3px">
      		<input type="text" id="chat_content" onkeydown="onKeyDown()" style="width:250px; height: auto" placeholder="내용을 입력해주세요.">
        	<img src="${pageContext.request.contextPath }/resources/img/send.png" id="sendbtn"
        	style="width: 33px; height: auto;" onclick="insertChat();" onmouseover="makeborder();" onmouseout="removeborder();">
      		</div> 
      </div>
</div>

<div style="position: fixed; bottom: 72px; right: 10px; width: 3%; height: auto; z-index: 2;" >
   <button class="btn btn-outline-light btn-sm"
      onclick="openclo();" id="chatboutton">
     <img src="${pageContext.request.contextPath }/resources/img/chat_img.png" style="max-width: 100%">  
     </button>
</div>
</c:if>
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
<title>Touche 자게 글읽기</title>
<style>
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
	padding-bottom: 72px;
}

footer {
	margin-top: -72px;
	height: 72px;
	bottom: 0;
	left: 0;
	right: 0;
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
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
   crossorigin="anonymous">
   
</script>

<script type="text/javascript">
   function insert() {
      board_no = $('#board_no').val();

      console.log(board_no);
      commentList();

      $('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
         var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
         commentInsert(insertData); //Insert 함수호출(아래)
      });
   }
   //댓글
   var board_no = 0;
   $(document).ready(insert);

   //댓글 출력
   function commentList() {
	   
	  var reWriter = ${sessionUser.member_no};
	   
      board_no = $('#board_no').val();
      console.log("보드" + board_no);
      $
            .ajax({
               url : '../board/get_reply_list.do?board_no=' + board_no,
               type : 'get',
               data : {
                  'board_no' : board_no
               },
               success : function(data) {
                  var a = '';
                  $
                        .each(
                              data,
                              function(key, value) {
                                 a += '<div class="row" style="margin-top: 20px; border-bottom: solid thin;; border-bottom-color: #f4f4f4";>'
                                 a += '<div class="col-1" style="font-size:small; font-weight: bold;">'
                                       + value.memberVo.member_rname
                                       + '</div>';
                                 a += '<div class="col-8 commentContent'+value.boardReVo.board_re_no+'" style="font-size:small; white-space: pre";>'
                                       + value.boardReVo.board_re_content
                                       + '</div>';
                                 a += '<div class="col-3 text-right">'
                                 if(reWriter == value.boardReVo.member_no ){
                                	 a += '<a onclick="commentUpdate('
                                         + value.boardReVo.board_re_no
                                         + ',\''
                                         + value.boardReVo.board_re_content
                                         + '\');"style="font-size: x-small; margin-right: 4px; color:white;"; class="btn btn-info btn-sm";> 수정 </a>'
                                   a += '<a onclick="commentDelete('
                                         + value.boardReVo.board_re_no
                                         + ');"style="font-size:x-small; color:white;"; class="btn btn-danger btn-sm";> 삭제 </a></div>'
                                 }
                                
                                 a += '</div></div>';
                              });
                  $("#commentList").html(a);
               }   
            });
   }

   //댓글 입력
   function commentInsert(insertData) {
      $.ajax({
         url : '../board/write_reply_process.do?board_no=' + board_no,
         type : 'post',
         data : insertData,
         success : function(data) {
            if (data == 1) {
               commentList(); //댓글 작성 후 댓글 목록 reload
               $('[name=board_re_content]').val('');
            }
         }
      });
   }

   //댓글 수정 박스
   function commentUpdate(board_re_no, board_re_content) {
      var a = '';
      a += '<div class="input-group">';
      a += '<input type="text" class="form-control" name="board_re_content_'+board_re_no+'" value="'+board_re_content+'"/>';
      a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
            + board_re_no + ');">수정</button> </span>';
      a += '</div>';
      $('.commentContent' + board_re_no).html(a);
   }

   //댓글 수정
   function commentUpdateProc(board_re_no) {
      var updateContent = $('[name=board_re_content_' + board_re_no + ']')
            .val();

      $.ajax({
         url : '../board/update_reply_process.do',
         type : 'post',
         data : {
            'board_re_content' : updateContent,
            'board_re_no' : board_re_no
         },
         success : function(data) {
            if (data == 1)
               commentList(board_no); //댓글 수정후 목록 출력 
         }
      });
   }

   //댓글 삭제
   function commentDelete(board_re_no) {
      $.ajax({
         url : '../board/delete_reply_process.do/' + board_re_no,
         type : 'post',
         success : function(data) {
            if (data == 1) {
               commentList(board_no); //댓글 삭제후 목록 출력
            } else {
               alert("정신차려!");
            }
         }
      });
   }

   //추천수
   function refreshLike() {

      var boardNo = ${readBoard.boardVo.board_no};					//모델에 담긴 넘버 값 세팅 -> 넘겨줘야 하니까
      var xmlhttp = new XMLHttpRequest();
      var likeBox = document.getElementById("like_count");			//like_count(span) 가져와서 다시 세팅하기 위함
      var boxRow = document.createElement("span");

      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {	//readyState==4 : 데이터를 전부 받은 상태, 200 : 요청 성공

            var likeCount = xmlhttp.responseText;					//RESTful에서 리턴 타입 int 받아오기

            //var likeBox2 = document.createElement("span");

            var length = likeBox.childNodes.length;					//반복문 돌리기 위해 length 세팅

            boxRow.innerText = likeCount;							//span 안에 받아온 int 값 담아준다.

            for (var i = 0; i < length; i++) {
               likeBox.removeChild(likeBox.childNodes[0]);			//remove하고 append 해야 그 자리에서 변경
            }

            likeBox.appendChild(boxRow);							//다시 append 해서 숫자 증감
         }

      };

      xmlhttp.open("get", "./get_likecount.do?board_no=" + boardNo, true);	//보통 select는 get방식, insert ..~ 이런거는 post방식
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send();
   };

   //추천
   function like() {

      var boardNo = ${readBoard.boardVo.board_no};
      var like = document.getElementById("board_like").value;			//board_like 값, Y겠지 -> 인서트 시킬려고 가져온다.
      var xmlhttp = new XMLHttpRequest();

      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            refreshLike();				//성공한다면 증감을 보여줘야 하니까 출력 메서드 재호출
            refreshDislike();
         }
      };

      xmlhttp.open("post", "./choose_like_process.do", true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send("board_no=" + boardNo + "&board_like=" + like);		//해당 보드 넘버 + Y값 넘겨준다.

   }

   //비추수
   function refreshDislike() {

      var boardNo = ${readBoard.boardVo.board_no};
      var xmlhttp = new XMLHttpRequest();
      var dislikeBox = document.getElementById("dislike_count");
      var boxRow = document.createElement("span");

      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

            var dislikeCount = xmlhttp.responseText;

            //var likeBox2 = document.createElement("span");

            var length = dislikeBox.childNodes.length;

            boxRow.innerText = dislikeCount;

            for (var i = 0; i < length; i++) {
               dislikeBox.removeChild(dislikeBox.childNodes[0]);
            }

            dislikeBox.appendChild(boxRow);
         }

      };

      xmlhttp.open("get", "./get_dislikecount.do?board_no=" + boardNo, true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send();
   };

   //비추
   function dislike() {

      var boardNo = ${readBoard.boardVo.board_no};
      var dislike = document.getElementById("board_dislike").value;
      var xmlhttp = new XMLHttpRequest();

      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            refreshDislike();
            refreshLike();
         }
      };

      xmlhttp.open("post", "./choose_dislike_process.do", true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send("board_no=" + boardNo + "&board_like=" + dislike);

      console.log(dislike);

   };
   //자게 게시물 삭제 컨펌
   function submit_btn(){
         
         if(confirm("게시물을 삭제하시겠습니까?")== true){
            document.getElementById("board_del").submit();
            
         }else 
            false;
      }
</script>
</head>

<body onload="refreshLike(), refreshDislike()"style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
		<div id="content">
		<div class="col mt-4">
      <div class="row">
         <div class="col-1" ></div>
         <div class="col text-center" style="margin-top:4%;">
            <img
               src="${pageContext.request.contextPath }/resources/img/boardfix.png"
               style="max-width: 75%; height: auto;">
         </div>
         <div class="col-1"></div>

      </div>
   </div>
   <div class="container"
      style="margin-top: 60px; border-bottom: solid thin; border-bottom-color: #f4f4f4">
      <div class="row mt-1">
         <div class="col" style="font-size: xx-large; font-weight: bold;">${readBoard.boardVo.board_title}</div>
      </div>
      <div class="row mt-1 mb-1">
         <div class="col-1 " style="font-size: small;">
            ${readBoard.memberVo.member_rname}</div>
         <div class="col-1" style="font-size: small">
            <fmt:formatDate value="${readBoard.boardVo.board_wdate}"
               pattern="yyyy.MM.dd"></fmt:formatDate>
         </div>
         <div class="col"></div>
         <div class="col-1" style="font-size: small;">조회
            ${readBoard.boardVo.board_hits}</div>
         <div class="col-1" style="font-size: small">댓글
            ${readBoard.replyCount}</div>
         <div class="col-1" style="font-size: small;">좋아요
            ${readBoard.upCount}</div>
      </div>
   </div>

   <!-- 게시글 내용 및 이미지 -->
   <div class="container" style="margin-top: 20px; min-height:100px;">
      <div class="col-1"></div>
      <div class="col-10">
      <c:forEach items="${readBoard.boardImgList}" var="BoardImgVo">
         <img style="max-width: 50%; height: auto"
            src="/upload/${BoardImgVo.board_img_title}">
         <br>
      </c:forEach>
      <div class="row mt-1">
         <div class="col text-wrap" style="word-break: break-all; font-size: large;">${readBoard.boardVo.board_content }</div>
      </div>
      </div>
      <div class="col-1"></div>
   </div>



   <div class="container" style="margin-top: 30px;">
      <div class="row"
         style="border-bottom: solid thin; border-bottom-color: black">
         <div class="col-3"></div>
         <!-- 추천! -->
         <div class="col-6 text-center pt-3">
           
                 <!-- 추천수 -->
                  <span style="color: red" id="like_count"> </span>

                  <input type="image" onclick="like()" 
                     src="${pageContext.request.contextPath }/resources/img/like.png"
                  class="btn btn-group text-center mr-1" width="30" height="30"
                     id="board_like"
                     style="background-color: rgba(255, 255, 255, 0.0); border: none;
                      padding: 0px;"
                     value="Y">
                  


                 <input type="image" onclick="dislike()" 
                     src="${pageContext.request.contextPath }/resources/img/unlike.png"
                      class="btn btn-group text-center ml-1"
                     id="board_dislike"  width="30" height="30"
                    style="background-color: rgba(255, 255, 255, 0.0);border: none;
                      padding: 0px;"
                     value="N">
                    
                  <span style="color: red" id="dislike_count"></span>

         </div>



         <!-- 글 관리 버튼 -->


         <div class="col-3" style="padding: 6px auto;">
            <div class="row mt-3 mr-1 pb-1">
               <div class="col"></div>
               <div class="col-2" style="margin-right: 4px">

                  <c:if
                     test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no}">
                     <form 
                        action="${pageContext.request.contextPath }/board/board_change.do"
                        method="post">
                        <input type="hidden" name="board_no"
                           value="${readBoard.boardVo.board_no}"> <input
                           type="hidden" name="member_no"
                           value="${readBoard.boardVo.member_no}"> <input
                           type="hidden" name="currPage" value="${currPage }"> <input
                           class="btn btn-outline-info btn-sm" type="submit" value="수정">
                     </form>
                  </c:if>

               </div>
               <div class="col-2">
                  
                  <c:if
                     test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || !empty sessionAdmin}">
                     <!-- 마우스 올리면 주소창 뜨는 거 막음 -->
                     <form id ="board_del"
                        action="${pageContext.request.contextPath }/board/board_delete_process.do"
                        method="post">

                        <input type="hidden" name="board_no"
                           value="${readBoard.boardVo.board_no}"> <input
                           type="hidden" name="member_no"
                           value="${readBoard.boardVo.member_no}"> <input
                           class="btn btn-outline-danger btn-sm" type="button" value="삭제" onclick="submit_btn()">

                     </form>
                  </c:if>
               </div>

            </div>
         </div>
      </div>
   </div>
   <!-- 댓글 리스트 -->
   <div class="container mt-4" style="margin-top: 20px;">
      <div class="commentList" id="commentList"></div>
      <!-- 댓글 작성 -->
      <label for="content" class="mt-4">comment</label>
      <form name="commentInsertForm" onsubmit="return false">
         <div class="input-group">
            <input type="hidden" value="${readBoard.boardVo.board_no}"
               id="board_no" /> <input type="text" class="form-control"
               id="board_re_content" name="board_re_content"
               placeholder="내용을 입력하세요." maxlength="1000"> <span
               class="input-group-btn pl-2" style="padding-top: 4px">
               <button class="btn btn-outline-primary btn-sm" type="button"
                  name="commentInsertBtn">등록</button>
            </span>
         </div>
      </form>
   </div>
   <div class="container mt-3 mb-5">
      <div class="row">
         <div class="col-1 text-left" style="padding: 0px">
            <a
               href="${pageContext.request.contextPath}/board/board.do?currPage=${currPage }"
               class="btn btn-secondary btn-sm">목록</a>
         </div>
         <div class="col"></div>
         <div class="col-2 text-right" style="padding-right: 0px">
         <c:if test="${!empty sessionUser }">
            <a class="btn btn-outline-primary btn-sm"
               href="${pageContext.request.contextPath}/board/board_write.do">글쓰기</a>
         </c:if>
         </div>

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
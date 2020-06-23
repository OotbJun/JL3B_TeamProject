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
<meta charset="UTF-8">

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
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
         board_no = $('#board_no').val();
         console.log("보드" + board_no);
         $.ajax({
               url : '../board/get_reply_list.jan?board_no=' + board_no,
               type : 'get',
               data : {'board_no' : board_no},
                  success : function(data) {
                     var a = '';
                     $.each(data, function(key, value) {
                            a += '<div class="row" style="margin-top: 20px; border-bottom: solid thin;; border-bottom-color: #f4f4f4";>'
                               a += '<div class="col-1" style="font-size:small; font-weight: bold;">'+value.memberVo.member_rname +'</div>'; 
                               a += '<div class="col-8 commentContent'+value.boardReVo.board_re_no+'" style="font-size:small; white-space: pre";>'+value.boardReVo.board_re_content +'</div>';
                               a += '<div class="col-3 text-right">'
                               a += '<c:if test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || !empty sessionCenter && sessionCenter.center_no == readBoard.centerVo.center_no}"><a onclick="commentUpdate('+value.boardReVo.board_re_no+',\''+value.boardReVo.board_re_content+'\');"style="font-size: x-small";> 수정 </a></c:if>' 
                                a += '<c:if test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || !empty sessionCenter && sessionCenter.center_no == readBoard.centerVo.center_no}"><a onclick="commentDelete('+value.boardReVo.board_re_no+');"style="font-size:x-small";> 삭제 </a></c:if></div>'
                               a += '</div></div>';
                                 });
                     $("#commentList").html(a);
                  }
               });
     }

   //댓글 입력
   function commentInsert(insertData) {
      $.ajax({
         url : '../board/write_reply_process.jan?board_no=' + board_no,
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
         url : '../board/update_reply_process.jan',
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
         url : '../board/delete_reply_process.jan/' + board_re_no,
         type : 'post',
         success : function(data) {
            if (data == 1) {
               commentList(board_no); //댓글 삭제후 목록 출력
            }else{
               alert("정신차려!");
            }   
         }
      });
   }

   
   //추천수
   function refreshLike() {

      var boardNo = ${readBoard.boardVo.board_no};
      var xmlhttp = new XMLHttpRequest();
      var likeBox = document.getElementById("like_count");
      var boxRow = document.createElement("span");

      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

            var likeCount = xmlhttp.responseText;

            //var likeBox2 = document.createElement("span");

            var length = likeBox.childNodes.length;

            boxRow.innerText = likeCount;

            for (var i = 0; i < length; i++) {
               likeBox.removeChild(likeBox.childNodes[0]);
            }

            likeBox.appendChild(boxRow);
         }

      };

      xmlhttp.open("get", "./get_likecount.jan?board_no=" + boardNo, true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send();
   };

   //추천
   function like() {

      var boardNo = ${readBoard.boardVo.board_no};
      var like = document.getElementById("board_like").value;
      var xmlhttp = new XMLHttpRequest();

      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            refreshLike();
            refreshDislike();
         }
      };

      xmlhttp.open("post", "./choose_like_process.jan", true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send("board_no=" + boardNo + "&board_like=" + like);

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

      xmlhttp.open("get", "./get_dislikecount.jan?board_no=" + boardNo, true);
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

      xmlhttp.open("post", "./choose_dislike_process.jan", true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("board_no=" + boardNo + "&board_like=" + dislike);

      console.log(dislike);

   };
   
   
   
   
</script>
</head>

<body onload="refreshLike(), refreshDislike()">


   <jsp:include page="../commons/include_navi.jsp"></jsp:include>


   <div class="col mt-4">
      <div class="row">
         <div class="col-1"></div>
         <div class="col text-center">
            <img
               src="${pageContext.request.contextPath }/resources/img/boardfix.png" style="max-width: 75%; height: auto;">
         </div>
         <div class="col-1"></div>
         
      </div>
   </div>
   <div class="container"
      style="margin-top: 60px; border-bottom: solid thin;; border-bottom-color: #f4f4f4">
      <div class="row mt-1">
         <div class="col" style="font-size: medium; font-weight: bold;">${readBoard.boardVo.board_title}</div>
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
   <div class="container" style="margin-top: 20px;">

      <c:forEach items="${readBoard.boardImgList}" var="BoardImgVo">
         <img style="max-width: 50%; height: auto"
            src="/upload/${BoardImgVo.board_img_title}">
         <br>
      </c:forEach>
      <div class="row mt-1">
         <div class="col text-wrap">${readBoard.boardVo.board_content }</div>
      </div>
   </div>


   <!-- 추천! -->
   <div class="container" style="margin-top: 20px;">
      <div class="row"
         style="border-bottom: solid thin; border-bottom-color: black">
         <div class="col-2"></div>
         <div class="col-8 text-center ">
            <div class="row">
               <div class="col-4"></div>
               <div class="col-4">

                  <!-- 
                  <span style="color: red">${readBoard.upCount }</span> 
                  <a
                     href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=Y&board_no=${readBoard.boardVo.board_no}"
                     style="text-decoration: none;"> 
                     <img
                     src="${pageContext.request.contextPath }/resources/img/heart.ico"
                     style="width: 40%; height: auto">
                  </a> 
                  <a
                     href="${pageContext.request.contextPath }/board/choose_like_process.jan?board_like=N&board_no=${readBoard.boardVo.board_no }">
                     <img
                     src="${pageContext.request.contextPath }/resources/img/sad.png"
                     style="width: 25%; height: auto">
                  </a> <span style="color: red">${readBoard.downCount }</span>
                -->
                  
                  <!-- 추천수 -->
                  <span style="color: red" id="like_count"> </span>
                  
               <!--  -->   

               
                  <button type="button" 
                   
                  onclick="like()"   
                  
                  class="btn btn-group" id="board_like"
                     style="background-color: rgba(255, 255, 255, 0.0); border: none; max-width: 40%;"
                     value="Y">
                     <img class="btn-img"
                        src="${pageContext.request.contextPath }/resources/img/heart.ico"
                        style="max-width: 100%">
                  </button>
               
               
                  <button type="button" onclick="dislike()" class="btn btn-group"
                     id="board_dislike"
                     style="background-color: rgba(255, 255, 255, 0.0); border: none; max-width: 40%;"
                     value="N">
                     <img class="btn-img"
                        src="${pageContext.request.contextPath }/resources/img/sad.png"
                        style="max-width: 40%">
                  </button>
                  <span style="color: red" id="dislike_count"></span>

               </div>
               <div class="col-4"></div>
            </div>
         </div>

         <!-- 글 관리 버튼 -->
         <div class="col-2 text-right" style="font-size: x-small;">
            <ul>
               <li><c:set var="admin" value="${sessionUser.npki_key}"></c:set>
                  <c:if
                     test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || fn:contains(admin, 'admin') }">
                     <!-- 마우스 올리면 주소창 뜨는 거 막음 -->
					   <form action="${pageContext.request.contextPath }/board/board_delete_process.jan" method="post">
					      
					      <input type="hidden" name="board_no" value="${readBoard.boardVo.board_no}">
					      <input type="hidden" name="member_no" value="${readBoard.boardVo.member_no}">
					      <input class="btn btn-outline-danger" type="submit" value="삭제">
					      
					   </form>
                  </c:if></li>
               <li><c:if
                     test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no}">
                     <form action="${pageContext.request.contextPath }/board/board_change.jan" method="post">
						<input type="hidden" name="board_no" value="${readBoard.boardVo.board_no}">
			      		<input type="hidden" name="member_no" value="${readBoard.boardVo.member_no}">
			      		<input type="hidden" name="currPage" value="${currPage }">
			      		<input class="btn btn-outline-info" type="submit" value="수정">
					</form>
                  </c:if></li>
               <li><c:if
                     test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no}">
                     <a
                        href="${pageContext.request.contextPath}/board/delete_board_img.jan?board_no=${readBoard.boardVo.board_no}">이미지삭제</a>
                  </c:if></li>
            </ul>
         </div>
      </div>
   </div>

   <!-- 댓글 리스트 -->
   <div class="container"
      style="margin-top: 20px; border-bottom: solid thin;; border-bottom-color: #f4f4f4">
      <div class="commentList" id="commentList"></div>
      <!-- 댓글 작성 -->
      <label for="content">comment</label>
      <form name="commentInsertForm" onsubmit="return false">
         <div class="input-group">
            <input type="hidden" value="${readBoard.boardVo.board_no}"
               id="board_no" /> <input type="text" class="form-control"
               id="board_re_content" name="board_re_content"
               placeholder="내용을 입력하세요." maxlength="1000"> <span class="input-group-btn">
               <button class="btn btn-default" type="button"
                  name="commentInsertBtn">등록</button>
            </span>
         </div>
      </form>
   </div>
   <div class="container text-right mt-2" style="padding: 0px">
      <a href="${pageContext.request.contextPath}/board/board.jan?currPage=${currPage }"
			class="btn btn-light">목록으로</a>
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
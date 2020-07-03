<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta name="description" content="">
 <meta name="author" content="">
<title>자유게시판</title>

 <!-- Custom fonts for this template-->
  <link href="${path }/resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
                                 a += '<c:if test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || !empty sessionCenter && sessionCenter.center_no == readBoard.centerVo.center_no}"><a onclick="commentUpdate('
                                       + value.boardReVo.board_re_no
                                       + ',\''
                                       + value.boardReVo.board_re_content
                                       + '\');"style="font-size: x-small; margin-right: 4px;"; class="btn btn-outline-info btn-sm";> 수정 </a></c:if>'
                                 a += '<c:if test="${!empty sessionUser && sessionUser.member_no == readBoard.memberVo.member_no || !empty sessionCenter && sessionCenter.center_no == readBoard.centerVo.center_no}"><a onclick="commentDelete('
                                       + value.boardReVo.board_re_no
                                       + ');"style="font-size:x-small"; class="btn btn-outline-danger btn-sm";> 삭제 </a></c:if></div>'
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

      xmlhttp.open("get", "./get_likecount.do?board_no=" + boardNo, true);
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

      xmlhttp.open("post", "./choose_like_process.do", true);
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
<body id="page-top">
<!-- Page Wrapper -->
  <div id="wrapper">
   
      <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/admin/main.do">
        
        <div class="sidebar-brand-text mx-3"> Admin <sup>2</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/main.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>HOME</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
           board
      </div>
    

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>게시판</span>
        </a>
        <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">게시판 관리:</h6>
         
            <a class="collapse-item " href="${path }/admin/notice.do">공지사항</a>
            <a class="collapse-item active" href="${path }/admin/board.do">자유게시판</a>
            <a class="collapse-item" href="${path }/admin/idea.do">주민청원</a>
           
          </div>
        </div>
      </li>

      <!-- 줄 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
           편의시설
      </div>

  

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>선거</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/member_control.do">
          <i class="fas fa-fw fa-table"></i>
          <span>클래스</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

    <jsp:include page="../commons/admin_navi.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">FREE BOARD</h1>
             <div class="card border-0 shadow my-5">
              <div class="card-body p-5">
                 <table class="table table-hover text-center">
                     <thead style="font-size: small">
                        <tr>
                           <td></td>
                           <td class="text-left pl-1">제목</td>
                           <td>작성자</td>
                           <td>작성일</td>
                           <td>조회수</td>
                           <td>좋아요</td>
                        </tr>
                     </thead>

                     <!-- 공지사항 리스트 -->
                     <tbody>
                        <c:forEach items="${boardNoticeList}" var="boardNoticeList"
                           begin="0" end="2">
                           <tr class="text-center">
                              <td class="fix_horsehead" style="font-weight: bold">${boardNoticeList.noticeVo.horsehead_sort}</td>
                              <td class="text-left pl-1" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                 href="${pageContext.request.contextPath}/admin/notice_read.do?notice_no=${boardNoticeList.noticeVo.notice_no}">${boardNoticeList.noticeVo.notice_title}</a></td>
                              <td>${boardNoticeList.memberVonotice.member_rname}${boardNoticeList.adminVo.admin_name }</td>
                              <td><fmt:formatDate
                                    value="${boardNoticeList.noticeVo.notice_wdate}"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td>${boardNoticeList.noticeVo.notice_hits}</td>
                              <td>${boardNoticeList.like}</td>
                           </tr>
                        </c:forEach>

                        <!-- 인기글 리스트 -->
                        <c:forEach items="${boardHotList}" var="boardHotList" begin="0"
                           end="3">
                           <tr class="text-center">
                              <td style="font-weight: bold">${boardHotList.boardVo.horsehead_sort}</td>
                              <td class="text-left pl-1" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                 href="${pageContext.request.contextPath}/admin/board_read.do?board_no=${boardHotList.boardVo.board_no}">${boardHotList.boardVo.board_title}
                                    (${boardHotList.replyCount })</a></td>
                              <td>${boardHotList.memberVoHot.member_rname}</td>
                              <td><fmt:formatDate
                                    value="${boardHotList.boardVo.board_wdate}"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td>${boardHotList.boardVo.board_hits}</td>
                              <td>${boardHotList.like}</td>
                           </tr>
                        </c:forEach>
                     </tbody>


                     <!-- 자유게시판 리스트 -->
                     <tbody>
                        <c:forEach items="${boardList}" var="boardList">
                           <tr class="text-center">
                              <td>${boardList.boardVo.board_no}</td>
                              <td class="text-left pl-1" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                 href="${pageContext.request.contextPath}/admin/board_read.do?board_no=${boardList.boardVo.board_no}&currPage=${currPage }">${boardList.boardVo.board_title}
                                    <c:if test="${boardList.replyCount > 0 }">
                                    (${boardList.replyCount })</c:if>
                              </a></td>
                              <td>${boardList.memberVo.member_rname}</td>
                              <td><fmt:formatDate
                                    value="${boardList.boardVo.board_wdate}"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td>${boardList.boardVo.board_hits}</td>
                              <td>${boardList.like}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  
        <div class="row mt-3">
      <div class="col-2"></div>
      <!-- 페이지 이동 -->
      <div class="col">
         <div class="row">
            <div class="col-4"></div>
            <div class="col">
               <nav id="nav" aria-label="Page navigation example"
                  style="text-align: center">
                  <ul class="pagination">
                     <li
                        class="page-item<c:if test="${beginPage-1 <= 0 }"> disabled</c:if>"><a
                        class="page-link"
                        href="./notice.do?currentPage=${beginPage-1}&searchWord=${param.searchWord}">이전</a></li>
                     <c:forEach begin="${beginPage}" end="${endPage}" var="i">
                        <li
                           class="page-item<c:if test="${currentPage == i}"> active</c:if>"><a
                           class="page-link"
                           href="./notice.do?currentPage=${i}&searchWord=${param.searchWord}">${i}</a></li>
                     </c:forEach>
                     <li
                        class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
                        class="page-link"
                        href="./notice.do?currentPage=${endPage+1}&searchWord=${param.search_word}">다음</a></li>
                  </ul>
               </nav>

            </div>
            <div class="col-2"></div>

         </div>
      </div>
      <div class="col-2"></div>
   </div>

         
              </div>
           
              
           </div>
                                
           
        </div>
            
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



  <!-- Bootstrap core JavaScript-->
  <script src="${path }/resources/js/jquery.min.js"></script>
  <script src="${path }/resources/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${path }/resources/js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${path }/resources/js/sb-admin-2.min.js"></script>




</body>
</html>
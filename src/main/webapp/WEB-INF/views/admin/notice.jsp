<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>관리자 모드</title>

  <!-- Bootstrap core CSS -->
  <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${path}/resources/css/simple-sidebar.css" rel="stylesheet">

   

</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">관리자모드-공지사항 </div>
      <div class="list-group list-group-flush">
        <a href="${path}/admin/notice.do" class="list-group-item list-group-item-action bg-light">공지사항</a>
        <a href="${path }/admin/gun.do" class="list-group-item list-group-item-action bg-light">자유게시판</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">주민청원</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">선거</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">센터</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">회원관리</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">     
    
    
      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
       
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="${path}/admin/main.do">Home <span class="sr-only">(current)</span></a>
            </li>
            
            <c:choose>
               <c:when test="${!empty sessionAdmin }">
                  <a class="nav-link" href="${path}/admin/logout_process.do">로그아웃</a>
               </c:when>
            
               <c:otherwise>
                  <li class="nav-item">
                    <a class="nav-link" href="${path}/admin/login.do">로그인</a>
                  </li>
               </c:otherwise>
            </c:choose>
                      
          </ul>
        </div>
      </nav>
      

      <div class="container-fluid">       
           <h1 class="mt-4">공지사항</h1>
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
                        </tr>
                     </thead>
                     <!-- 공지리스트 출력 -->
                     <tbody>
                        <c:forEach items="${noticeList }" var="noticeList">
                           <tr class="text-center">
                              <td style="font-weight: bold">${noticeList.noticeVo.horsehead_sort }</td>
                              <td class="text-left pl-1" style="overflow:hidden; text-overflow: ellipsis; max-width: 500px"><a
                                 href="${pageContext.request.contextPath }/admin/notice_read.do?notice_no=${noticeList.noticeVo.notice_no}&currentPage=${currentPage }">
                                    ${noticeList.noticeVo.notice_title }</a></td>
                              <td>${noticeList.adminVo.admin_name }</td>
                              <td><fmt:formatDate
                                    value="${noticeList.noticeVo.notice_wdate }"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td>${noticeList.noticeVo.notice_hits }</td>

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
   
      <div class="row">
         <div class="col-5"></div>
         <div class="col-5"></div>
         <div class="col-2 text-left">
            <!--<c:set value="${sessionUser.npki_key }" var="key"></c:set>-->
            <c:if test="${!empty sessionAdmin }">
               <a
                  href="${path}/admin/notice_write.do"
                  class="btn btn-outline-primary btn-sm">글쓰기</a>
            </c:if>
         </div>
         
      
      
      
      
      
      </div>

         
              </div>
           
              
           </div>
           
           
           
        </div>
        

         </div>
    </div>
    <!-- /#page-content-wrapper -->

  
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="${path}/resources/js/jquery/jquery.min.js"></script>
  <script src="${path}/resources/js/bootstrap.bundle.min.js"></script>


  

</body>

</html>
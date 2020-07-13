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
<title>청원</title>

 <!-- Custom fonts for this template-->
  <link href="${path }/resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">
<!-- Page Wrapper -->
  <div id="wrapper">
   
     <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/admin/main.do">
        
        <div class="sidebar-brand-text mx-3">TN Admin <sup>♥</sup></div>
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
         
            <a class="collapse-item" href="${path }/admin/notice.do">공지사항</a>
            <a class="collapse-item " href="${path }/admin/board.do">자유게시판</a>
            <a class="collapse-item active" href="${path }/admin/idea.do">주민청원</a>
           
          </div>
        </div>
      </li>

      <!-- 줄 -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
            setting
      </div>

  

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/vote.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>선거</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/member_control.do">
          <i class="fas fa-fw fa-table"></i>
          <span>회원 관리</span></a>
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
          <h1 class="h3 mb-4 text-gray-800">주민청원</h1>
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
                           <td>청원수</td>
                        </tr>
                     </thead>

                     
                     
                        



                     <!-- 청원 리스트 -->
                     <tbody>
                        <c:forEach items="${ideaList}" var="ideaList">
                           <tr class="text-center" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px">
                           <c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
                              <c:if test="${!fn:contains(answer,'답변')}">
                              <td>${ideaList.ideaVo.horsehead_sort }</td>
                              </c:if>
                              <c:if test="${fn:contains(answer,'답변')}">
                              <td></td>
                              </c:if>
                              
                           <c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
                              <c:if test="${fn:contains(answer,'답변')}">
                                 <td class="text-left pl-5" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                    href="${pageContext.request.contextPath}/admin/idea_read.do?idea_no=${ideaList.ideaVo.idea_no}&currPage=${currPage }">
                                    ${ideaList.ideaVo.idea_title}</a>
                                 </td>
                              </c:if>
                           <c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
                              <c:if test="${!fn:contains(answer,'답변')}">
                                 <td class="text-left pl-2" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
                                    href="${pageContext.request.contextPath}/admin/idea_read.do?idea_no=${ideaList.ideaVo.idea_no}&currPage=${currPage }">
                                    ${ideaList.ideaVo.idea_title}</a></td>
                              </c:if>
                              <!-- 이름 -->
                                                                     
                                    <td>${ideaList.adminVo.admin_name}${ideaList.memberVo.member_rname}</td>
                              
                              <td><fmt:formatDate value="${ideaList.ideaVo.idea_wdate}"
                                    pattern="yy.MM.dd hh:mm:ss" /></td>
                              <td>${ideaList.ideaVo.idea_hits}</td>
                  
                              <c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
                              <c:if test="${!fn:contains(answer,'답변')}">
                                 <td>${ideaList.ideaLike}</td>   
                              </c:if>
                              <c:if test="${fn:contains(answer,'답변')}">
                                 <td></td>
                              </c:if>
                  
                                 
                                       
                                 

                                 
                              
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
                        href="./idea.do?currentPage=${beginPage-1}">이전</a></li>
                     <c:forEach begin="${beginPage}" end="${endPage}" var="i">
                        <li
                           class="page-item<c:if test="${currentPage == i}"> active</c:if>"><a
                           class="page-link"
                           href="./idea.do?currentPage=${i}">${i}</a></li>
                     </c:forEach>
                     <li
                        class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
                        class="page-link"
                        href="./idea.do?currentPage=${endPage+1}">다음</a></li>
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
      <jsp:include page="../commons/admin_footer.jsp"></jsp:include>
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
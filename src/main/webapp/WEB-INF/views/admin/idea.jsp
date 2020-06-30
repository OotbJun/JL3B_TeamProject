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
<title>Insert title here</title>

 <!-- Custom fonts for this template-->
  <link href="${path }/resources/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">
<!-- Page Wrapper -->
  <div id="wrapper">
   
   <jsp:include page="../commons/admin_sidebar.jsp"></jsp:include>

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
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
          <h1 class="h3 mb-4 text-gray-800">main</h1>
           <div class="card border-0 shadow my-5">
              <div class="card-body p-5">
                 
            <h3 class="font-weight-light">${readNotice.noticeVo.notice_title }</h3>
                  <p class="lead"><br>
            
            <div class="row">
               <div class="col-1"><p class="font-weight-bolder">작성자:</p></div>
               <div class="col-1">${readNotice.adminVo.admin_name }${readNotice.memberVo.member_rname }</div>
               <div class="col"></div>            
            </div>
            
            <div class="row">
               <div class="col-1"><p class="font-weight-bolder">조회수:</p></div>
               <div class="col-1">${readNotice.noticeVo.notice_hits }</div>
               <div class="col"></div>            
            </div>
            
            
            <p class="font-weight-bolder">내용</p>
            <h4 class="font-weight-light">${readNotice.noticeVo.notice_content}</h4><br>      
            <br><br><br>
         
                     
                  <div class="row">
                     <div class="col"></div>
                     <div class="col"></div>
                     <div class="col">
                        <a href="${path}/admin/notice.do?currentPage=${currentPage}"><input type="submit" class="btn btn-secondary btn-xs" value="목록"></a>
                        <a href="${path}/admin/notice_change.do?notice_no=${readNotice.noticeVo.notice_no}&currentPage=${currentPage}"><input type="submit" class="btn btn-light btn-xs" value="수정"></a>
                        <a href="${path}/admin/notice_delete_process.do?notice_no=${readNotice.noticeVo.notice_no}"><input type="submit" class="btn btn-light btn-xs" value="삭제"
                        onclick="return confirm('삭제하시겠습니까?');"></a>
                        
                     </div>
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
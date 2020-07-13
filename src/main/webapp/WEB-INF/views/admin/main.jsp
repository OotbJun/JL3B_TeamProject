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
          <h2 class="h3 mb-4 text-gray-800">HOME</h2>
          <div class="row">
             <div class="col">
                <div class="card border-left-primary shadow h-100 py-2">
                   <div class="card-body">
                       <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">공지사항</div>                  
                       <a href="${path}/admin/notice.do"><input type="button" class="btn btn-primary btn-sm" value="바로가기"></a>               
                   </div>             
                </div>             
             </div>
             <div class="col">
                <div class="card border-left-info shadow h-100 py-2">
                   <div class="card-body">
                       <div class="text-xs font-weight-bold text-info text-uppercase mb-1">자유게시판</div>
                       <a href="${path}/admin/board.do"><input type="button" class="btn btn-info btn-sm" value="바로가기"></a>               
                   </div>             
                   </div>             
                </div>                   
             <div class="col">
                <div class="card border-left-warning h-100 py-2">
                   <div class="card-body">
                       <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">주민청원</div>
                       <a href="${path}/admin/idea.do"><input type="button" class="btn btn-warning btn-sm" value="바로가기"></a>               
                   </div>             
                   </div>             
                </div>            
          </div>
          <div class="row">
             <div class="col">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                   <h6 class="m-0 font-weight-bold text-primary">TN ADMIN PAGE</h6>
                </div>
                <div class="card-body"><img src="${pageContext.request.contextPath }/resources/img/admin_main.jpg" width="800px" height="520px"></div>
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
           <span>Copyright &copy; Touche_Nubes 2020</span>
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
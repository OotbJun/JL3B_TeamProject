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
<script type="text/javascript">

function submit_btn(){
      
      if(confirm("게시물을 수정하시겠습니까?")== true){
         document.getElementById("notice_update").submit();
         
      }else 
         false;
   }


</script>
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
          <h1 class="h3 mb-4 text-gray-800">NOTICE</h1>
          
              <div class="card border-0 shadow my-5">
              <div class="card-body p-5">
              
              <h1 class="font-weight-light"></h1>
                  <p class="lead">공지사항 글쓰기</p>
                     <form id="notice_update" action="${path}/admin/notice_change_process.do" method="post">
                     
                     <!-- 말머리 -->
                     <!--  <div class="row">
                           <div class="col">
                           <select class="form-control form-control-sm" id="notice_horsehead" name="notice_horsehead">
                           <option>[공지]</option>
                           </select>
                        </div>
                        <div class="col"></div>
                        <div class="col"></div>
                     </div> -->   
                     <!-- 제목 -->
                  <div class="row">   
                     <div class="col">
                        <div class="form-group">
                           <label for="title">제목</label>
                           <input type="text" class="form-control" id="notice_title" placeholder="${readNotice.noticeVo.notice_title }" name="notice_title">                           
                           </div> 
                        </div>
                        <div class="col"></div>
                     <div class="col"></div>
                        
                     </div>   
                        <!-- 글쓴이 -->
                     <div class="row">
                        <div class="col">
                        <div class="form-group">
                           <label for="admin">작성자</label><br>
                           <input class="form-control" type="text" placeholder="${sessionAdmin.admin_name }" readonly>
                           </div>                           
                        </div> 
                        <div class="col"></div>
                     <div class="col"></div>
                        
                     </div>   
                        <!-- 내용 -->
                        <div class="form-group">
                           <label for="content">내용</label>
                           <textarea class="form-control" id="notice_content"  placeholder="${readNotice.noticeVo.notice_content}" rows="8" name="notice_content"></textarea>                           
                        </div>
                        
                        <div>
                        <input type="button" class="btn btn-secondary btn-xs" value="수정" onclick="submit_btn()">
                        <input type="hidden" name="notice_no" value="${readNotice.noticeVo.notice_no}">                
                        </div>                        
                     </form>   
                     
 
 
     <!-- 밑에 부분 -->   
      



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
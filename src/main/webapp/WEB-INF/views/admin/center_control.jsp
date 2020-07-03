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

function drop_btn(){
	   if(confirm("회원탈퇴를 하시겠습니까?")==true){
		  document.getElementById("center_drop").submit();
	      alert("정상적으로 처리 되었습니다."); 
	   }
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
          <h1 class="h3 mb-4 text-gray-800">회원관리</h1>

               <ol class="breadcrumb">

                  <li class="breadcrumb-item active"><a
                     href="${path}/admin/member_control.do">입주민 회원</a>
                  </li>
                  <li class="breadcrumb-item "><a href="${path}/admin/center_control.do">센터 회원<span class="sr-only">(current)</span></a></li>
                  
                  <li class="breadcrumb-item active"><a
                     href="${path}/admin/npki_create.do">인증 키</a>
                  
               </ol>

               <div class="card border-left-primary shadow my-5" style="overflow:auto;">
                 <div class="card-body p-5"  >
                 
                 <form action="${path }/admin/center_drop_process.do" id="center_drop">
                 <table class="table table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th>이름</th>                        
                                <th>아이디</th>
                                <th>메일</th>
                                <th>인증키</th>
                                <th>가입날짜</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${centerList}" var="center">
                            <tr>
                                <td><input type="checkbox" name="center_no" value="${center.center_no }"></td>
                                <td>${center.center_name}</td>                                
                                <td>${center.center_id}</td>
                                                           
                                <td>${center.center_mail}</td>
                                <td>${center.npki_key}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${center.center_jdate}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    
                    <input type="button" class="btn btn-outline-danger" value="탈퇴" onclick="drop_btn()">
                    </form>
                 
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
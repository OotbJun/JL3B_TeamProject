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
  
  	function start_btn(){
	   if(confirm("새로운 선거를 시작하시겠습니까?")==true){
		  
	      alert("선거가 시작되었습니다.");
	      
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
          <h1 class="h3 mb-4 text-gray-800 text-center">선거</h1>
             
                                
           
        </div>
            
        <!-- /.container-fluid -->
        <!-- 선거 없을 때 -->
		 <c:if test="${status.equals('E_END') || empty status }"><h1>진행중인 선거가 없습니다.</h1></c:if>
		 <!-- 선거 진행중 -->
		 <c:if test="${!empty status && !status.equals('E_END') }"><h1>${round }회차 입주민 대표 선거가 진행 중입니다.</h1></c:if>
		 <!-- 입후보 등록 기간 -->
		 <c:if test="${status.equals('C_ING') }">후보 등록 기간 : <fmt:formatDate value="${electionVo.candy_startdate }" pattern="yy.MM.dd"/>
		 												~<fmt:formatDate value="${electionVo.candy_enddate }" pattern="yy.MM.dd"/></c:if>
		<!-- 투표 기간 -->
		<c:if test="${status.equals('V_ING') }">투표 기간 : <fmt:formatDate value="${electionVo.vote_startdate }" pattern="yy.MM.dd"/>~
															<fmt:formatDate value="${electionVo.vote_enddate }" pattern="yy.MM.dd"/></c:if>		 												
		 												
         <!-- 선거 스타트 -->
         <c:if test="${!empty sessionAdmin && !status.equals('C_ING') && !status.equals('V_ING') }">
            <div class="row">
               <div class="col text-center">
                  <div class="col-md-12 text-center">
                     <a href="${pageContext.request.contextPath }/admin/vote_start.do" onclick="start_btn()"><img
                        src="${pageContext.request.contextPath }/resources/img/newVote.png"
                        style="max-width: 800px; height: auto"></a>
                  </div>
               </div>
            </div>
         </c:if>
         
         

		
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
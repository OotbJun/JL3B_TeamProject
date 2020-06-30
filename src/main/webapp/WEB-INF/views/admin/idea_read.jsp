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
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="${path }/resources/css/all.min.css" rel="stylesheet"
   type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path }/resources/css/sb-admin-2.min.css" rel="stylesheet">


<script type="text/javascript">
   //자게 게시물 삭제 컨펌
   function submit_btn() {

      if (confirm("게시물을 삭제하시겠습니까?") == true) {
         document.getElementById("board_del").submit();

      } else
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
               <h1 class="h3 mb-4 text-gray-800">주민청원</h1>
               <div class="card border-0 shadow my-5">
                  <div class="card-body p-5">
                  
               <h3 class="font-weight-bolder">${readIdea.ideaVo.idea_title}</h3>
                  <p class="lead"><br>
            
            <div class="row">
               <div class="col"><p class="font-weight-bolder">작성자:&nbsp; ${readIdea.memberVo.member_rname } ${readIdea.adminVo.admin_name }</p></div>
               <div class="col-1"><p class="font-weight-bolder">조회수: ${readIdea.ideaVo.idea_hits }</p></div>
               <div class="col-1">
               

				<c:set var="answer" value="${readIdea.ideaVo.idea_title}"></c:set>
				<c:if test="${!fn:contains(answer,'답변')}">
                        <p class="font-weight-bolder">청원수: ${readIdea.upCount}</p>
               </c:if>        
               
               
               </div>
               <div class="col-1"><p class="font-weight-bolder"></p></div>            
            </div>
            
            
            <div class="row">
               <div class="col-9">
                  <c:forEach items="${readIdea.ideaImgList}" var="IdeaImgVo">
                           <img style="max-width: 50%; height: auto"
                              src="/upload/${IdeaImgVo.idea_img_title}">
                           <br>
                        </c:forEach>
                        <div class="row mt-1">
                           <div class="col text-wrap" style="word-break: break-all;"><p class="font-weight-bolder">내용: <br> ${readIdea.ideaVo.idea_content }</p></div>
                        </div>               
               </div>
               <div class="col"></div>
               <div class="col"></div>            
            </div>
            
            <div class="row">
               <div class="col"></div>
               <div class="col-1">
                  

			<c:set var="answer" value="${readIdea.ideaVo.idea_title}"></c:set>
				<c:if test="${!fn:contains(answer,'답변')}">
                       
                        <a href="${path}/admin/idea_answer.do?idea_no=${readIdea.ideaVo.idea_no}"><input type="submit" class="btn btn-outline-secondary btn-sm" value="답변하기"></a>
               </c:if>
               </div>
               <div class="col-1"> 
                  <a href="${path}/admin/idea_delete_process.do?idea_no=${readIdea.ideaVo.idea_no}"><input type="submit" class="btn btn-outline-danger btn-sm" value="삭제"
                        onclick="return confirm('삭제하시겠습니까?');"></a>
               </div>
            
            </div>
            
                        
               </div>
            </div>

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
   </div>
   <!-- End of Page Wrapper -->

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
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
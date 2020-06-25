<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <div class="sidebar-heading"> 관리자 모드 </div>
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
        
           <h1 class="mt-4">관리자 모드</h1>
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
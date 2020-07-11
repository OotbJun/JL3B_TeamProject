<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

       <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
          
          
          <!-- 줄 -->
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            
            <c:choose>
            
            <c:when test="${empty sessionAdmin }">
               <li class="nav-item dropdown no-arrow">
                 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인</span>
                 </a>
             </c:when>
             
             <c:otherwise>
                <li class="nav-item dropdown no-arrow">
                 <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionAdmin.admin_name }</span>
                 </a>
             </c:otherwise>
            </c:choose>  
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                
                <a class="dropdown-item" href="${path}/board/main.do">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                     메인페이지
                </a>
               
                <div class="dropdown-divider"></div>
                
                
                <c:choose>
                <c:when test="${!empty sessionAdmin}">
                     <a class="dropdown-item" href="${path}/admin/logout_process.do"
                        > <i
                        class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                     </a>
                  </c:when>
                
                <c:otherwise>
                <a class="dropdown-item" href="${path }/admin/login.do">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  login
                </a>
                </c:otherwise>
                
                </c:choose>
             
                                               
              </div>
            

          </ul>
          

        </nav>
        <!-- End of Topbar -->

</body>
</html>
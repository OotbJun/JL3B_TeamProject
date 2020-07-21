<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<header>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #000000">
      <div class="container">
       <a class="navbar-brand" href="${pageContext.request.contextPath }/board/main.do">Touche Nubes</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
         aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath }/board/notice.do">공지사항
                  <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath }/board/board.do">자유게시판</a>
            </li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath }/board/idea.do">주민청원</a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath }/vote/vote_choice.do">선거
            </a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath }/center/center.do">클래스
            </a></li>
             
         </ul>
         <c:choose>
            <c:when test="${!empty sessionUser || !empty sessionCenter }">
               <ul class="nav navbar-nav navbar-right">
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#"
                     id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> <c:set var="member"
                           value="${sessionUser.npki_key }"></c:set> <c:if
                           test="${fn:contains(member,'admin') }">${sessionUser.member_rname }님</c:if>
                        <c:if test="${fn:contains(member,'nubes-1') }">${sessionUser.member_rname }님</c:if>

                        <c:set var="center" value="${sessionCenter.npki_key }"></c:set>
                        <c:if test="${fn:contains(center,'center') }">${sessionCenter.center_name }님</c:if>

                  </a>
                     <div class="dropdown-menu"
                        aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item"
                           href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath }/member/mypage.do">마이페이지</a> 
                        
                        
                        <a class="dropdown-item" href="${pageContext.request.contextPath }/admin/main.do">관리자 페이지</a>
                        
                     </div></li>
               </ul>
            </c:when>
            <c:otherwise>
               <ul class="nav navbar-nav navbar-right">
                  <li class="nav-item" style="list-style: none"><a
                     class="nav-link"
                     href="${pageContext.request.contextPath }/member/login.do">로그인</a>
                  </li>
               </ul>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
</nav>
</header>
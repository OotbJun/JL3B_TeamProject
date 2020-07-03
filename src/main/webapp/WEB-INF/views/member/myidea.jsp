myidea.jsp -------------------------------------------------------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
</head>

<body>
<jsp:include page="../commons/include_navi.jsp"></jsp:include>

<div class="container" style="margin-top:5%">
   
   <h2 class="mt-4 mb-3">내가 쓴글 
   <small></small>
   </h2>
   <hr> 
   <ol class="breadcrumb">
      <li class="breadcrumb-item active">
         <a href="${path}/member/mywrite.do">자유게시판<span class="sr-only">(current)</span></a>
      </li>
      <li class="breadcrumb-item "><a href="${path}/member/myidea.do">청원게시판</a>
      </li>
      <li class="breadcrumb-item ">
         <a href="${path}/member/mywrite.do">댓글</a>
      </li>   
   </ol>
 <div class="container mt-5">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col">
						<table class="table table-hover text-center">
							<thead style="font-size: small">
								<tr>
									<td></td>
									<td class="text-left pl-1">제목</td>
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
									<td>청  원</td>
								</tr>
							</thead>
							<!-- 공지 상단 고정 -->
							<!-- 청원 리스트 -->	
							<tbody>
								<c:forEach items="${myIdeaList}" var="ideaList">
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
												href="${pageContext.request.contextPath}/board/idea_read.do?idea_no=${ideaList.ideaVo.idea_no}">
												${ideaList.ideaVo.idea_title}</a>
											</td>
										</c:if>
									<c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
										<c:if test="${!fn:contains(answer,'답변')}">
											<td class="text-left pl-2" style="overflow:hidden; text-overflow: ellipsis; max-width: 506px"><a
												href="${pageContext.request.contextPath}/board/idea_read.do?idea_no=${ideaList.ideaVo.idea_no}">
												${ideaList.ideaVo.idea_title}</a></td>
										</c:if>
										<td>${ideaList.memberVo.member_rname}${ideaList.adminVo.admin_name }</td>
										<td><fmt:formatDate value="${ideaList.ideaVo.idea_wdate}"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${ideaList.ideaVo.idea_hits}</td>
										<td>${ideaList.ideaLike}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="col-1"></div>
		</div>

	</div>
   </div>
      <jsp:include page="../commons/include_footer.jsp"></jsp:include>
</body>
</html>
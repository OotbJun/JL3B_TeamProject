<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

	<div class="row">
	<div class="col-1"></div>
	<div class="col">
	<table>
		<tr><td></td><td>제목</td><td>글쓴이</td><td>작성일</td><td>조회수</td></tr>
		<tbody>	
			
			<c:forEach items="${noticeList }" var="noticeList">
			<tr class="text-center">
				<td>${noticeList.noticeVo.notice_no }</td>
				<td><a href="${pageContext.request.contextPath }/board/read_notice.jan?notice_no=${noticeList.noticeVo.notice_no}">${noticeList.noticeVo.notice_title }</a></td>
				<td>${noticeList.resiVo.resi_rname }</td>
				
				 
				 <td><fmt:formatDate value="${noticeList.noticeVo.notice_wdate }" pattern="yy.MM.dd hh:mm:ss"/></td>
				 
				
				<td>${noticeList.noticeVo.notice_hits }</td>
				 
			
			</tr>
			</c:forEach>	 	
		</tbody>
	</table>
	</div>
	<div class="col-1"></div>
	</div>
	
	
	<ul class="pagination">
	  	<li class="page-item<c:if test="${beginPage-1 <= 0 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/board/notice.jan?currentPage=${beginPage-1}&search_word=${param.search_word}">Previous</a></li>
	  	<c:forEach begin="${beginPage }" end="${endPage }" var="i">
	  		<li class="page-item<c:if test="${currentPage == i }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/board/notice.jan?currentPage=${i}&search_word=${param.search_word}">${i }</a></li>
	  	</c:forEach>
	  	<li class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/board/notice.jan?currentPage=${endPage+1}&search_word=${param.search_word}">Next</a></li>
	</ul>
	
	<br><br>
	<div class="col-2">
	<a href="${pageContext.request.contextPath }/board/write_notice.jan" class="btn btn-primary btn-block">글쓰기</a>
	</div>
	
	 
	<form action="${pageContext.request.contextPath }/board/notice.jan">
	 
	<!-- 
	<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="title">제목</option>

					<option value="Content">본문</option>

					<option value="reg_id">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="title" id="title">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>
	 -->
	
	
	<div class="col-3">
	<input name="search_word" type="text" class="form-control">
	</div>
	
	<div class="col-1">
	<input type="submit" class="btn btn-primary btn-block" value="검색">
	</div>
	 
	</form>
	
	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
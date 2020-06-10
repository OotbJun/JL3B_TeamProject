
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Touche 자유게시판</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<div class="col text-center mt-3">
		<div class="row">
			<div class="col">
				<h1>게시판 대표이미지 출력</h1>
			</div>
		</div>
	</div>
	<div style="border-bottom: 1em, #6ac9ca;"></div>
	<!--게시판 출력-->
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
									<td>좋아요</td>
								</tr>
							</thead>
							
							<!-- 공지사항 리스트 -->
							<tbody>
								<c:forEach items="${boardNoticeList}" var="boardNoticeList"
									begin="0" end="2">
									<tr class="text-center">
										<td class="fix_horsehead" style="font-weight: bold">${boardNoticeList.noticeVo.horsehead_sort}</td>
										<td class="text-left pl-1"><a
											href="${pageContext.request.contextPath}/board/notice_read.jan?notice_no=${boardNoticeList.noticeVo.notice_no}">${boardNoticeList.noticeVo.notice_title}</a></td>
										<td>${boardNoticeList.resiVonotice.resi_rname}</td>
										<td><fmt:formatDate
												value="${boardNoticeList.noticeVo.notice_wdate}"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${boardNoticeList.noticeVo.notice_hits}</td>
										<td>${boardNoticeList.like}</td>
									</tr>
								</c:forEach>


								<!-- 인기글 리스트 -->
								<c:forEach items="${boardHotList}" var="boardHotList" begin="0"
									end="3">
									<tr class="text-center">
										<td style="font-weight: bold">${boardHotList.boardVo.horsehead_sort}</td>
										<td class="text-left pl-1"><a
											href="${pageContext.request.contextPath}/board/board_read.jan?board_no=${boardHotList.boardVo.board_no}">${boardHotList.boardVo.board_title}
												(${boardHotList.replyCount })</a></td>
										<td>${boardHotList.resiVoHot.resi_rname}</td>
										<td><fmt:formatDate
												value="${boardHotList.boardVo.board_wdate}"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${boardHotList.boardVo.board_hits}</td>
										<td>${boardHotList.like}</td>
									</tr>
								</c:forEach>
							</tbody>
							
							
							<!-- 자유게시판 리스트 -->
							<tbody>
								<c:forEach items="${boardList}" var="boardList">
									<tr class="text-center">
										<td>${boardList.boardVo.board_no}</td>
										<td class="text-left pl-1"><a
											href="${pageContext.request.contextPath}/board/board_read.jan?board_no=${boardList.boardVo.board_no}">${boardList.boardVo.board_title}
												(${boardList.replyCount })</a></td>
										<td>${boardList.resiVo.resi_rname}</td>
										<td><fmt:formatDate
												value="${boardList.boardVo.board_wdate}"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${boardList.boardVo.board_hits}</td>
										<td>${boardList.like}</td>
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
	<!-- 게시판 아래 메뉴들  -->
	<div class="container mt-3">
		<div class="row">
			<div class="col-1"></div>
			
			
			<!--검색-->
			<div class="col">
				<form action="./board.jan" method="get">
					<div class="row">
					
					<!-- 검색 조건 -->
					<select name="searchOption">
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="resi_rname">작성자</option>
						<option value="titleContent">제목+내용</option> 
					</select>
					
						<div class="col-3" style="padding-right: 0px">
							<input placeholder="검색어를 입력하세요" name="searchWord" type="text"
								class="form-control">
						</div>
						<!-- 게시글 검색어 입력-->
						<div class="col-2">
							<input type="submit" class="btn btn-primary btn-block" value="검색">
						</div>
					</div>
				</form>
			</div>
			
			
			<div></div>
			<!-- 글쓰기 버튼 -->
			<div class="col-2">
			<c:if test="${!empty sessionUser }">
				<a class="btn btn-primary btn-block"
					href="${pageContext.request.contextPath}/board/board_write.jan">글쓰기</a>
			</c:if>
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="row mt-3">
		<div class="col-2"></div>
		<!-- 페이지 이동 -->
		<div class="col">
			<div class="row">
				<div class="col-4"></div>
				<div class="col">
					<nav id="nav" aria-label="Page navigation example"
						style="text-align: center">
						<ul class="pagination">
							<li
								class="page-item<c:if test="${beginPage-1 <= 0 }"> disabled</c:if>"><a
								class="page-link"
								href="./board.jan?currPage=${beginPage-1}&searchWord=${param.searchWord}">이전</a></li>
							<c:forEach begin="${beginPage}" end="${endPage}" var="i">
								<li
									class="page-item<c:if test="${currPage == i}"> active</c:if>"><a
									class="page-link"
									href="./board.jan?currPage=${i}&searchWord=${param.searchWord}">${i}</a></li>
							</c:forEach>
							<li
								class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
								class="page-link"
								href="./board.jan?currPage=${endPage+1}&searchWord=${param.search_word}">다음</a></li>
						</ul>
					</nav>

				</div>
				<div class="col-2"></div>

			</div>
		</div>
		<div class="col-2"></div>
	</div>




	<jsp:include page="../commons/include_footer.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>


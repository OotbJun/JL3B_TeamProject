<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Touche 자유게시판</title>
<style type="text/css">
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

#wrap {
	min-height: 100%;
	position: relative;
}

#content {
	padding-bottom: 72px;
}

footer {
	margin-top: -72px;
	height: 72px;
	bottom: 0;
	left: 0;
	right: 0;
}

#nav li {
	display: inline;
}

#nav a {
	display: inline-block;
	padding: 10px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
		<div id="content">
		
			<div class="col" style="margin-top: 5%">
				<div class="row">
					<div class="col-1"></div>
					<div class="col text-center">
						<img
							src="${pageContext.request.contextPath }/resources/img/boardpage.png"
							style="max-width: 75%; height: auto;">
					</div>
					<div class="col-1"></div>
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
										<c:if test="${currPage == 1 }">
											<c:forEach items="${boardNoticeList}" var="boardNoticeList"
												begin="0" end="2">
												<tr class="text-center">
													<td class="fix_horsehead" style="font-weight: bold">${boardNoticeList.noticeVo.horsehead_sort}</td>
													<td class="text-left pl-1"
														style="overflow: hidden; text-overflow: ellipsis; max-width: 506px"><a
														href="${pageContext.request.contextPath}/board/notice_read.do?notice_no=${boardNoticeList.noticeVo.notice_no}">${boardNoticeList.noticeVo.notice_title}</a></td>
													<td>${boardNoticeList.memberVonotice.member_rname}${boardNoticeList.adminVo.admin_name }</td>
													<td><fmt:formatDate
															value="${boardNoticeList.noticeVo.notice_wdate}"
															pattern="yy.MM.dd hh:mm:ss" /></td>
													<td>${boardNoticeList.noticeVo.notice_hits}</td>
													<td>${boardNoticeList.like}</td>
												</tr>
											</c:forEach>
										</c:if>

										<!-- 인기글 리스트 -->
										<c:if test="${currPage == 1 }">
											<c:forEach items="${boardHotList}" var="boardHotList"
												begin="0" end="3">
												<tr class="text-center">
													<td style="font-weight: bold">${boardHotList.boardVo.horsehead_sort}</td>
													<td class="text-left pl-1"
														style="overflow: hidden; text-overflow: ellipsis; max-width: 506px"><a
														href="${pageContext.request.contextPath}/board/board_read.do?board_no=${boardHotList.boardVo.board_no}">${boardHotList.boardVo.board_title}
															<c:if test="${boardHotList.replyCount > 0 }">
															(${boardHotList.replyCount })</c:if></a></td>
													<td>${boardHotList.memberVoHot.member_rname}</td>
													<td><fmt:formatDate
															value="${boardHotList.boardVo.board_wdate}"
															pattern="yy.MM.dd hh:mm:ss" /></td>
													<td>${boardHotList.boardVo.board_hits}</td>
													<td>${boardHotList.like}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>



									<!-- 자유게시판 리스트 -->
									<tbody>
										<c:forEach items="${boardList}" var="boardList">
											<tr class="text-center">
												<td>${boardList.boardVo.board_no}</td>
												<td class="text-left pl-1"
													style="overflow: hidden; text-overflow: ellipsis; max-width: 506px"><a
													href="${pageContext.request.contextPath}/board/board_read.do?board_no=${boardList.boardVo.board_no}&currPage=${currPage }">${boardList.boardVo.board_title}
														<c:if test="${boardList.replyCount > 0 }">
												(${boardList.replyCount })</c:if>
												</a></td>
												<td>${boardList.memberVo.member_rname}</td>
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
						<form action="./board.do" method="get">
							<div class="row">

								<!-- 검색 조건 -->
								<!-- SELECT NAME 설정, 실질적으로 넘어가는 것(아마 옵션 값을 담아서 넘기는 듯) -->
								<select name="searchOption" class="ml-3">
								<!-- OPTION VALUE 설정 - 이거는 매퍼랑 일치시켜줘야 할 듯, IF문 빼도 될 거 같은데 -->
									<option value="board_title"
										<c:if test="${searchOption.equals('board_title') }">selected="selected"</c:if>>제목</option>
									<option value="board_content"
										<c:if test="${searchOption.equals('board_content') }">selected="selected"</c:if>>내용</option>
									<option value="member_rname"
										<c:if test="${searchOption.equals('member_rname') }">selected="selected"</c:if>>작성자</option>
									<option value="titleContent"
										<c:if test="${searchOption.equals('titleContent') }">selected="selected"</c:if>>제목+내용</option>
								</select>

								<div class="col-3" style="padding-right: 0px">
									<input placeholder="검색어를 입력하세요" name="searchWord" type="text"
										class="form-control form-control-sm" value="${searchWord }">
								</div>
								<!-- 게시글 검색어 입력-->
								<div class="col-2">
									<input type="submit" class="btn btn-outline-primary btn-sm"
										value="검색">
								</div>
							</div>
						</form>
					</div>


					<div></div>
					<!-- 글쓰기 버튼 -->
					<div class="col-2 text-right">
						<c:if test="${!empty sessionUser }">
							<a class="btn btn-outline-primary btn-sm"
								href="${pageContext.request.contextPath}/board/board_write.do">글쓰기</a>
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
										href="./board.do?currPage=${beginPage-1}&searchWord=${param.searchWord}">이전</a></li>
									<c:forEach begin="${beginPage}" end="${endPage}" var="i">
										<li
											class="page-item<c:if test="${currPage == i}"> active</c:if>"><a
											class="page-link"
											href="./board.do?currPage=${i}&searchWord=${param.searchWord}">${i}</a></li>
									</c:forEach>
									<li
										class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
										class="page-link"
										href="./board.do?currPage=${endPage+1}&searchWord=${param.search_word}">다음</a></li>
								</ul>
							</nav>

						</div>
						<div class="col-2"></div>

					</div>
				</div>
				<div class="col-2"></div>
			</div>



		</div>
		
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


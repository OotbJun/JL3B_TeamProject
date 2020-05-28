<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer {
	margin: 0 auto;
	text-align: center;
}

#xxx * {
	background-color: rgba(255, 255, 255, 0.0);
}

#xxx {
	background-color: rgba(255, 255, 255, 0.0);
}
</style>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>

	<div class="container mt-5">
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<div class="col">
					
					
					
						<table class="table table-hover">
							<thead>
							
								<tr>
									<td>글번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
									<td>추천</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="boardList">
								
									<tr class="text-center">
										<td>${boardList.boardVo.board_no}</td>
										<td><a
											href="${pageContext.request.contextPath}/board/read_board.jan?board_no=${boardList.boardVo.board_no}">${boardList.boardVo.board_title}</a></td>
										<td>${boardList.resiVo.resi_rname}</td>
										<td><fmt:formatDate
												value="${boardList.boardVo.board_wdate}"
												pattern="yy.MM.dd hh:mm:ss" /></td>
										<td>${boardList.boardVo.board_hits}</td>
										<td>${boardList.count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							
					</div>
				</div>
				
				<div class="row mt-3 ">
					<div class="col-2"></div>
					<div class="col">

						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li
									class="page-item<c:if test="${beginPage-1 <= 0 }"> disabled</c:if>"><a
									class="page-link"
									href="./board.jan?currPage=${beginPage-1}&searchWord=${param.searchWord}">이전</a></li>
								<c:forEach begin="${beginPage}" end="${endPage}" var="i">
									<li
										class="page-item<c:if test="${currPage == i}"> active</c:if>"><a
										class="page-link"
										href="./board.jan?currPage=${i}&searchWord=${param.searchWord}">${i}</a>
								</c:forEach>
								<li
									class="page-item<c:if test="${endPage+1 > (totalCount-1)/10+1}"> disabled</c:if>"><a
									class="page-link"
									href="./board.jan?currPage=${endPage+1}&searchWord=${param.search_word}">다음</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-2">
						<a class="btn btn-primary btn-block"
							href="${pageContext.request.contextPath}/board/write_board.jan">글쓰기</a>
					</div>
				</div>
				<div class="row">
					<div class="col"></div>
					<div class="col-7">
						<form action="./board.jan" method="get">
							<div class="row">
								<div class="col">
									<input name="searchWord" type="text" class="form-control">
									</div>
									<div class="col-3">
									<input type="submit" class="btn btn-primary btn-block"
										value="검색">
								</div>
							
							</div>
						</form>
					</div>
					<div class="col"></div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>


	<jsp:include page="../commons/include_footer.jsp"></jsp:include>
	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
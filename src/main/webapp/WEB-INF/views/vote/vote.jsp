<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: rgba(255, 255, 255, 0.0); . container { padding-right
	: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading -->
		<h1 class="my-4">
			싸발적 동대표 투표 <small>후보자</small>
		</h1>
		<form
			action="${pageContext.request.contextPath }/vote/vote_process.jan">
			<div class="row">
				<c:forEach var="candyList" items="${candyList }">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top"
								src="/upload/${candyList.candyImgList.candy_img_title}">
							<div class="card-body">
								<h4 class="card-title">
									<a
										href="${pageContext.request.contextPath }/vote/candy_read.jan?candy_no=">${candyList.resiVo.resi_rname }</a>
								</h4>
								<div class="card-text">${candyList.candyVo.candy_intro}</div>
								<input type="radio" value="${candyList.candyVo.candy_no}"
									name="candy_no">
								
							</div>
						</div>
					</div>
				</c:forEach>
				
			<c:if test="" ></c:if>	
				<input type="submit" value="투표">
			
			</div>
		</form>
	</div>

	<!-- /.container -->
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
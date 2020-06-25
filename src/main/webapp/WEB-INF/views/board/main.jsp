<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>송히 하트 수진</title>
<script src="${path}/resources/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/js/jquery.slim.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css_hn/member_main.css">
	
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css_hn/bootstrap.min.css">	

	</head>

		<body>
		
			<jsp:include page="../commons/include_navi.jsp"></jsp:include>
		
			<header>
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<!-- Slide One - Set the background image for this slide in the line below -->
						<div class="carousel-item active"
							style="background-image: url('http://www.lottecastle.co.kr/imgViewer.do?fpath=CM0007&fnm=2020052754390801590555218469.jpg')">
							<div class="carousel-caption d-none d-md-block">
								<h3 class="display-4">첫번째 사진</h3>
								<p class="lead">설명</p>
							</div>
						</div>
						<!-- Slide Two - Set the background image for this slide in the line below -->
						<div class="carousel-item"
							style="background-image: url('https://www.lottecastle.co.kr/imgViewer.do?fpath=AT00264/AM0004&fnm=2020052011482331589948187868.jpg')">
							<div class="carousel-caption d-none d-md-block">
								<h3 class="display-4">두번째 사진</h3>
								<p class="lead">설명</p>
							</div>
						</div>
						<!-- Slide Three - Set the background image for this slide in the line below -->
						<div class="carousel-item"
							style="background-image: url('http://www.lottecastle.co.kr/imgViewer.do?fpath=AT00270/AM0004&fnm=2020042996240751588141885874.jpg')">
							<div class="carousel-caption d-none d-md-block">
								<h3 class="display-4">세번째 사진</h3>
								<p class="lead">설명</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</header>
		
			<!-- Page Content -->
			<section class="py-5">
				<div class="container">
					<h1 class="font-weight-light">Touch Nubes 입주를 환영합니다</h1>
					<p class="lead">
						삶을 완성하는 품격,Touch Nubes 가치를 느껴보세요						
					</p>
					<br><br><br>
				</div>
			</section>
			
			<jsp:include page="../commons/include_footer.jsp"></jsp:include>
			
			
		</body>
		
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		

</html>

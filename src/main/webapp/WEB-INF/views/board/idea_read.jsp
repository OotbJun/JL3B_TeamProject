<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>청원 글읽기</title>
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

<script type="text/javascript">
	function refreshIdeaLike() {
		var ideaNo = ${readIdea.ideaVo.idea_no};
		var xmlhttp = new XMLHttpRequest();
		var ideaLikeBox = document.getElementById("idea_like_count");
		var boxSpan = document.createElement("span");

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var ideaLikeCount = xmlhttp.responseText;
				var length = ideaLikeBox.childNodes.length;

				boxSpan.innerText = ideaLikeCount;

				for (var i = 0; i < length; i++) {
					ideaLikeBox.removeChild(ideaLikeBox.childNodes[0]);
				}

				ideaLikeBox.appendChild(boxSpan);

			}
		};

		xmlhttp.open("get", "./get_idea_likecount.do?idea_no=" + ideaNo, true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send();

	};

	function ideaLike() {

		var ideaNo = ${readIdea.ideaVo.idea_no};
		var ideaLike = document.getElementById("idea_like").value;
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				refreshIdeaLike();
			}

		};

		xmlhttp.open("post", "./choose_idea_like_process.do", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("idea_no=" + ideaNo + "&idea_like=" + ideaLike);

		console.log("idea_no : " + ideaNo);
		console.log("value : " + ideaLike);

	};
</script>

</head>

<body onload="refreshIdeaLike()">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<div class="col mt-4">
		<div class="row">
			<div class="col-1"></div>
			<div class="col text-center" style="margin-top: 4%">
				<img
					src="${pageContext.request.contextPath }/resources/img/ideafix.png"
					style="max-width: 75%; height: auto;">
			</div>
			<div class="col-1"></div>
		</div>
	</div>


	<div class="container"
		style="margin-top: 60px; border-bottom: solid medium; border-bottom-color: #f4f4f4">
		<div class="row mt-1">
			<div class="col" style="font-size: medium; font-weight: bold;">${readIdea.ideaVo.idea_title}</div>
		</div>
		<div class="row mt-2 mb-1">
		
		<c:set var="answer" value="${ideaList.ideaVo.idea_title}"></c:set>
			<c:if test="${!fn:contains(answer,'답변')}">
			<div class="col-2 " style="font-size: small;">청원인 :
				${readIdea.memberVo.member_rname }</div>
			</c:if>
			
			<c:if test="${fn:contains(answer,'답변')}">
				<div class="col-2 " style="font-size: small;">
				${readIdea.adminVo.admin_name }</div>
			</c:if>	
				
			<div class="col"></div>
			<div class="col-2" style="font-size: small">
				작성일 :
				<fmt:formatDate value="${readIdea.ideaVo.idea_wdate}"
					pattern="yyyy.MM.dd"></fmt:formatDate>
			</div>
			<div class="col-1" style="font-size: small;">조회수
				${readIdea.ideaVo.idea_hits }</div>
			<div class="col-1" style="font-size: small;">좋아요
				${readIdea.upCount}</div>
		</div>
	</div>

	<!-- 게시글 내용 및 이미지 -->
	<div class="container" style="margin-top: 20px;">

		<c:forEach items="${readIdea.ideaImgList}" var="IdeaImgVo">
			<img style="width: 60%; height: auto"
				src="/upload/${IdeaImgVo.idea_img_title}">
			<br>
		</c:forEach>
		<div class="row mt-1">
			<div class="col text-wrap" style="word-break: break-all;">${readIdea.ideaVo.idea_content }</div>
		</div>
	</div>




	<div class="container"
		style="margin-top: 20px; border-bottom: solid threedshadow; border-bottom-color: #f4f4f4"">
		<div class="row mb-1">
			<div class="col-3"></div>
			<!-- 추천 -->
			<div class="col-6 text-center ">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4" style="padding: 0%">
						<span style="color: red" id="idea_like_count"></span>
						<button type="button" onclick="ideaLike()" class="btn btn-group"
							id="idea_like"
							style="max-width: 100%; width: 50px; height: 30px;" value="Y">
							<img class="btn-img"
								src="${pageContext.request.contextPath }/resources/img/heart.ico"
								style="max-width: 100%">
						</button>
					</div>
					<div class="col-4"></div>
				</div>
			</div>
			<!-- 글 관리 버튼 -->
			<div class="col-3" style="padding: 6px auto;">
				<div class="row mt-3 mr-1">
					<div class="col"></div>
					<div class="col-2" style="margin-right: 4px">

						<!-- 관리자만 삭제 가능 -->
						<c:set var="admin" value="${sessionUser.npki_key}"></c:set>
						<c:if test="${fn:contains(admin,'admin')}">
							<form
								action="${pageContext.request.contextPath }/board/idea_change.do"
								method="post">
								<input type="hidden" name="idea_no"
									value="${readIdea.ideaVo.idea_no}"> <input
									type="hidden" name="member_no"
									value="${readIdea.ideaVo.member_no}"> <input
									type="hidden" name="currPage" value="${currPage }"> <input
									class="btn btn-outline-info btn-sm" type="submit" value="수정">
							</form>
						</c:if>
					</div>
					<div class="col-2">
						<c:set var="admin" value="${sessionUser.npki_key}"></c:set>
						<c:if test="${fn:contains(admin,'admin')}">
							<form
								action="${pageContext.request.contextPath }/board/idea_delete_process.do"
								method="post">
								<input type="hidden" name="idea_no"
									value="${readIdea.ideaVo.idea_no}"> <input
									type="hidden" name="member_no"
									value="${readIdea.ideaVo.member_no}"> <input
									class="btn btn-outline-danger btn-sm" type="submit" value="삭제">

							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시글 아래 메뉴 -->
	<div class="container mt-2">
		<div class="row">
		<div class="col-1 text-left" style="padding: 0px">
						<a
							href="${pageContext.request.contextPath}/board/idea.do?&currPage=${currPage }"
							class="btn btn-light btn-sm">목록</a>
					</div>
			<div class="col"></div>
			<div class="col-2 text-right" style="padding-right: 0px">
						<c:set value="${readIdea.ideaVo.idea_title}" var="title"></c:set>
						<c:if test="${sessionUser.member_grade >= 2 && !fn:contains(title, '답변') }">
							<a
								href="${pageContext.request.contextPath}/board/idea_answer.do?idea_no=${readIdea.ideaVo.idea_no}"
								class="btn btn-light btn-sm">답글달기</a>

						</c:if>
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
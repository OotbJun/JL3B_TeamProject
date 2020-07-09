<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>공지 글 수정</title>
<style>
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

<script type="text/javascript">
	var titlefill = false;
	var contentfill = false;

	function submitActive() {
		if (titlefill == false || contentfill == false) {
			document.getElementById("able").setAttribute("disabled", "true");
		} else {
			document.getElementById("able").removeAttribute("disabled");
		}
	}

	function minlength1() {
		var title = document.getElementById("title").value;
		if (title.length >= 3) {
			titlefill = true;
			submitActive();
		} else {
			titlefill = false;
			submitActive();
		}

	}

	function minlength2() {
		var content = document.getElementById("notice_content").value;
		if (content.length >= 3) {
			contentfill = true;
			submitActive();
		} else {
			contentfill = false;
			submitActive();
		}

	}

	function submit_btn() {

		if (confirm("게시물을 등록하시겠습니까?") == true) {
			document.getElementById("submit").submit();

		}
	}
</script>

</head>
<body style="overflow-x: hidden;">
	<div id="wrap">
		<jsp:include page="../commons/include_navi.jsp"></jsp:include>

		<div id="content">
			<div class="col mt-4">
				<div class="row">
					<div class="col-1"></div>
					<div class="col text-center">
					
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<div class="container" role="main" style="margin-top: 5%;">
				<h2 class="text-center">공지 사항 수정</h2>
				<form
					action="${pageContext.request.contextPath }/board/notice_change_process.do"
					method="post" enctype="multipart/form-data" id="submit">
					<div class="mb-3">
						<label for="title">제목</label> <input type="text"
							class="form-control" name="notice_title"
							value="${readNotice.noticeVo.notice_title }" maxlength="50"
							id="title" onkeyup="minlength1()">
					</div>
					<div class="mb-3">
						<label for="notice_content">글내용</label>
						<textarea class="form-control" rows="10" cols="40"
							name="notice_content" maxlength="4000" id="notice_content"
							onkeyup="minlength2()">${readNotice.noticeVo.notice_content }</textarea>
						<input type="hidden" name="currentPage" value="${currentPage }">
					</div>

					<div class="row">
						<div class="col-8"></div>
						<div class="col">
							<a
								href="${pageContext.request.contextPath }/board/notice.do?currentPage=${currentPage }"
								class="btn btn-secondary btn-md btn-block">목록</a>
						</div>
						<div class="col">
							<input type="button" value="수정완료"
								class="btn btn-primary btn-md btn-block" id="able"
								disabled="disabled" onclick="submit_btn()"> <input
								type="hidden" name="notice_no"
								value="${readNotice.noticeVo.notice_no}">
						</div>
					</div>

				</form>
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
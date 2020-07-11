<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>청원 답글</title>
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
		var content = document.getElementById("idea_content").value;
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
<body style ="overflow-x:hidden;">
<div id="wrap">
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	<div id="content">
		<div class="container text-center" role="main" style="margin-top: 5%;">
			<h2 class="mb-5">청원 답변</h2>
			<form class="text-left" id="submit"
				action="${pageContext.request.contextPath }/board/idea_answer_process.do"
				method="post">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="idea_title" id="title"
						value="답변 : ${readIdea.ideaVo.idea_title }" maxlength="50"
						onkeyup="minlength1()">
				</div>
				<div class="mb-3"></div>
				<div class="mb-3"></div>
				<div class="mb-3">
					<label for="content">글내용</label>
					<textarea class="form-control" rows="10" name="idea_content"
						id="idea_content" placeholder="답변을 입력해주세요(최소 3글자)"
						maxlength="4000" onkeyup="minlength2()"></textarea>
				</div>
				<div>
					<div class="row mb-3">

						<div class="col-8"></div>
						<div class="col-2">
							<a href="${pageContext.request.contextPath }/board/idea.do"
								class="btn btn-secondary btn-md btn-block">목록으로</a>
						</div>
						<div class="col-2">
							<input type="button" value="확인"
								class="btn btn-primary btn-md btn-block" disabled="disabled"
								id="able" onclick="submit_btn()"> <input type="hidden"
								name="idea_gr_no" value="${readIdea.ideaVo.idea_gr_no}">
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../commons/include_footer.jsp"></jsp:include> <script
	src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script> <script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script> <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width initial-scale=1">
<title>Insert title here</title>
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
	   if(   titlefill == false || contentfill == false) {
	   document.getElementById("able").setAttribute("disabled","true");
	   } else {
	   document.getElementById("able").removeAttribute("disabled");
	   }
	}
	
	function minlength1() {
	   var title = document.getElementById("title").value;
	   if(title.length >= 3 ){
	      titlefill = true;
	      submitActive();
	   }else{
	      titlefill = false;
	      submitActive();
	   }
	   
	}
	
	function minlength2() {
	   var content = document.getElementById("content").value;
	   if(content.length >= 3 ){
	      contentfill = true;
	      submitActive();
	   }else{
	      contentfill = false;
	      submitActive();
	   }
	   
	}
	
	function submit_btn(){
	    
	    if(confirm("게시물을 등록하시겠습니까?")== true){
	       document.getElementById("submit").submit();
	       
	    }
	 }
	
	/////이미지
	function check(){
   
	   var fileCheck = document.getElementById("file").value;
	   
	   if(!fileCheck){
		   alert("이미지는 반드시 첨부하셔야 합니다.");
		   return false;
	   }else{
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
			<div class="col"></div>
			<div class="col">
				<img
					src="${pageContext.request.contextPath }/resources/img/candyfix.png">
			</div>
			<div class="col"></div>
		</div>
	</div>
	<div class="container" role="main" style="margin-top: 5%;">
		<h2 class="text-center" style="color: #28364a">후보등록하기</h2>
		<form
			action="${pageContext.request.contextPath }/vote/candy_write_process.do"
			method="post" enctype="multipart/form-data" id="submit">

			<div class="mb-3">후 보 자 : ${sessionUser.member_rname }</div>
			<div class="mb-3">
				<label for="title">소개</label> <input type="text"
					class="form-control"  name="candy_intro" id="title"
					placeholder="후보자 약력을 작성해주세요" maxlength="300" onkeyup="minlength1()">
			</div>
			<div class="mb-3"></div>
			<div class="mb-3"></div>
			<div class="mb-3">
				<label for="content">공약사항</label>
				<textarea class="form-control" rows="10" cols="40" name="candy_content"
					id="content" placeholder="공약을 입력해주세요" maxlength="1000" onkeyup="minlength2()"></textarea>
			</div>

			<div class="mb-3">
				<div class="row mb-5">
					<div class="col">
						<label for="tag">파일첨부</label> <input type="file" name="candyFile" id="file"
							accept="image/*"><br>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-8"></div>
					<div class="col-2">
						<a href="${pageContext.request.contextPath }/vote/vote_choice.do"
							class="btn btn-secondary btn-sm btn-block">돌아가기</a>
					</div>
					<div class="col-2">
						<input type="button" value="확인" id="able" disabled="disabled"
							class="btn btn-primary btn-sm btn-block" onclick="check();">
					</div>
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

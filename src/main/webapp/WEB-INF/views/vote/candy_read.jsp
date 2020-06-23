<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<jsp:include page="../commons/include_navi.jsp"></jsp:include>
<body>
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

<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"><h1></h1></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
      <div class="text-center">
      <!-- 후보자 사진 -->
      	
		<img style="width: 60%; height: auto" src="/upload/${readCandy.candyImgList.candy_img_title}">
		<br>
		
        
        <!-- <h6>후보자 이름 </h6> -->
      </div><br>
        </div><!--/col-3-->
    	<div class="col-sm-9">
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="form-group">
                          <div class="col-xs-9">
                              <label for="first_name"><h4>후보자 이름</h4></label>
                              <div>${readCandy.memberVo.member_rname }</div>
                          </div>
                      </div><br>          
                      <div class="form-group">
                          <div class="col-xs-9">
                              <label for="email"><h4>후보자 소개</h4></label>
                              <div>${readCandy.candyVo.candy_intro }</div>
                          </div>
                      </div><br>
                      <div class="form-group">
                          <div class="col-xs-9">
                            <label for="password2"><h4>후보자 공약</h4></label>
                              <div>${readCandy.candyVo.candy_content }</div>
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<a class="btn btn-lg btn-success" type="submit" href="${pageContext.request.contextPath }/vote/candy.jan?election_round=${round}">목록으로</a>
                           </div>
                           <div class="col-xs-12">
                           	<c:if
								test="${!empty sessionUser && sessionUser.member_no == readCandy.memberVo.member_no}">
								<a class="btn btn-lg btn-success"
									href="${pageContext.request.contextPath}/vote/candy_change.jan?candy_no=${readCandy.candyVo.candy_no}">수정</a>
							</c:if>
                           </div>
                      </div>
              	</form>
             </div><!--/tab-pane-->
              </div>
              </div><!--/tab-pane-->
        </div><!--/col-9-->
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
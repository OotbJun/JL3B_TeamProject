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

<!-- Required meta tags -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Touche 센터 상세페이지</title>

<!-- CSS -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
   integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/assets/css/animate.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/assets/css/media-queries.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/assets/css/carousel.css">

<style type="text/css">
.collapsible-link::before {
   content: '';
   width: 14px;
   height: 2px;
   background: #333;
   position: absolute;
   top: calc(50% - 1px);
   right: 1rem;
   display: block;
   transition: all 0.3s;
}

/* Vertical line */
.collapsible-link::after {
   content: '';
   width: 2px;
   height: 14px;
   background: #333;
   position: absolute;
   top: calc(50% - 7px);
   right: calc(1rem + 6px);
   display: block;
   transition: all 0.3s;
}

.collapsible-link[aria-expanded='true']::after {
   transform: rotate(90deg) translateX(-1px);
}

.collapsible-link[aria-expanded='true']::before {
   transform: rotate(180deg);
}
</style>

<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<script type="text/javascript">


var isConfirm = false;

	function reserveConfirm(lessonNo, lesson_people){
		if(isConfirm == false){
			if(confirm("예약 하시겠습니까?") == true){
				alert("예약 되었습니다."); 
				reserve(lessonNo, lesson_people);
				isConfirm = true;
			}	
		}else{
			if(confirm("예약을 취소하시겠습니까?") == true){
				alert("취소 되었습니다."); 
				reserve(lessonNo, lesson_people);
				isConfirm = false;
			}
		}
		
	}
	
	function reserve(lessonNo, lesson_people) {

		
		//var lessonNo = document.getElementById("lessonNo");
		//var lesson_people = document.getElementsByClassName("people").value;
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				refreshreserve(lessonNo, lesson_people);
			}
		};

		xmlhttp.open("post", "./reserve_process.do", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("lesson_no=" + lessonNo + "&lesson_people=" + lesson_people);

	};


	function refreshreserve(lessonNo, lesson_people) {

		//var lessonNo = 11;
		
		var limit = lesson_people;
		var xmlhttp = new XMLHttpRequest();
		var row = document.createElement("div");
		var lessonPeople = document.getElementsByClassName("people");
		
		
		var index = lessonNo -1;
		
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var people = xmlhttp.responseText + "/" + limit;
				
				console.log(people);
				console.log(lessonNo);

				var length = lessonPeople[index].childNodes.length;
				
				console.log(length);

				row.innerText = people;

				for (var i = 0; i < length; i++) {
					lessonPeople[index].removeChild(lessonPeople[index].childNodes[0]);
				}

				lessonPeople[index].appendChild(row);
			}

		};

		xmlhttp.open("get", "./get_people.do?lesson_no=" + lessonNo, true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send();
	};
</script>

</head>

<body>
   <jsp:include page="../commons/include_navi.jsp"></jsp:include>

   <!-- Top content -->
   <div class="top-content">
      <div class="container-fluid">
         <div id="carousel-example" class="carousel slide"
            data-ride="carousel">
            <!--  여기 자리에 이미지 포이치 문 들어가면 됩니다. -->
            <div class="carousel-inner row w-100 mx-auto" role="listbox"
               style="height: 300px">

               <div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 active">
                  <img src="/upload/${readCenter.centerImgVo.center_img_title }"
                     class="img-fluid mx-auto d-block"
                     style="max-height: 256px; width: auto;">
               </div>

               <c:forEach items="${readCenter.centerImgList}" var="centerImgVo"
                  begin="1">
                  <div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
                     <img src="/upload/${centerImgVo.center_img_title}"
                        class="img-fluid mx-auto d-block"
                        style="max-height: 256px; max-width: 300;">
                  </div>
               </c:forEach>

            </div>

         </div>

         <a class="carousel-control-prev" href="#carousel-example"
            role="button" data-slide="prev"
            style="height: 30%; width: 90px; margin-top: 7%;"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carousel-example"
            role="button" data-slide="next"
            style="height: 30%; width: 90px; margin-top: 7%;"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
      <div class="container">
         <div class="row mt-3">
            <div class="col"></div>
            <div class="col-2">
               <c:if
                  test="${!empty sessionCenter && sessionCenter.center_no == readCenter.centerVo.center_no }">
                  <a href="${pageContext.request.contextPath }/center/center_img.do"><button
                        type="button" class="btn btn-primary btn-sm btn-block">대표이미지
                        올리기</button></a>
               </c:if>
            </div>
         </div>
      </div>
   </div>

   <!-- Section 1 -->
   <div class="section-1-container section-container text-center">
      <div class="container">
         <div class="row">
            <div class="col section-1 section-description wow fadeIn">
               <h1>${readCenter.centerVo.center_name }에오신걸 환영합니다!</h1>
               <div class="divider-1 wow fadeInUp">
                  <span></span>
               </div>
               <p>${readCenter.centerVo.center_about }</p>
            </div>
         </div>
      </div>
   </div>

   <!-- Section 2 -->
   <div
      class="section-2-container section-container section-container-gray-bg text-center">
      <div class="container">
         <div class="row">
            <div class="container">
               <div class="row py-5">
                  <div
                     class="col section-2 section-description wow fadeIn text-center">
                     <h1>${readCenter.centerVo.center_name }클래스 예약</h1>
                     <div class="divider-1 wow fadeInUp">
                        <span></span>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-lg-9 mx-auto">
                     <div id="accordionExample" class="accordion shadow">

                        <!-- Accordion item 1 -->
                        <div class="card">
                           <div id="headingOne"
                              class="card-header bg-white shadow-sm border-0">
                              <h6 class="mb-0 font-weight-bold">
                                 <a href="#" data-toggle="collapse" data-target="#collapseOne"
                                    aria-expanded="true" aria-controls="collapseOne"
                                    class="d-block position-relative text-dark text-uppercase collapsible-link py-2">클래스
                                    정보 </a>
                              </h6>
                           </div>
                           <div id="collapseOne" aria-labelledby="headingOne"
                              data-parent="#accordionExample" class="collapse show">
                              <div class="card-body p-5">
                                 <p class="font-weight-light m-0">${readCenter.centerVo.center_about }</p>
                              </div>
                           </div>
                        </div>
                        <!-- Accordion item 2 -->
                        <div class="card">
                           <div id="headingTwo"
                              class="card-header bg-white shadow-sm border-0">
                              <h6 class="mb-0 font-weight-bold">
                                 <a href="#" data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="false" aria-controls="collapseTwo"
                                    class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">클래스
                                    예약 </a>
                              </h6>
                           </div>
                           <div id="collapseTwo" aria-labelledby="headingTwo"
                              data-parent="#accordionExample" class="collapse">
                              <div class="card-body p-5">
                                 <div class="container">
                                    <div class="row"><div class="table-responsive table-bordered movie-table">
														<table class="table movie-table">
															<thead>
																<tr class="movie-table-head">
																	<th>모집인원</th>
																	<th>클래스</th>
																	<th>날짜</th>
																	<th>시간</th>
																	<th>현황</th>
																</tr>
															</thead>
															<tbody>
																<!--row-->
																<c:forEach items="${lessonList }" var="aaa">
																	<tr>
																		
																		<td class="people">${aaa.people }/${aaa.lessonVo.lesson_people }</td>
																		<td>${aaa.lessonInfoVo.info_title }</td>
																		<td><fmt:formatDate
																				value="${aaa.lessonVo.lesson_date }"
																				pattern="yy.MM.dd" /></td>
																		<td>${aaa.lessonVo.lesson_time }시</td>
																		<c:set var="reserve" value="${aaa.lessonVo.lesson_horsehead }"></c:set>
																		<c:if test="${!fn:contains(reserve,'마감') }">
																		<td><button type="button" onclick="reserveConfirm(${aaa.lessonVo.lesson_no}, ${aaa.lessonVo.lesson_people })" class="btn btn-group">${aaa.lessonVo.lesson_horsehead }</button></td></c:if>
																		<c:if test="${fn:contains(reserve,'마감') }">
																		<td>${aaa.lessonVo.lesson_horsehead }</td>																	</c:if>
																	</tr>
																</c:forEach>
														

															</tbody>
														</table>
													</div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card">
                           <div class="card-header bg-white shadow-sm border-0"
                              id="headingThree">
                              <h6 class="mb-0 font-weight-bold">
                                 <a href="#" data-toggle="collapse"
                                    data-target="#collapseThree" aria-expanded="false"
                                    aria-controls="collapseTwo"
                                    class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">클래스
                                    후기 </a>
                              </h6>
                           </div>
                           <div id="collapseThree" class="collapse"
                              aria-labelledby="headingThree" data-parent="#accordionExample">
                              <div class="card-body">
                               <div class="card card-outline-secondary my-4">
                                     <div class="card-body">
                                       <c:forEach items="${readReview }" var="readReview">
                                       <div class="row">
                                       <div class="col-2"> <small class="text-muted">${readReview.memberVo.member_rname} </small></div>
                                       <div class="col-8 text-left" style="font-size: small;"><p>${readReview.centerReviewVo.review_comment }</p></div>
                                       <div class="col-2"><small><fmt:formatDate value="${readReview.centerReviewVo.review_wdate}" pattern="yyyy.MM.dd"></fmt:formatDate></small></div>
                                       </div>
                                       <hr>
                                       </c:forEach>
                                     </div>
                                   </div>   
                              </div>
                           </div>
                        </div>
                     </div>
                     
                  </div>
               </div>
            </div>
            
         </div>
         <a href="${pageContext.request.contextPath }/center/center_write.do"><button
                        type="button" class="btn btn-outline-primary btn-sm">글쓰기</button></a>
      </div>
   </div>
  </div> 
   <!-- Footer -->
   <footer class="footer-container" style="background-color: #000000; color:#ffffff;">

      <div class="container">
         <div class="row">

            <div class="col text-center"  >
               &copy; Touch Nubes <a
                  href="${pageContext.request.contextPath }/center/center.do">Touch
                  Nubes</a>.
            </div>

         </div>
      </div>

   </footer>
   <!-- Javascript -->
   <script
      src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.3.1.min.js"></script>
   <script
      src="${pageContext.request.contextPath }/resources/assets/js/jquery-migrate-3.0.0.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
      integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
      integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
      crossorigin="anonymous"></script>
   <script
      src="${pageContext.request.contextPath }/resources/assets/js/jquery.backstretch.min.js"></script>
   <script
      src="${pageContext.request.contextPath }/resources/assets/js/wow.min.js"></script>
   <script
      src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>

</html>
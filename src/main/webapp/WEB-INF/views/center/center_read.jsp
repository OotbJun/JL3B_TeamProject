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

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
   crossorigin="anonymous">
   
</script>


<title>Touche 센터 상세페이지</title>

<!-- CSS -->


<style type="text/css">

li {
   list-style: none;
}

.clearfix {
   overflow: auto;
}

.clearfix::after {
   content: "";
   clear: both;
   display: table;
}

.clear {
   clear: both;
}

.gallery {
   width: 1800px;
   margin: 100px auto;
   border: 1px solid #ccc;
   overflow: hidden;
   padding-left: 0;
   border: 1px solid #ccc;
}

.gallery ul {
   width: 300%;
   position: relative;
   left: -300px;
}

.gallery ul li {
   float: left;
   width: 450px;
   height: 270px;
   box-sizing: border-box;
   padding: 15px;
   text-align: center;
   line-height: 150px;
}

.gallery ul li .img {
   border: 3px solid #ccc;
}

</style>

<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
   
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>  

<script type="text/javascript">


//예약 확인
	function reserveConfirm(lessonNo, lesson_people, i){
	
		if(confirm("예약 하시겠습니까?") == true){
			alert("예약 되었습니다."); 
			reserve(lessonNo, lesson_people, i);
			//isConfirm = true;
		}	
	}

//예약 ajax
	function reserve(lessonNo, lesson_people, i) {

		
		//var lessonNo = document.getElementById("lessonNo");
		//var lesson_people = document.getElementsByClassName("people").value;
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				
				refreshHorsehead(lessonNo, lesson_people, i);
				refreshreserve(lessonNo, lesson_people, i);
			}
		};

		xmlhttp.open("post", "./reserve_process.do", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("lesson_no=" + lessonNo + "&lesson_people=" + lesson_people);

	};

//신청인원 출력 ajax
   function refreshreserve(lessonNo, lesson_people, i) {

      //var lessonNo = 11;
      
      var limit = lesson_people;
      var xmlhttp = new XMLHttpRequest();
      var lessonPeople = document.getElementsByClassName("people");
     
      xmlhttp.onreadystatechange = function() {

         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

            var people = xmlhttp.responseText + "/" + limit;

            lessonPeople[i].innerText = people;
            
         }

      };

      xmlhttp.open("get", "./get_people.do?lesson_no=" + lessonNo, true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send();
   };
//말머리 변경 ajax	
function refreshHorsehead(lessonNo, lesson_people, i){
	
      var xmlhttp = new XMLHttpRequest();
      var row = document.createElement("td");
      var horseHead = document.getElementsByClassName("horse");
      
      xmlhttp.onreadystatechange = function(){
         
         if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            
            var hhhorsehead = JSON.parse(xmlhttp.responseText);
            
            console.log(hhhorsehead.data);
            
            
            
            horseHead[i].innerText ="";
            horseHead[i].innerText = hhhorsehead.data;
            
         }
      };
      xmlhttp.open("post", "./update_horsehead.do", true);
      xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
      xmlhttp.send("lesson_no=" + lessonNo + "&lesson_people=" + lesson_people);

   };
	
	
	function galleryFun() {
	      
	      picBox = $('#picBox');
	      moveLi = $('#picBox > li').eq(0);
	      picBox.append(moveLi);
	      
	      $('#picBox').css("left" , "0px");
	   
	   }

	   function slideImg() {
	      setInterval(galleryFun, 3000);
	   };
	
</script>

</head>

<body style="overflow-x: hidden;" onload="slideImg()">
   <div id="wrap">
      <jsp:include page="../commons/include_navi.jsp"></jsp:include>

      <div id="content">

         <!-- 이미지 슬라이드 -->
         <div class="gallery">
            <ul class="clearfix text-center" id="picBox">
               <c:forEach items="${readCenter.centerImgList}" var="centerImgVo">
                  <li id="picpic"><img
                     src="/upload/${centerImgVo.center_img_title}"
                     class="img-fluid mx-auto d-block"></li>
               </c:forEach>
            </ul>
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
                           <table class="table movie-table">
															<thead>
																<tr class="movie-table-head">
																	<th>강의 제목</th>
																	<th>강의 내용</th>
																</tr>
															</thead>
															<tbody>
																<!--row-->
																<c:forEach items="${infoList }" var="aaa">
																	<tr>
																		<td>${aaa.info_title }</td>
																		<td>${aaa.info_content }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
                           
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
																<c:forEach items="${lessonList }" var="aaa" varStatus="status">
																	<tr>
																		
																		<td class="people">${aaa.people }/${aaa.lessonVo.lesson_people }</td>
																		<td>${aaa.lessonInfoVo.info_title }</td>
																		<td><fmt:formatDate
																				value="${aaa.lessonVo.lesson_date }"
																				pattern="yy.MM.dd" /></td>
																		<td>${aaa.lessonVo.lesson_time }시</td>
																		<td class="horse" onclick="reserveConfirm(${aaa.lessonVo.lesson_no}, ${aaa.lessonVo.lesson_people }, ${status.index })">${aaa.lessonVo.lesson_horsehead}</td>
																																	
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
</div>

   <!-- Javascript -->
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
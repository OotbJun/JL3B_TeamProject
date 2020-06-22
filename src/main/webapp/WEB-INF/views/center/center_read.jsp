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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>Touche 센터 상세페이지</title>

        <!-- CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,600">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/media-queries.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/carousel.css">
              
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
    </head>

    <body>
	<jsp:include page="../commons/include_navi.jsp"></jsp:include>
	
        <!-- Top content -->
        <div class="top-content">
        <div class="container">
        <div class="row mb-5 text-right">
            <a href="${pageContext.request.contextPath }/center/center_img.jan"><button type="button" class="btn btn-primary btn-lg btn-block">대표이미지 올리기</button></a> 
               </div>
               </div>
        	<div class="container-fluid">
        		<div id="carousel-example" class="carousel slide" data-ride="carousel">
        			<!--  여기 자리에 이미지 포이치 문 들어가면 됩니다. -->
        			<div class="carousel-inner row w-100 mx-auto" role="listbox">
        			<!-- 
            			<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 active">
							<img src="${pageContext.request.contextPath }/resources/assets/img/backgrounds/1.jpg" class="img-fluid mx-auto d-block" alt="img1">
						</div>
						
						-->
						<div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3 active">
								<img src="/upload/${readCenter.centerImgVo.center_img_title }" class="img-fluid mx-auto d-block">
						</div>
						<c:forEach items="${readCenter.centerImgList}" var="centerImgVo">
						 <div class="carousel-item col-12 col-sm-6 col-md-4 col-lg-3">
					         <img src="/upload/${centerImgVo.center_img_title}" class="img-fluid mx-auto d-block">
					         <br>
					         </div>
					    </c:forEach>
						</div>

        			</div>
        			<a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
        		</div>
        	</div>
        </div>

        <!-- Section 1 -->
        <div class="section-1-container section-container">
	        <div class="container">
	            <div class="row">
	                <div class="col section-1 section-description wow fadeIn">
	                    <h1>${readCenter.centerVo.center_name }에 오신걸 환영합니다!</h1>
	                    <div class="divider-1 wow fadeInUp"><span></span></div>
	                    <p>
	                    	${readCenter.centerVo.center_pr }
	                    </p>
	                </div>
	            </div>
	        </div>
        </div>

        <!-- Section 2 -->
        <div class="section-2-container section-container section-container-gray-bg">
	        <div class="container">
	            <div class="row">
	                <div class="col section-2 section-description wow fadeIn">
	                </div>
	            </div>
	            <div class="row">
	            	<div class="container">
  <!-- For demo purpose -->
  <div class="row py-5">
      <div class="col section-2 section-description wow fadeIn">
        <h1>요가 클래스 예약 </h1>
     <div class="divider-1 wow fadeInUp"><span></span></div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-9 mx-auto">
      <div id="accordionExample" class="accordion shadow">

        <!-- Accordion item 1 -->
        <div class="card">
          <div id="headingOne" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="d-block position-relative text-dark text-uppercase collapsible-link py-2">클래스 정보 </a></h6>
          </div>
          <div id="collapseOne" aria-labelledby="headingOne" data-parent="#accordionExample" class="collapse show">
            <div class="card-body p-5">
              <p class="font-weight-light m-0">${readCenter.centerVo.center_about }</p>
            </div>
          </div>
        </div>
        <!-- Accordion item 2 -->
        <div class="card">
          <div id="headingTwo" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">클래스 예약 </a></h6>
          </div>
          <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample" class="collapse">
            <div class="card-body p-5">
           <div class="container">
	<div class="row">
		<div class="table-responsive table-bordered movie-table">
            <table class="table movie-table">
                  <thead>
                  <tr class= "movie-table-head">
                      <th>모집현황</th>
                      <th>클래스내용</th>
                      <th>시간대</th>   
                      <th>남은자리</th>
                  </tr>
              </thead>   
              <tbody>        
                <!--row-->
                <tr class= "dark-row">
                    <td >Toy Story</td>
                    <td> <span style="color:green;">5</span> /5 </td>
                    <td>40</td>
                    <td>Both</td>                                       
                </tr>
                <!--/.row-->

                <!--row-->
                <tr class="light-row">
                    <td>The Shining</td>
                    <td> <span style="color:green;">5</span> /5 </td>
                    <td>37</td>
                    <td>Both</td>                                       
                </tr>
                <!--/.row-->
                
                <!--row-->
                <tr class = "dark-row">
                    <td>Rubber</td>
                    <td> <span style="color:red;">1</span> /5 </td>
                    <td>20</td>
                    <td>Rental</td>                                       
                </tr>
                <!--/.row-->
                
                <!--row-->
                <tr class="light-row">
                    <td>The Hangover</td>
                    <td> <span style="color:orange;">3</span> /5 </td>
                    <td>33</td>
                    <td>Sale</td>                                       
                </tr>
                <!--/.row-->
              </tbody>
            </table>
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
 </div>
 </div>
 </div>
		<!-- Section 3 -->
        <div class="section-3-container section-container">
	        <div class="container">
	        	
	            <div class="row">
	                <div class="col section-3 section-description wow fadeIn">
	                    <h2>클래스 후기</h2>
	                    <div class="divider-1 wow fadeInUp"><span></span></div>
	                </div>
	            </div>
	            <div class="row">
	            <!-- c:foreach -->
	            <c:forEach items="${readReview }" var="readReview">
	                <div class="col-md-6 section-3-box wow fadeInLeft">
	                	<div class="row">
	                		<div class="col-md-3">
	                			<div class="section-3-box-icon">
	                				<i class="fas fa-paperclip"></i>
	                			</div>
	                		</div>
	                		<div class="col-md-9">
	                			<h3>${readReview.centerReviewVo.review_comment }</h3>
		                    	<p>
		                    		${readReview.centerReviewVo.resi_no}
		                    	</p>
	                		</div>
	                	</div>
	                </div>
	             </c:forEach>
	                 <!-- c:foreach -->
	                 
	           
	        </div>
	         <div class="row">
	                     <a href="${pageContext.request.contextPath }/center/review_write.jan?center_no=${readCenter.centerVo.center_no }"><button type="button" class="btn btn-primary btn-lg btn-block">리뷰작성하러가기</button></a> 
	                     </div>
        </div>
        </div>
        <!-- Footer -->
        <footer class="footer-container">
        
	        <div class="container">
	        	<div class="row">
	        		
                    <div class="col">
                    	&copy; Touch Nubes <a href="${pageContext.request.contextPath }/center/center.jan">Touch Nubes</a>.
                    </div>
                    
                </div>
	        </div>
                	
        </footer>

        <!-- Javascript -->
		<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-migrate-3.0.0.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

    </body>

</html>
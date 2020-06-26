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
<title>센터페이지</title>
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
body {
            background: black;
        }
        
        @font-face {
            font-weight: normal;
            font-style: normal;
            font-family: 'feathericons';
            src: url('../fonts/feathericons/feathericons.eot?-8is7zf');
            src: url('../fonts/feathericons/feathericons.eot?#iefix-8is7zf') format('embedded-opentype'), url('../fonts/feathericons/feathericons.woff?-8is7zf') format('woff'), url('../fonts/feathericons/feathericons.ttf?-8is7zf') format('truetype'), url('../fonts/feathericons/feathericons.svg?-8is7zf#feathericons') format('svg');
        }
        
        .grid {
            position: relative;
            margin: 0 auto;
            padding: 1em 0 4em;
            max-width: 1000px;
            list-style: none;
            text-align: center;
        }
        /* Common style */
        
        .grid figure {
            position: relative;
            float: left;
            overflow: hidden;
            margin: 10px 1%;
            min-width: 320px;
            max-width: 480px;
            max-height: 360px;
            width: 48%;
            background: #3085a3;
            text-align: center;
            cursor: pointer;
        }
        
        .grid figure img {
            position: relative;
            display: block;
            min-height: 100%;
            max-width: 100%;
            opacity: 0.8;
        }
        
        .grid figure figcaption {
            padding: 2em;
            color: #fff;
            text-transform: uppercase;
            font-size: 1.25em;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
        }
        
        .grid figure figcaption::before,
        .grid figure figcaption::after {
            pointer-events: none;
        }
        
        .grid figure figcaption,
        .grid figure figcaption>a {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        /* Anchor will cover the whole item by default */
        /* For some effects it will show as a button */
        
        .grid figure figcaption>a {
            z-index: 1000;
            text-indent: 200%;
            white-space: nowrap;
            font-size: 0;
            opacity: 0;
        }
        
        .grid figure h2 {
            word-spacing: -0.15em;
            font-weight: 300;
        }
        
        .grid figure h2 span {
            font-weight: 800;
        }
        
        .grid figure h2,
        .grid figure p {
            margin: 0;
        }
        
        .grid figure p {
            letter-spacing: 1px;
            font-size: 68.5%;
        }
        /* Individual effects */
        /*---------------*/
        /***** Lily *****/
        /*---------------*/
        
        figure.effect-ravi img {
            max-width: none;
            width: -webkit-calc(100% + 50px);
            width: calc(100% + 50px);
            opacity: 0.7;
            -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
            transition: opacity 0.35s, transform 0.35s;
            -webkit-transform: translate3d(-40px, 0, 0);
            transform: translate3d(-40px, 0, 0);
        }
        
        figure.effect-ravi figcaption {
            text-align: left;
        }
        
        figure.effect-ravi figcaption>div {
            position: absolute;
            bottom: 0;
            left: 0;
            padding: 2em;
            width: 100%;
            height: 50%;
        }
        
        figure.effect-ravi h2,
        figure.effect-ravi p {
            -webkit-transform: translate3d(0, 40px, 0);
            transform: translate3d(0, 40px, 0);
        }
        
        figure.effect-ravi h2 {
            -webkit-transition: -webkit-transform 0.35s;
            transition: transform 0.35s;
        }
        
        figure.effect-ravi p {
            color: rgba(255, 255, 255, 0.8);
            opacity: 0;
            -webkit-transition: opacity 0.2s, -webkit-transform 0.35s;
            transition: opacity 0.2s, transform 0.35s;
        }
        
        figure.effect-ravi:hover img,
        figure.effect-ravi:hover p {
            opacity: 1;
        }
        
        figure.effect-ravi:hover img,
        figure.effect-ravi:hover h2,
        figure.effect-ravi:hover p {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        
        figure.effect-ravi:hover p {
            -webkit-transition-delay: 0.05s;
            transition-delay: 0.05s;
            -webkit-transition-duration: 0.35s;
            transition-duration: 0.35s;
        }
        
        @media screen and (max-width: 50em) {
            .content {
                padding: 0 10px;
                text-align: center;
            }
            .grid figure {
                display: inline-block;
                float: none;
                margin: 10px auto;
                width: 100%;
            }
}
</style>
<meta charset="UTF-8">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../commons/include_navi.jsp"></jsp:include>
<div class="container">
<header class="business-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12  text-center">
                    <br><br><br><br><br><br>
                    <hr>
                    <h1 class="tagline">TOUCHE NUBES 클래스에 오신 여러분을 환영합니다.</h1>
                    <hr>
                    <p> 데이클래스를 진행함으로서 아파트 단지 안에서 즐거운 수업을 체험하세요 </p>
                    <p> Experience a fun class in the apartment  by conducting day classes</p>
                    <br>
                </div>
            </div>
        </div>
    </header>
        <!-- Top Navigation -->
        <div class="content">
            <div class="grid">
            <c:forEach var="centerList" items="${centerList }">
                <figure class="effect-ravi">
                    <img src="/upload/${centerList.centerImgList.center_img_title}" alt="img12" />
                    <figcaption>
                        <div>
                            <h2>${centerList.centerVo.center_name }</h2>
                            <p>${centerList.centerVo.center_pr }</p> <!--  -->
                        </div>
                        <a href="${pageContext.request.contextPath }/center/center_read.do?center_no=${centerList.centerVo.center_no }">클래스 세부정보</a>
                    </figcaption>
                </figure>
            </c:forEach>
            
                                
            </div>
        </div>
    </div>
</body>
</html>
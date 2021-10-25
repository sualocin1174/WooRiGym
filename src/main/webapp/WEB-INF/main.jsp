<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 메인페이지</title>
       <!-- /* content */-->
        <style>
/* reset */
 * {
            margin: 0;
            padding: 0;
}
 body{
    font-family: 'Noto Sans KR', sans-serif;
}
			.box{
					flex-wrap: nowrap;
					justify-content: center;
					
			}
            section {
                width: 1200px;
                padding: 30px 0 30px 0;
                margin: 0 auto;
                
            }
        
        /* 신상품 | 인기상품 | 타임세일 */
            #main_bnb {
                text-align: center;
                margin-top: 15px; // 10/15(금) 추가
            }
            
            #main_bnb>ul {
				list-style-type: none;
				position: relative;
			}
			        
            #main_bnb li {
                display: inline-block;
            }

            #main_bnb li::after{
                padding: 10px;
                content: "|";
            }
            #main_bnb li:last-child::after{
                padding: 15px;
                content: "";
            }

          #main_img {
              position: relative;
              left: 20px;
              box-sizing: content-box;
            }
            #main_img a{
                display: inline-block;
                padding: 15px;
                /* position: relative; */
                
            }
            #main_img img{
            /* vertical-align: middle; */
              /* display: inline-block; */
              width: 250px;
          }
            </style>
            <!-- Slideshow / Carousel -->
            <style>
			* {box-sizing: border-box;}
			.mySlides {display: none;}
			img {vertical-align: middle;}
			
			/* Slideshow container */
			.slideshow-container {
			  max-width: 1000px;
			  position: relative;
			  margin: auto;
			}
			
			/* The dots/bullets/indicators */
			.dot {
			  height: 15px;
			  width: 15px;
			  margin: 0 2px;
			  background-color: #bbb;
			  border-radius: 50%;
			  display: inline-block;
			  transition: background-color 0.6s ease;
			}
			
			.active {
			  background-color: #717171;
			}
			
			/* Fading animation */
			.fade {
			  -webkit-animation-name: fade;
			  -webkit-animation-duration: 1s;
			  animation-name: fade;
			  animation-duration: 1s;
			}
			
			@-webkit-keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			@keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			  .text {font-size: 11px}
			}
</style>
    </head>

<body>
	<div class="box">
		<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
    
 <section>
    <!-- Slideshow / Carousel -->
        <div class="slideshow-container">
		<div class="mySlides fade">
		<!-- TODO: 이미지 변경 -->
		  <img src="./images/메인_샘플1.jpg" style="width:100%">
		</div>
		
		<div class="mySlides fade">
		  <img src="./images/메인_샘플2.jpg" style="width:100%">
		</div>
		
		<div class="mySlides fade">
		  <img src="./images/메인_샘플3.jpg" style="width:100%">
		</div>
		
		</div>
		<br>
		
		<div style="text-align:center">
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		</div>
		
		<script>
		var slideIndex = 0;
		showSlides();
		
		function showSlides() {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";  
		  }
		  slideIndex++;
		  if (slideIndex > slides.length) {slideIndex = 1}    
		  for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";  
		  dots[slideIndex-1].className += " active";
		  setTimeout(showSlides, 5000); // Change image every 5 seconds
		}
		</script>
        <div id="main_bnb">
            <ul>
                <li><a href="#">신상품</a></li>
                <li><a href="#">인기상품</a></li>
                <li><a href="#">타임세일</a></li>
            </ul>
        </div>
        <div id="main_img">
            <a href="#"><img src='./images/01번 메인 306,000.jpg' /><br></a>
            <a href="#"><img src='./images/01번 메인 841,500.jpg' /><br></a>
            <a href="#"><img src='./images/1번 메인.jpg' /><br></a>
            <a href="#"><img src='./images/01번 메인_2.jpg' /><br></a>
        </div>
  </section>
  </div>
</body>
<footer>
<%@ include file="template_footer.jsp"%>
</footer>
</html>
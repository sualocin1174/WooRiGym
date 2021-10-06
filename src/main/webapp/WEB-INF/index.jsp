<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!--  -->

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 메인페이지</title>
    <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <!-- 헤더 CSS -->
     <link rel="stylesheet" type="text/css" href="css/template_header.css"/>
    <style>
        /* reset */
        * {
            margin:0; 
            padding:0;
        }
        </style>
        <style>
            /* content */
            section {
                width: 1200px;
                padding: 30px 0 30px 0;
            }
        
            #main_bnb {
                text-align: center;
            }
        
            #main_bnb li {
                display: inline-block;
            }

        /* 신상품 | 인기상품 | 타임세일 */
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
    </head>

<body>
		<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
    
    <section>
        <div class="container">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src='./images/메인_샘플1.jpg' alt="메인사진1" style="width:100%;"/><br>
                    </div>
                    
                    <div class="item">
                        <img src='./images/메인_샘플2.jpg' alt="메인사진2" style="width:100%;"/><br>
                    </div>
                    
                    <div class="item">
                        <img src='./images/메인_샘플3.jpg' alt="메인사진3" style="width:100%;"/><br>
                    </div>
                </div>
                
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
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
    <footer></footer>
</body>

</html>
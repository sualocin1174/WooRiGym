<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 검색페이지</title>
    <!-- 부트스트랩 CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        /* 폰트 */
        /* @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap'); */
        @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap');
        </style>
    <style>
        /* reset */
        * {
            margin:0; 
            padding:0;
        }
        /* header */
        header {
            width: 1200px;
            /* margin: 0 auto; */
            /* margin-right: 0;; */
            height: 160px;
            position: relative;
            padding: 30px;
        }
        a {
            color:#BDBDBD;
            text-decoration: none;
        }
        a:link{
            text-decoration: none;
        }
        a:hover {
            color: #333;
            text-decoration: none;
        }
        ul {
            list-style-type: none;
            position: relative;
        }
        
        #nav.container {
        	border: 1px solid black;
            text-align: center;
            padding: 15px;
            width: 1200px;
            height: 62px;
        }
        
        #nav li{
            display: inline-block;
            padding: 0px 15px;
        }
        
        /* 마우스 오버 시 하위메뉴 노출 */
        #nav .dropdown:hover .dropdown-menu{
            display: inline-block;
            /* margin: 0; */
            /* width: 100%; */
        }
    
        
        /* 상단바 가로 정렬 */
        .dropdown {
        	border: 1px solid black;
            display: inline-block;
            position: relative;
            /* top: 10px; */
        }
      
        /* 상단바 테두리 없애기 */
        .btn{
            border:0px;
            padding: 10;
        }
        
        #main_tnb{
            position: absolute;
            top: 10px;
            bottom: 10px;
            right: 70px;
            margin: 10px;
            overflow: hidden;
            width: 180px;
            height: 100px;
        }
        #main_tnb > ul > li{
            display: inline-block;
            padding: 5px;
            /* border: 1px solid black; */
        }
        /* 로그인 | 최근본상품 */
        #main_tnb li:first-child::after {
            padding-left: 15px;
            content: "|";
        }
        #search_icon a{
            position: absolute;
            top: 10px;
            right: 50px;
            margin: 15px;
            width: 25px;
            height: 25px;
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
          	#searchmenu
            
            </style>
       <style>
           /* footer */

       </style>

    </head>

<body>
    <header>
        <div id="logo">
            <a href="http://woorigym.dothome.co.kr/">
                <img src='./images/logo_simple_w 180x98.png' alt="로고"/><br>
            </a>
        </div>
        <div id="main_tnb">
            <ul>
                <li><a href="#">로그인</a></li>
                <li><a href="#">최근본상품</a></li>
            </ul>
        </div>
        <div id="search_icon">
            <a href="#">
                <img src='./images/검색_돋보기.png' alt="검색" width="18px"/><br>
            </a>
        </div>
        <div id="searchmenu">
        	<ul>
        		<li>카테고리</li>
        		<li>카테고리목록</li>
        		<li>순위별</li>
        		<li>순위별목록</li>
        		<li>최소금액</li>
        		<li>최대금액</li>
        		<li>키워드검색텍스트박스</li>
        		<li>검색</li>
        	</ul>
        </div>
    </header>
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
             <!--    <div class="carousel-inner">
                    <div class="item active">
                        <img src='./images/메인_샘플1.jpg' alt="메인사진1" style="width:100%;"/><br>
                    </div>
                    
                    <div class="item">
                        <img src='./images/메인_샘플2.jpg' alt="메인사진2" style="width:100%;"/><br>
                    </div>
                    
                    <div class="item">
                        <img src='./images/메인_샘플3.jpg' alt="메인사진3" style="width:100%;"/><br>
                    </div>
                </div> -->
                
                <!-- Left and right controls -->
                <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev">
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
        </div> -->
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
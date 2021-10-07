<%@page import="woorigym.product.model.vo.ProductTable"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<ProductTable> volist = (ArrayList<ProductTable>)request.getAttribute("productvolist");
%>
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
    </header>
    <section>
        <div class="container">
			<div id="searchmenu">
				<div class="rank">
					<button class="" type="button" data-toggle="dropdown">
					<span class="caret">순위</span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">전체</a></li>
						<li><a href="#">스미스짐 패키지</a></li>
						<li><a href="#">멀티짐 패키지</a></li>
						<li><a href="#">멀티랙 패키지</a></li>
						<li><a href="#">벤치 패키지</a></li>
						<li><a href="#">벤치프레스 패키지</a></li>
						<li><a href="#">웨이트리프팅 패키지</a></li>
					</ul>
				</div>
				<form> <!-- 2021.10.07 추가 -->
					<div class = "price_box">
						<input type="text" class="text" name = "minprice[]" placeholder="최소금액">
						<span> ~ </span>
						<input type="text" class="text" name = "maxprice[]" placeholder="최대금액">
						<span>원</span>
					</div>
					<div class="keyword-div">
						<input type = "text" name = "keyword" class = "keyword_input" id = "keyword_input">
						<input type = "button" class = "searchBtn" id = "searchBtn" value = "검색"> <!-- 2021.10.07 추 -->
					</div>
				</form> <!-- 2021.10.07 추가 -->
				<!-- <button type="submit" class="btn_search">검색</button>  2021.10.07 삭제-->
			</div>
		</div>
    </section>
    <footer></footer>
    <script>
    /* 2021-10-07 수정 */
    	$("#searchBtn").click( function () {
			if($("#keyword_input").val() == "") {
				alert("상품명을 검색창에 입력 후 검색버튼을 눌러주세요");
				return;
			}
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/slist.ajax",
				data: {
					productName : "육각아령",
					parentCategory: "", 
					childCategory: "",
					minPrice: 1000,
					maxPrice: 1000000
					// TODO: 순위, 인기... 
				},
				success: function(data){
					console.log(data);
					alert("aaa");
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
			});
		});
    	/* 2021-10-07 수정완료 */
    </script>
</body>

</html>
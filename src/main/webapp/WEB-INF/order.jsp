<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 결제페이지</title>
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
         /* 공통헤더에 있던 부분인데 css로 따로 빼면 적용이 안되서 reset에 포함 */
        #main_tnb2 {
            position: absolute;
            top: 10px;
            bottom: 10px;
            right: 30px;
            margin: 10px;
            overflow: hidden;
            width: 500px;
            height: 100px;
        }
		
        #main_tnb2>ul>li {
            display: inline-block;
            padding: 5px;
        }
        /* 로그인 전: 로그인 | 최근본상품 */
        /* 로그인 후: OOO님 | 로그아웃 | 마이페이지 | 장바구니 | 최근본상품 */
        #main_tnb2 li::after {
            padding-left: 10px;
            content: "|";
        }
        #main_tnb2 li:last-child::after {
            padding-left: 10px;
            content: "";
        }
         /* 공통헤더~reset에 포함  끝*/
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
            <style>
            	table{
            	border: 1px solid black;
            	}
            </style>
         
            
            
    </head>

<body>
		<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
 	<section>
 	<aside>
    <div id="side-menu">
        <ul>
            <li>마이페이지</li>
            <li><a href="#">주문/배송조회</a></li>
            <li><a href="#">취소/교환/반품</a></li>
            <li><a href="#">상품 후기</a></li>
            <li><a href="#">쿠폰 관리</a></li>
            <li><a href="#">상품 문의(Q&A)</a></li>
        </ul>
    </div>
</aside>

<%@ include file="order_cart.jsp"%>
<%@ include file="order_userinfo.jsp"%>
<%@ include file="order_address.jsp"%>
<%@ include file="order_payment.jsp"%>



</section>
 	
 	
    
    
      
        
    <footer></footer>
</body>


</html>
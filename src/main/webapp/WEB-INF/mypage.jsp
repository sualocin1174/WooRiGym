   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- 마이페이지 사이드 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리짐 마이페이지 메인</title>
    <style>
        /* reset */
        * {
            margin: 0;
            padding: 0;
        }
    </style>
    <style>
        /* content */
        section {
            width: 900px;
            padding: 30px 0 30px 0;
            position: relative;
            bottom: 200px;
            left: 300px;
        }
        #side-menu>ul>li {
            padding: 5px;
        }
        /* 마이페이지 폰트 크게 */
        #side-menu>ul>li:first-child{
            font-size: 25px;
        }
		.coupon, #order_info {
			width: 800px;
			text-align: center;
        	margin: 15px 0 15px 0;
        	border-top: 1.5px solid black;
          	border-bottom: 1px solid #BDBDBD;
		}
        .coupon td {
            padding: 0 10px 5px 0;
        }
         #order_info tr:first-child>td {
            font-size: 50px;
            padding: 45px;
        }
        #order_info tr:nth-child(2)>td{
            text-align: center;
            padding: 0 20px 20px 20px;
         }
         /* 취소/교환/반품 */
         #delivery_info > li{
            position: relative;
            top:20px;
            display: inline-block;
            border: 1px solid #BDBDBD;
            padding: 10px 50px;
         }
         #delivery_info {
         width: 800px;
         text-align: center;
         }
         /* 최근 본 상품*/
          .recent_product{
             position: relative;
             top: 40px;
         }
         h3.recent_product, #uname {
         margin: 0 0 15px 0;
         }
         .recent_product > img {
             width: 200px;
             height: 200px;
         }
    </style>
</head>

<body>
	<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
 	<!--마이페이지 공통사이드 템플릿 -->
 	<c:import url="template_mypage_aside.jsp"/>
 	
<section>
  <c:if test="${loginSS != null}">
    <h1 id="uname">${loginSS.user_name}님 즐거운 쇼핑 되세요!</h1>
    <a href="#">회원정보 수정 ></a>
  </c:if>
<table class="coupon">
    <tr>
        <td colspan="3"><a href="#">쿠폰</a></td>
        <td colspan="3"><a href="#">적립금</a></td>
    </tr>
    <tr>
        <td>보유 쿠폰</td>
        <td>0</td>
        <td>장</td>
        <td>보유 적립금</td>
        <td>0</td>
        <td>P</td>
    </tr>
    <tr>
        <td>소멸 예정 쿠폰</td>
        <td>0</td>
        <td>장</td>
        <td>소멸 예정 적립금</td>
        <td>0</td>
        <td>P</td>
    </tr>
</table>
<h3>주문/배송</h3>
<table id="order_info">
    <tr>
        <!-- 주문/배송조회에서 갯수 체크해서 불러오기 -->
        <!-- 아래 0은 시범용(삭제예정) -->
        <td>0</td>
        <td>0</td>
        <td>0</td>
        <td>0</td>
    </tr>
    <tr>
        <td>주문완료</td>
        <td>배송준비중</td>
        <td>배송중</td>
        <td>배송완료</td>
    </tr>
</table>
<ul id="delivery_info">
	<!-- 취소/교환/반품 -->
<!-- 아래 0은 시범용(삭제예정) -->
<li onclick="">
    <span>취소:</span>
    <span>0</span>
    건
</li>
<li onclick="">
    <span>교환:</span>
    <span>0</span>
    건
</li>
<li onclick="">
    <span>반품:</span>
    <span>0</span>
    건
</li>
</ul>
<h3 class="recent_product">최근 본 상품</h3>
<div class="recent_product">
	<!-- TODO: 이미지 경로 수정 -->
    <img src="./images/01번 메인 841,500.jpg">
    <img src="./images/1번 메인.jpg">
    <img src="./images/01번 메인_2.jpg">
</div>
</section>

<footer>

</footer>
</body>

</html>
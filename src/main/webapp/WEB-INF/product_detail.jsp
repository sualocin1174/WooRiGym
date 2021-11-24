<!-- 웹폰트: Noto Sans Korean -->
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="woorigym.product.model.vo.ProductTable"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
 <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<%@page import = "woorigym.user.model.vo.UserTable" %>
    <%
    UserTable user = (UserTable)session.getAttribute("loginSS");
  %>
  <%String img = (String) request.getAttribute("img"); %>
  <%ProductTable productVo = (ProductTable) request.getAttribute("prodectInfo");
 
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
 <style>
 /* reset */
 * {
            margin: 0;
            padding: 0;
}
 body{
    font-family: 'Noto Sans KR', sans-serif;
}
 /* 블릿 삭제 */
        ul, li { list-style: none; }
        img { border: 0; }
   /* 위치 포지셔닝 */
        #content {
            width: 960px;
            margin: 0 auto;
        }
        section {
            padding: 0 0 30px 0;
        }
        
        #content > aside {
            width: 750px;
        }
        /* 상품 대표이미지 */
        .thumbnail_img {
            width: 500px;
            height: 550px;
            margin-right: 30px;
        }
        /* 상품 정보*/
        div.product_info{
            width: 400px;
            display: inline-block;
            position: relative;
            top: -100px;
            
        }
        div.product_info li{
           padding: 5px;
           margin: 10px;]
        }
        /* 눌려진 div 보이게 */
        input:nth-last-of-type(1){display: none;}
        input:nth-last-of-type(1)~div:nth-last-of-type(1){display: none;}
        input:nth-last-of-type(1):checked ~div:nth-last-of-type(1){
            display: block;
        }
        input:nth-last-of-type(2){display: none;}
        input:nth-last-of-type(2)~div:nth-last-of-type(2){display: none;}
        input:nth-last-of-type(2):checked ~div:nth-last-of-type(2){
            display: block;
        }
         /* 탭모양 */
         aside > label {
            display: block; 
            float: left;
            width: 100px;
            height: 30px;
            text-align: center;
            line-height: 30px;

            border: 1px solid black;
            box-sizing: border-box;
            background-color: white;
            color: #006572;
        }
         input:nth-last-of-type(1):checked ~label:nth-last-of-type(1){
           background-color: #006572;
            color: white;  }
        input:nth-last-of-type(2):checked ~label:nth-last-of-type(2){
            background-color: #006572;
            color: white; }
             /* 탭목록 */
            .tab_item .item{
                overflow: hidden;
                padding: 10px;
                border: 1px solid black;
                border-top: none;
            }
            .item .thumbnail{
                float: left;
            }
            .item .description{
                float: left;
                margin-left: 10px;
                width: 120px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            /* 장바구니, 바로구매 버튼 */
            .button{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 1.2rem;
        margin: 25px 10px;
        transition-duration: 0.2s;
        cursor: pointer;
        background-color: white;
        color: black;
        border: 2px solid #DFE0DF;
        border-radius: 5px;
        }

        .button:hover {
        border: 2px solid #FEA500;
      	background: #FEA500;
      	color: white;
        }
 </style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
<div id="content">
	<section>
    <img class="thumbnail_img" src="<%=img %>">
    <div class="product_info">
    <ul><!-- TODO -->
    <li><h1><%=productVo.getProductName()%></h1></li>
    <li><h3><%=productVo.getProductNo()%></h3></li>
    <%DecimalFormat formatter = new DecimalFormat("###,###,###");
    	String price= formatter.format(productVo.getPrice());
    	String point = formatter.format(productVo.getPrice() * 0.05);
    %>
    <li><h2><%=price%>원</h2></li>
    <li><h4>적립금: <%=point %></h4></li>
    <li><h4>배송비: 2,500원</h4></li>
    <li><select>
            <option>옵션 선택</option>
        </select><li>
        <form name="for" method="post" action="">
        <input type="hidden" value="<%=productVo.getProductNo()%>" name="ProductNo">
    <li><a href="<%=ctxPath %>/sblist" class="button">장바구니</a>
    <a href="<%=ctxPath %>/order" class="button">바로구매</a></li>
    </form>
    </ul>
    </div>
	</section>
	
    <aside>
        <!-- tab 부분 안보이게 하는게 포인트! -->
        <!-- checked : 기본적으로 눌려진 상태 -->
        <input type="radio" id="review_tab" name="tab" checked>
        <input type="radio" id="qna_tab" name="tab">
        <!-- inline속성은 태그 사이의 띄어쓰기 하나도 조심! -->
        <label for="review_tab">상품리뷰</label>
        <label for="qna_tab">Q&A</label>
        <div class="tab_item">
            <ul>
                <li class="item"><a href="#">
                        <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                        <div class="description"><b>HTML5 Canvas</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
                <li class="item"><a href="#">
                        <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                        <div class="description"><b>HTML5 Audio</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
                <li class="item"><a href="#">
                        <div class="thumbnail"><img src="https://via.placeholder.com/45"></div>
                        <div class="description"><b>HTML5 Video</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
            </ul>
        </div>
        <div class="tab_item">
            <ul>
                <li class="item"><a href="#">
                        <div class="description"><b>CSS3 Transition</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
                <li class="item"><a href="#">
                        <div class="description"><b>CSS3 Animation</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
                <li class="item"><a href="#">
                        <div class="description"><b>CSS3 Border</b>
                            <p>2012-09-10</p>
                        </div>
                    </a></li>
            </ul>
        </div>
    </aside>
    <section>
    <p>상품 상세이미지</p>
    <img src="#">
    </section>
</body>
</html>
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<%@ page import = "woorigym.user.model.vo.OrderTable" %>
<%@ page import = "woorigym.user.model.vo.OrderDetailTable" %>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-주문/배송조회</title>
    <script>

    //페이지 로드 시 주문상세내역 출력
    window.onload = pageLoadedHandler();
    function pageLoadedHandler(){
    $(function(){ 
       	// TODO
    	console.log()
    	console.log(order_no);
    	
    });
    };
    function order_detail(order_no){
    	// TODO: 유효성검사
    	
    }

    </script>
 <!-- /* content */ -->
 <style>
     section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
       /* 주문/배송조회 */
      section > h2 {
          margin: 20px;
          text-align: center;
      }
      .btn{
          text-align: center;
          margin-bottom: 20px;
      }
       .button{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 25px 10px;
        transition-duration: 0.3s;
        }

        .button{
            background-color: white;
            color: black;
            border: 2px solid #e7e7e7;
        }

        .button:hover {
            background-color: #e7e7e7;
        }

        #go_list {
        padding: 6px 32px;
        margin: 4px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        cursor: pointer;
        }
        #go_list:hover {
        background-color: #555555;
        color: white;
        }
      
       /* 주문내역 테이블 */
      	#order_detail, #olist, .order{
		  width: 850px;
          text-align: center;
          margin: 25px 0 25px 0;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
        }
      	#olist{
      	border-top: none;
      	margin: 0 0 15px 0;
      	}
      	#order_detail th{
      	padding: 10px;
      	}
      	#olist, .order {
      	padding-bottom: 8px;
      	}
      	#olist td, .order td {
      	padding: 5px;
      	}
        #order_detail td {
        padding: 16px;
      	}
	   	 #order_detail img{
          width: 80px;
          height: 80px;
      	}
 </style>
</head>
<body>
		<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>

<section>
    <h2>주문/배송 조회</h2>
    <h3>주문 상세보기</h3>
     <table id="order_detail">
            <tr>
                <th colspan="2">상품명</th>
                <th>수량</th>
                <th>상품금액</th>
                <th>배송비</th>
                <th>결제상태</th>
                <th>진행상태</th>
            </tr>
            <tr>
         <!-- TODO: 이미지 경로 수정 -->
         <td><a href="#"><img src="./images/01번 메인_2.jpg"></a></td>
         <td>${detail.product_name}</td>
            <td>${detail.buy_quantity}</td>
            <td>${detail.order_total}</td>
            <td>${detail.order_cost}</td>
            <td>${detail.pay_state}</td>
            <td>${detail.order_state}</td>
        </tr>
            </table>
            <table id="olist">
                <tr>
                    <th>쿠폰 할인</th>
                    <td>${detail.coupon_discount}원</td>
                    <th>상품 금액</th>
                    <td>${detail.order_total}원</td>
                </tr>
                <tr>
                    <th>결제 후 적립</th>
                    <td>${detail.add_mileage}P</td>
                    <th>할인 금액</th>
                    <td>${detail.discount_all}원</td>
                </tr>
                <tr>
                    <th>포인트 사용</th>
                    <td>${detail.point_discount}P</td>
                    <th>배송비</th>
                    <td>${detail.order_cost}원</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <th>총 결제 금액</th>
                    <td>${detail.total_pay}원</td>
                </tr>
            </table>
  	<h3>결제 정보</h3>
<table class="order">
        <tr>
            <th>주문 번호</th>
            <td>${detail.order_no}</td>
            <th>주문 일자</th>
            <td>${detail.order_date}</td>
        </tr>
        <tr>
            <th>포인트 할인</th>
            <td>${detail.point_discount}P</td>
            <th>쿠폰 할인</th>
            <td>${detail.coupon_discount}원</td>
        </tr>
        <tr>
            <th>결제 정보</th>
            <td></td>
            <th>결제 방식</th>
            <td></td>
        </tr>
    </table>
    <br>
  	<h3>배송 정보</h3>
      <table class="order">
        <tr>
            <th>주문하시는 분</th>
            <td>${loginSS.user_name}</td>
        </tr>
        <tr>
            <th>받으시는 분</th>
            <td>${detail.receiver_name} (${detail.phone_no})</td>
        </tr>
        <tr>
            <th>배송지 주소</th>
            <td>[${detail.postcode}] ${detail.basic_address} ${detail.detail_address}</td>
    <c:if test="${detail.pay_state= '주문완료'}">
    <td>
    <input type="button" class="button" value="수정" id="insert_place">
    </td></c:if>
        </tr>
      </table>
    <br>
    <div class="btn">
    <input type="submit" class="button" value="목록" id="go_list" onclick="history.go(-1)">
    </div>
</section>
</body>
</html>
<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
 <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/교환/반품 상세보기</title>
<script>

    //페이지 로드 시 취소/교환/반품 상세내역 출력
    window.onload = pageLoadedHandler();
    function pageLoadedHandler(){
    $(function(){ 
       	// TODO
    	console.log()
    	console.log(order_no);
    });
    };
    function cer_detail(order_no){
    	// TODO: 유효성검사
    	
    }

    </script>
 <!-- /* content */ -->
 <style>
  body{
        font-family: 'Noto Sans KR', sans-serif;
        }
     section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
       /* 취소/교환/반품 조회 */
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
       /* 취소/교환/반품내역 테이블 */
      	#cer_detail, #clist, .cer{
		  width: 850px;
          text-align: center;
          margin: 25px 0 25px 0;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
        }
        #cer_detail th{
      	padding: 10px;
      	}
      	#olist, .cer {
      	padding-bottom: 12px;
      	}
      	#cer_detail td{
        padding: 16px;
      	}
      	.cer td {
        padding: 12px;
      	}
	   	 #cer_detail img{
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
<h2>취소/교환/반품 조회</h2>
  <h3>${cerdetail.claim_kind} 상세보기</h3>
    <table id="cer_detail">
            <tr>
                <th colspan="2">상품명</th>
                <th>신청분류</th>
                <th>수량</th>
                <th>상품금액</th>
                <th>배송비</th>
                <th>처리상태</th>
            </tr> 
            <tr>
            <!-- TODO: 이미지 경로 수정 -->
         <td><a href="#"><img src="./images/01번 메인_2.jpg"></a></td>
                <td>${cerdetail.product_no}</td>
                <td>${cerdetail.claim_kind}</td>
                <td>${cerdetail.buy_quantity}</td>
                <td>${cerdetail.order_total}</td>
                <td>${cerdetail.order_cost}</td>
                <td>${cerdetail.claim_process}</td>
            </tr> 
   </table>
   <h3>${cerdetail.claim_kind} 정보</h3>
<table class="cer">
        <tr>
            <th>주문 번호</th>
            <td>${order_no}</td>
            <th>주문 일자</th>
            <td>${cerdetail.order_date}</td>
        </tr>
        <tr>
            <th>결제 방식</th>
            <!-- 0 : 카드결제, 1 : 무통장결제 -->
            <c:if test="${cerdetail.order_method == '0'}">
            <td>카드결제</td>
            </c:if>
            <c:if test="${cerdetail.order_method == 1}">
            <td>무통장결제</td>
            </c:if>
            <th>신청 일자</th>
            <td>${cerdetail.claim_date}</td>
        </tr>
        <tr>
            <th></th>
            <td></td>
            <th>${cerdetail.claim_kind} 처리 일자</th>
            <td>${cerdetail.done_date}</td>
        </tr>
    </table>
   <div class="btn">
    <input type="submit" class="button" value="목록" id="go_list" onclick="history.go(-1)">
    </div>
</section>
</body>
</html>
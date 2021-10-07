   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-주문/배송조회</title>
    <!-- header.css 분리예정 -->
 <style>
     /* reset */
     * {
         margin: 0;
         padding: 0;
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
         color: #BDBDBD;
         text-decoration: none;
     }

     a:link {
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
         text-align: center;
         padding: 15px;
         width: 1200px;
         height: 62px;
     }

     #nav li {
         display: inline-block;
         padding: 0px 15px;
     }

     /* 마우스 오버 시 하위메뉴 노출 */
     #nav .dropdown:hover .dropdown-menu {
         display: inline-block;
         /* margin: 0; */
         /* width: 100%; */
     }


     /* 상단바 가로 정렬 */
     .dropdown {
         display: inline-block;
         position: relative;
         /* top: 10px; */
     }

     /* 상단바 테두리 없애기 */
     .btn {
         border: 0px;
         padding: 10;
     }
      /* 로그인 전 후 화면 다름 시작 */
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
         /* border: 1px solid black; */
     }

     /* OOO님 | 로그아웃 | 마이페이지 | 장바구니 | 최근본상품 */
     #main_tnb2 li::after {
         padding-left: 10px;
         content: "|";
     }
     #main_tnb2 li:last-child::after {
         padding-left: 10px;
         content: "";
     }
      /* 로그인 전 후 화면 다름  끝*/

     #search_icon a {
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
         width: 900px;
         padding: 30px 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 300px;
     }
     aside {
         padding: 30px 0 0 30px;
     }
     #side-menu>ul>li{
         padding: 5px;
     }
     /* 마이페이지 폰트 크게 */
     #side-menu>ul>li:first-child{
         font-size: 25px;
     }

     .coupon td {
         padding: 0 100px 5px 0;
     }
     #order_info tr:first-child>td {
         font-size: 50px;
         padding: 45px;
     }
     #order_info tr:nth-child(2)>td{
         text-align: center;
         padding: 0 20px 0 20px;
      }
     /* 취소/교환/반품 */
      #delivery_info > li{
         position: relative;
         top:20px;
         display: inline-block;
         border: 1px solid #BDBDBD;
         padding: 10px 50px;
      }
      .recent_product{
          position: relative;
          top: 40px
      }
      .recent_product > img {
          width: 200px;
          height: 200px;
      }

      table#order_detail{
          text-align: center;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
        }
        #order_detail td{
            padding: 10px 30px 20px 0;
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
<aside>
 <div id="side-menu">
     <ul>
         <li><a href="#">마이페이지</a></li>
         <li><a href="#">주문/배송조회</a></li>
         <li><a href="#">취소/교환/반품</a></li>
         <li><a href="#">상품 후기</a></li>
         <li><a href="#">쿠폰 관리</a></li>
         <li><a href="#">상품 문의(Q&A)</a></li>
     </ul>
 </div>
</aside>
<section>
    <h3>주문/배송 조회</h3>
    <h4>조회 기간</h4>
    <!-- 달력 -->
    <input type="submit" value="검색">
    <hr>
    <!-- 주문번호 -->
    <!-- 날짜 시간 yyyy.mm-dd hh:mm-->
    <table id="order_detail">
        <tr>
            <td colspan="2">상품명</td>
            <td>수량</td>
            <td>상품금액</td>
            <td>배송비</td>
            <td>진행상태</td>
        </tr>
        <tr>
            <!-- 이미지 클릭 시 상품페이지로 이동 -->
            <td><a href="#">
                <img src="./images/1번 메인.jpg">
            </a></td>
            <!-- 상품명 -->
            <td>X5 런닝머신</td>
            <td>1</td>
            <td>1,169,000</td>
            <td>2,500</td>
            <td>주문완료</td>
        </tr>
        <!-- <tr>
            <td>주문취소</td>
        </tr> -->
        <tr>
            <td><a href="#">
            <img src="./images/01번 메인_2.jpg">
        </a></td>
            <td>에베레스트 스텝퍼</td>
            <td>1</td>
            <td>1,197,500</td>
            <td>2,500</td>
            <td>배송완료</td>
        </tr>
         <!-- <tr>
            <td>교환/반품</td>
        </tr> -->
    </table>
</section>
</body>
</html>
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
    <script>
  //페이지 로드 시 sysdate 기준 1달 이내의 주문내역 출력
    window.onload = pageLoadedHandler;
    function pageLoadedHandler(){
       	// TODO
    	//$("#start_date").val(1달전날짜);
    	//$("#end_date").val(오늘날짜);
    	$("#start_date").val("2021-08-01");
    	$("#end_date").val("2021-10-01");
    	
    	$("#order_search").on("click", ajaxF1);
    	ajaxF1();
    }
    function ajaxF1(){ //검색버튼 클릭 시
    	// 유효성검사 해도되고 
    	var startDate = $("#start_date").val();
    	var endDate =  $("#end_date").val();
    	console.log(startDate);
    	console.log(endDate);
    	$.ajax({
    		type: "post",
    		url: "<%=request.getContextPath()%>/orderlist",
    		data: {
    			startDate: startDate,
    			endDate: endDate
    		},
    		dataType: "json", //전달받을 객체는 json이다.
    		success: function(data){
    			console.log(data);
    			console.log(data.length);
    			console.log(data[0].product_name);
    			//TODO
    			if(data!=null){
    				var html = "";
    				for(var i=0; i<data.length;i++){
    					console.log(data[i]);
	    				html+="<h4><a href='./orderDetailTable?order_no="+data[i].order_no+"'>"+data[i].order_no+"</a></h4>";
	    				console.log(html);
	    				html+="<h5><a href='./orderTable?order_date='"+data[i].order_date+"</a></h5>";
	    				console.log(html);
	    				html+="<table id='order_detail'><tr><td colspan='2'>상품명</td>"
		    	            + "<td>수량</td><td>상품금액</td><td>배송비</td><td>진행상태</td></tr>"
		    	            
		    	 		+"<a href='./orderDetailTable?product_no="+data[i].product_no+"'>"
		    	 		+"<img src='./images/1번 메인.jpg'></a></td><td>"+data[i].product_name+"</td>"	  
		    	 		
		    	       +"<td><a href='./orderDetailTable?buy_quantity="+data[i].buy_quantity+"'></a></td>"
		    	       +"<td><a href='./orderTable?order_total="+data[i].order_total+"'></a></td>"
		    	       +"<td><a href='./orderTable?order_cost="+data[i].order_cost+"'></a></td>"
		    	       +"<td><a href='./orderTable?order_state="+data[i].order_state+"'></a></td>"
		    	 				
		    	       +"<tr><td><a href='./productTable?product_info_url="+data[i].product_info_url+"'></a></td>"
		    	    	
		    	        +"</tr></table>";
		    	   
	    				console.log(html);
    					
    				}
    				var ol = data[0].product_name;
    				
        		    $("#order_search").html(ol);//노드 내용 수정하기
    				//$("#order_search").insertAfter(ol);//검색 버튼 뒤에 ol 추가
    				//$("#order_search").append(html);
    				//$("#order_search").html(html);
    			} else {
        			$("#order_search").html("결과없음");
    			}
    		},
    		error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+
    					"\n"+"error:"+error);
    		}
    	});
	};
    </script>
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
       /* 주문/배송조회 */
      section > h2 {
          margin: 0;
          text-align: center;
      }
      /* 기간별 주문내역 검색 */
      #btngroup{
          text-align: center;
      }
       .button{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 10px 10px;
        transition-duration: 0.3s;
        }

        .button{
            background-color: white;
            color: black;
            border: 2px solid #e7e7e7;
        }

        .button:hover{
            background-color: #e7e7e7;
        }

        #order_search {
        padding: 6px 32px;
        margin: 4px 2px;
        background-color: white;
        color: black;
        border: 2px solid #555555;
        }
        #order_search:hover {
        background-color: #555555;
        color: white;
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
    <h4>조회 기간</h4>
    <!-- 달력 -->
     <div id="btngroup">
     <!-- $("#start_date").val() -->
     <!-- $("#end_date").val() -->
    <input type="date" id="start_date">
    <input type="date" id="end_date">
    <!--  클릭 시 end_date = sysdate 기준으로 
    start_date = 1주일, 1개월, 3개월, 6개월 전 날짜 자동선택 -->
    <input type="button" class="button" value="1주일" id="1week">
    <input type="button" class="button" value="1개월" id="1month">
    <input type="button" class="button" value="3개월" id="3month">
    <input type="button" class="button" value="6개월" id="6month">
    <br>
    <input type="submit" class="button" value="검색" id="order_search">
    </div>
  	<table id="order_detail">
        <tr>
            <td colspan="2">상품명</td>
            <td>수량</td>
            <td>상품금액</td>
            <td>배송비</td>
            <td>진행상태</td>
        </tr>
        </table>
</section>
</body>
</html>
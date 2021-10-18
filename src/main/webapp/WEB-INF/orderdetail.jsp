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
    	
    });
    };
    function order_detail(order_no){
    	// TODO: 유효성검사
    	console.log()
    	console.log(order_no);
    	
    	$.ajax({
    		type: "post",
    		url: "<%=request.getContextPath()%>/orderlist",
    		data: {
    			startDate: startDate,
    			endDate: endDate
    		},
    		dataType: "json", //전달받을 객체는 json이다.
    		success: function(data){
    			$("#order").html(""); //중복 결과 방지 위해 새로고침!
    			$("#order_detail").remove();
    			console.log(data);
    			console.log(data.length);
    				var empty ="";
    				var cancel = "";
    			//console.log(data[0].product_name); 참고용
    			if(data!=""){
    				var html = "";
    				for(var i=0; i<data.length;i++){
    					console.log(data[i]);
    				//주문번호, 주문날짜+테이블 제목+내용
    					 html+=  "<h3><a href='orderDetailTable?order_no="+data[i].order_no+"'>"+data[i].order_no+"</a></h3>"
							 + "<h4><a href='./orderTable?order_date='"+data[i].order_date+"'>"+data[i].order_date+"</a></h4>"
    						 
	    					 //+ "<a href='./orderDetailTable?product_no="+data[i].product_no+"'>"
		    	 			 + "<td><a href='./productTable?product_info_url="+data[i].product_info_url
		    	 			//TODO: 이미지 경로 수정
		    	 			 +"'><img src='./images/1번 메인.jpg'></a></td>"+"<td>"+data[i].product_name+"</td>"	  
		    	       		 +"<td><a href='./orderDetailTable?buy_quantity="+data[i].buy_quantity+"'>"+data[i].buy_quantity+"</a></td>"
		    	       		 +"<td><a href='./orderTable?order_total="+data[i].order_total+"'>"+data[i].order_total+"</a></td>"
		    	       		 +"<td><a href='./orderTable?order_cost="+data[i].order_cost+"'>"+data[i].order_cost+"</a></td>"
		    	       		 +"<td><a href='./orderTable?order_state="+data[i].order_state+"'>"+data[i].order_state+"</a></td>"
		    	        	 +"</tr></table>";
    				}
        		    $("#order").html(html);
    				//if(data[i].order_state =='배송전'){
    					//cancel += "<tr><td><button>주문취소</button><td></tr>";
    				//	$("#order_detail").html(cancel);
    				//}
    			} else {
		    	      //결과 없을 때
    				empty += "<table id='order_detail'><tr><th colspan='2'>상품명</th>"
					     + "<th>수량</th><th>상품금액</th><th>배송비</th><th>진행상태</th></tr>"
						  +"<td colspan='6'>해당 기간의 주문내역이 없습니다</td>"
        			 $(empty).insertAfter($("#btngroup"));
    			}
    		},
    		error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+
    					"\n"+"error:"+error);
    		}
    	});
	};
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
      #btngroup{
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
        }
        #go_list:hover {
        background-color: #555555;
        color: white;
        }
      
       /* 주문내역 테이블 */
       #order h3, #order h4 {
       padding-bottom: 5px;
       }
      	table#order_detail{
		  width: 850px;
          text-align: center;
          margin-bottom: 15px;
          border-top: 1.5px solid black;
          border-bottom: 1px solid #BDBDBD;
        }
      	#order_detail th{
      	padding: 10px;
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
                <th>포인트</th>
                <th>쿠폰</th>
                <th>배송비</th>
                <th>진행상태</th>
            </tr>
            <tr id="olist">
         <td colspan="2" id="product_name">${product_name}</td>
            <td id="buy_quantity">${buy_quantity}</td>
            <td id="order_total">${order_total}</td>
            <td id="point_discount">${point_discount}</td>
            <td id="coupon_discount">${coupon_discount}</td>
            <td id="order_cost">${order_cost}</td>
            <td id="order_state">${order_state}</td>
        </tr>
            </table>
    <div id="order">
  	<!-- 결제정보 -->
  	<!-- 배송정보  -->
    </div>
     <div id="btngroup">
    <input type="button" class="button" value="수정" id="insert_place">
    <br>
    <input type="submit" class="button" value="목록" id="go_list" onclick="history.go(-1)">
    </div>
</section>
</body>
</html>
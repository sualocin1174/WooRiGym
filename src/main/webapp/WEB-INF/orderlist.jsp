   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 마이페이지 사이드 CSS -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_mypage_aside.css" />
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
    
    	// 현재 날짜 및 시간
        var now = new Date();	
        console.log("현재 : ", now);
    function sysdate(){
        //날짜 추출
    	var yyyy = now.getFullYear();
    	var mm = now.getMonth() + 1;
    	var dd = now.getDate();
	//원하는 날짜형식: yyyy/mm/dd
    	return yyyy+"/"+mm+"/"+dd;
    }
        console.log("현재 : ", sysdate());
 
 	 //한달 전
    var oneMonthAgo = new Date(now.setMonth(now.getMonth() - 1)); 
    console.log("한달 전 : ", oneMonthAgo);
    
    function default_date(){
    	var year = oneMonthAgo.getFullYear();
    	var month = ("0"+(1+oneMonthAgo.getMonth())).slice(-2);
    	var day = ("0"+oneMonthAgo.getDate()).slice(-2);
    	
    	return year+"/"+month+"/"+day;
    }
        console.log("한달 전 : ", default_date());
    
  //페이지 로드 시 오늘날짜 기준 1달 이내의 주문내역 출력
    window.onload = pageLoadedHandler;
    function pageLoadedHandler(){
       	// TODO
    	//$("#start_date").val(1달전날짜);
    	//$("#end_date").val(오늘날짜);
    	$("#start_date").val(default_date());
    	$("#end_date").val(sysdate());
    	console.log("1달전 : ", oneMonthAgo); 
    	console.log("오늘 날짜 : ", sysdate); 
    	
    	$("#order_search").on("click", ajaxF1);
    	ajaxF1();
    }
    
    function ajaxF1(){ //검색버튼 클릭 시
    	// TODO: 유효성검사 해도되고 
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
        		    $("#order_search").html(html);//노드 내용 수정하기
    				var ol = data[0].product_name;
    		       // $("#olist").append(html);
    				//$("#order_search").insertAfter(ol);//검색 버튼 뒤에 ol 추가
    				//$("#order_search").html(html);
    			} else {
        			$("#order_search").html("결과없음");
        			//$("#olist").append("결과없음");
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
         padding: 30px 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 300px;
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
        <tr id="olist">
            <td colspan="2"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </table>
</section>
</body>
</html>
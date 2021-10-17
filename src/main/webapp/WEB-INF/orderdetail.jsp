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

    //페이지 로드 시 오늘날짜 기준 1달 이내의 주문내역 출력
    window.onload = pageLoadedHandler();
    function pageLoadedHandler(){
    $(function(){ 
       	// TODO
    	//$("#start_date").val(1달전날짜);
    	//$("#end_date").val(오늘날짜);
    	console.log($("#start_date"));
    	$("#start_date").val(default_date());
    	$("#end_date").val(sysdate());
    	console.log("1달전 : ", default_date()); 
    	console.log("오늘 날짜 : ", sysdate()); 
    	$("#order_search").on("click", ajaxF1());//검색 버튼
    	$("#1week").on("click", lastWeek); //1주일 버튼
    	$("#1month").on("click", lastMonth); //1개월 버튼
    	$("#3month").on("click", last3M); //3개월 버튼
    	$("#6month").on("click", last6M); //6개월 버튼
    	
    });
    };
    	// 현재 날짜 및 시간
        var now = new Date();	
        console.log("현재 : ", now);
    function sysdate(){
        //날짜 추출
        var year = now.getFullYear();
    	var month = ("0"+(now.getMonth()+2)).slice(-2);
    	console.log("month: "+month); //왜 now랑 end_date는 이번달로 잘 나오고 month는 다음달로 나올까..
    	var day = ("0"+now.getDate()).slice(-2);
    	
    	//확인
    	console.log("sysdate(): "+year+"-"+month+"-"+day);
		//원하는 날짜형식: yyyy/mm/dd
    	return year+"-"+month+"-"+day;
    }
        console.log("현재 : ", sysdate());
 
 	 //페이지 로드 시 기본 날짜: 현재~한달 전 자동조회
    var oneMonthAgo = new Date(now.setMonth(now.getMonth() - 1)); 
    console.log("한달 전 : ", oneMonthAgo);
    
    function default_date(){
    	var year = oneMonthAgo.getFullYear();
    	var month = ("0"+(1+oneMonthAgo.getMonth())).slice(-2);
    	var day = ("0"+oneMonthAgo.getDate()).slice(-2);
    	//확인
    	console.log("default_date(): "+year+"-"+month+"-"+day);
    	return year+"-"+month+"-"+day;
    }
    console.log("한달 전 : ", default_date());
    
 	 // 1개월 전
    function lastMonth(){
    	var year = oneMonthAgo.getFullYear();
    	var month = ("0"+(1+oneMonthAgo.getMonth())).slice(-2);
    	var day = ("0"+oneMonthAgo.getDate()).slice(-2);
    	//확인
    	console.log("lastMonth(): "+year+"-"+month+"-"+day);
    	$("#start_date").val(year+"-"+month+"-"+day);
    }
    
    // 1주일 전
    	function lastWeek() {
    		//날짜 추출
            var year = now.getFullYear();
        	var month = ("0"+(2+now.getMonth())).slice(-2);
        	var day = ("0"+(-7+now.getDate())).slice(-2);
        	
        	//확인
        	console.log("lastWeek(): "+year+"-"+month+"-"+day);
    	//원하는 날짜형식: yyyy/mm/dd
        	$("#start_date").val(year+"-"+month+"-"+day);
        	
    	}
    
    //3개월 전
    function last3M(){
    	//날짜 추출
        var year = now.getFullYear();
    	var month = ("0"+(now.getMonth()-1)).slice(-2);
    	var day = ("0"+(now.getDate())).slice(-2);
    	
    	//확인
    	console.log("last3M(): "+year+"-"+month+"-"+day);
	//원하는 날짜형식: yyyy/mm/dd
    	$("#start_date").val(year+"-"+month+"-"+day);
    }
    //6개월 전
    function last6M(){
    	//날짜 추출
        var year = now.getFullYear();
    	var month = ("0"+(now.getMonth()-4)).slice(-2);
    	var day = ("0"+(now.getDate())).slice(-2);
    	
    	//확인
    	console.log("last6M(): "+year+"-"+month+"-"+day);
	//원하는 날짜형식: yyyy/mm/dd
    	$("#start_date").val(year+"-"+month+"-"+day);
    }
    function ajaxDetail(order_no){
    	console.log()
    	console.log(order_no);
    }
    function ajaxF1(){ //검색버튼 클릭 시
    	// TODO: 유효성검사 해도되고 $("#start_date")")
    	
    	console.log("#start_date: "+$("#start_date"));
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
							 + "<table id='order_detail'><tr><th colspan='2'>상품명</th>"
						     + "<th>수량</th><th>상품금액</th><th>배송비</th><th>진행상태</th></tr>"
    						 
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
      /* 기간별 주문내역 검색 */
      .date{
      margin: 15px 10px;
      padding: 4px;
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
    <div id="order">
  	<!-- 결제정보 -->
  	<!-- 배송정보  -->
    </div>
     <div id="btngroup">
    <input type="submit" class="button" value="목록" id="go_list" onclick="ajaxF1()">
    <input type="button" class="button" value="수정" id="insert_place">
    </div>
</section>
</body>
</html>
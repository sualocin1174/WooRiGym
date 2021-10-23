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
    	$("#cancel").on("click", cancel);//주문취소
    	
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
    			//console.log(data[0].product_name); 참고용
    			if(data!=""){
    				var html = "";
    				for(var i=0; i<data.length;i++){
    					console.log(data[i]);
    					//버튼 태그를 생성할때 <input onclick=f1(order_no)>이런 식으로 order_no를 가져와서~
    				//주문번호, 주문날짜+테이블 제목+내용
    					 html+=  "<h3><a href='orderDetailTable?order_no="+data[i].order_no+"'>"+data[i].order_no+"</a></h3>"
							 + "<h4><a href='./orderTable?order_date='"+data[i].order_date+"'>"+data[i].order_date+"</a></h4>"
							 + "<table id='order_detail'><tr><th colspan='2'>상품명</th>"
						     + "<th>수량</th><th>상품금액</th><th>배송비</th><th>결제상태</th><th>진행상태</th></tr>"
    						 
	    					 //+ "<a href='./orderDetailTable?product_no="+data[i].product_no+"'>"
		    	 			 + "<td><a href='./productTable?product_info_url="+data[i].product_info_url
		    	 			//TODO: 이미지 경로 수정
		    	 			 +"'><img src='./images/1번 메인.jpg'></a></td>"
		    	 			 +"<td><a>"+data[i].product_name+"</a></td>"	  
		    	       		 +"<td>"+data[i].buy_quantity+"</td>"
		    	       		 +"<td>"+data[i].order_total+"</td>"
		    	       		 +"<td>"+data[i].order_cost+"</td>"
		    	       		 +"<td>"+data[i].pay_state+"</td>"
		    	       		 +"<td>"+data[i].order_state+"</td>"
		    	        	 +"</tr>";
    				if(data[i].order_state =='주문완료'){
    					html += "<tr><td colspan='7'><button class='sub-button' id='cancel' onclick='cancel()'>주문취소</button></td></tr></table>";
    				}else if(data[i].order_state =='배송완료'){
    					html += "<tr><td colspan='7'><button class='sub-button' onclick='cinsert(\""+data[i].order_no+"\",\""+data[i].product_name+"\",\""+data[i].order_total+"\",\""+data[i].order_cost+"\")'>교환/환불</button></td></tr></table>";
    				}else {
    					html += "</table>";
    				}
    				}
        		    $("#order").html(html);
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
	//주문 취소 버튼 클릭 시
	function cancel(){
		alert("주문을 취소하시겠습니까?");
		//TODO: 확인 클릭 -> alert("주문이 취소되었습니다."); & 진행상태->'주문취소'로 변경
	};
	
	
	function cinsert(order_no,product_name,order_total,order_cost){
		 location.href="<%=request.getContextPath()%>/cinsert?order_no="+order_no+"&product_name="+product_name+"&order_total="+order_total+"&order_cost="+order_cost;
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
        cursor: pointer;
        background-color: white;
        color: black;
        border: 2px solid #DFE0DF;
        border-radius: 5px;
        }

        .button:hover {
            background-color: #DFE0DF;
        }
		/* 검색 버튼 */
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
      
       #order h3, #order h4 {
       padding-bottom: 5px;
       }
       /* 주문일자 */
       #order h4 {
       margin: 0 0 10px 0;
       }
       
       /* 주문내역 테이블 */
      	table#order_detail{
		  width: 900px;
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
      	/* 취소/교환/환불 버튼 */
      	.sub-button{
      	border: 2px solid #BDBDBD;
      	text-align: center;
      	background: white;
      	cursor: pointer;
      	padding: 5px;
        text-decoration: none;
		border-radius: 5px;
      	}
      	.sub-button:hover {
      	border: 2px solid #FEA500;
      	background: #FEA500;
      	color: white;
      	}
 
      	/* 페이징 버튼 */
      	#pageview{
      	text-align: center;
      	}
      	#pageview a{
      	padding: 4px 8px;
      	background: #2F4858;
      	color: white;
      	}
      	#pageview a:hover{
      	background: #FEA500;
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
    <h3>조회 기간</h3>
    <!-- 달력 -->
     <div id="btngroup">
    <input type="date" id="start_date" class="date">
    <input type="date" id="end_date" class="date">
   <!-- 기간 선택 버튼 -->
    <input type="button" class="button" value="1주일" id="1week">
    <input type="button" class="button" value="1개월" id="1month">
    <input type="button" class="button" value="3개월" id="3month">
    <input type="button" class="button" value="6개월" id="6month">
    <br>
    <input type="submit" class="button" value="검색" id="order_search" onclick="ajaxF1()">
    </div>
    <div id="order">
  	<!-- 주문번호, 주문일자 -->
  	<!-- 상품이미지, 상품명, 수량, 상품금액, 배송비, 주문상태  -->
    </div>
    <div id="pageview">
    <!-- 서블릿 -> 서비스-> Dao -> DB-> jsp 순으로 오기때문에 이미 데이터를 갖고있으니
    서블릿에서 정의한 endPage, startPage 등 용어 사용 가능 -->
    <script>
    console.log("시작 페이지: "+<%=request.getAttribute("startPage") %>);
    console.log("마지막 페이지"+<%=request.getAttribute("endPage") %>);
    </script>
   <c:if test=" ${startPage} > 1 " >
	이전
	</c:if>
	<c:forEach begin="${startPage}"  end="${endPage}" step="1" var="i">
		<a href="./orderlist?pagenum=${i}"> ${i} </a>
		<c:if test="${i} != ${endPage}">
			,
		</c:if>
	</c:forEach>
	<c:if test=" ${endPage} < ${pageCount}" >
	다음
	</c:if>
    </div>
</section>
</body>
</html>
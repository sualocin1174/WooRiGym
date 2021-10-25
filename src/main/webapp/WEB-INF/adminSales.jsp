<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 매출관리</title>
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

</script>
<style>
section {
                width: 900px;
                padding: 0 0 30px 0;
                position: relative;
		        bottom: 250px;
		        left: 260px;
            }
aside{
	        display: inline-block;
			 padding: 30px 0 0 30px;
			 }
		 	#side-menu>ul>li{
		        padding: 5px;
		        list-style-type: none;
		     }
		     /* 메인페이지 폰트 크게 */
		    #side-menu>ul>li:first-child{
		         font-size: 25px;
		    }
		    input{
			border: 2px solid #e7e7e7;
			}
			input,
			.btn {
			  padding: 8px;
			  border-radius: 4px;
			  margin: 5px 0;
			  opacity: 0.85;
			  display: inline-block;
			  font-size: 17px;
			  line-height: 20px;
			  text-decoration: none;
			}
			input:hover,
			.btn:hover {
			  opacity: 1;
			}
			/*검색, 추가, 수정, 삭제 버튼*/
			.button{
	        padding: 5px;
	        text-align: center;
	        text-decoration: none;
	        font-size: 16px;
	        margin: 5px;
	        transition-duration: 0.3s;
	        cursor: pointer;
	        background-color: white;
	        color: black;
	        border: 2px solid #e7e7e7;
	        }

	        .button:hover {
	            background-color: #e7e7e7;
	        }
	        #btngroup{
      	 	 text-align: center;
         	 margin-bottom: 20px;
      }
</style>
</head>
<body>
	<!-- 공통헤더 템플릿 -->
 	<%@ include file="admin_header.jsp"%>
 	<aside>
		<div id="side-menu">
     	<ul>
        	<li>메인페이지</li>
         	<li><a href="amain">상품관리</a></li>
         	<li><a href="apupage">팝업공지</a></li>
         	<li><a href="asales">매출관리</a></li>
         	<li><a href="#">주문내역 확인</a></li>
         	<li><a href="#">배송현황 관리</a></li>
         	<li><a href="#">교환/반품/환불 승인</a></li>
         	<li><a href="#">Q&A 문답관리</a></li>
     	</ul>
 	</div>
	</aside>
	
 	<section>
 	<h2>매출관리</h2>
 	<!-- 달력 -->
 	 <div id="btngroup">
    <input type="date" name="start_date" id="start_date" class="date">
    <input type="date" name="end_date" id="end_date" class="date">
   <!-- 기간 선택 버튼 -->
    <input type="button" class="button" value="1주일" id="1week">
    <input type="button" class="button" value="1개월" id="1month">
    <input type="button" class="button" value="3개월" id="3month">
    <input type="button" class="button" value="6개월" id="6month"><br><br>
    <input type="button" class="button" value="조회" id="search">
    <br>
    </div>
 	</section>
 	<script>
 		$("#search").click(searchF1);
	
 		function searchF1(){
 			$.ajax({
 				type:"post",
 				url:"<%=request.getContextPath()%>/asales",
 				data:{
 					start_date : $("#start_date").val(),
 					end_date : $("end_date").val()
 				},
 				dataType:"json",
 				success : function(data){
 					
 				}
 			});
 		}
 		
 	</script>
</body>
</html>
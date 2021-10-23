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
<title>교환/반품 신청폼</title>
<style>
 section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         bottom: 170px;
         left: 260px;
     }
       /* 교환/반품 신청 */
      section > h2 {
          margin-bottom: 50px;
          text-align: center;
      }
      /* 신청서 작성 테이블 */
      	.step1 {
		  width: 850px;
          margin-bottom: 30px;
          border-top: 1px solid black;
          border-bottom: 1px solid black;
        }
      	.step1 th{
      	padding: 10px;
      	border-right: 1px solid black;
      	}
      	.step1 tr:first-child>td, .step1 tr:first-child>th {
      	padding: 22px 10px 22px 10px;
      	border-bottom: 1px solid #BDBDBD;
      	}
        .step1 td {
        padding: 22px;
      	}
      	.step1 tr:nth-of-type(9)>td, .step1 tr:nth-of-type(2)>th {
      	padding: 22px;
      	border-bottom: 1px solid #BDBDBD;
      	}
      	/* 배송지목록 버튼 */
      	.button{
        padding: 3px 8px;
        text-align: center;
        text-decoration: none;
        font-size: 1rem;
        margin: 25px 10px;
        transition-duration: 0.2s;
        cursor: pointer;
        background-color: white;
        color: dodgerblue;
        border: 2px solid dodgerblue;
        border-radius: 5px;
        }
        .button:hover {
        background-color: dodgerblue;
        color: white;
        }
      	
      	/* 다음 단계 버튼 */
      	#btngroup{
          text-align: center;
          margin-bottom: 20px;
      }
      	.nextbtn{
        padding: 5px 25px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        margin: 25px 10px;
        transition-duration: 0.2s;
        cursor: pointer;
      	background: #006572;
      	color: white;
        border-radius: 5px;
        }

        .nextbtn:hover {
            background: #FEA500;
            color: white;
        }
         /* 체크박스 */
        .container {
	  display: block;
	  position: relative;
	  padding-left: 35px;
	  margin-bottom: 12px;
	  cursor: pointer;
	  font-size: 1rem;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	/* Hide the browser's default radio button */
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	}
	/* 새로 만든 라디오 버튼 */
	.checkmark {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 20px;
	  width: 20px;
	  background-color: #eee;
	  border-radius: 50%;
	}
	/* On mouse-over, add a grey background color */
	.container:hover input ~ .checkmark {
	  background-color: #ccc;
	}
	/* When the radio button is checked, add a blue background */
	.container input:checked ~ .checkmark {
	  background-color: dodgerblue;
	}
	/* Create the indicator (the dot/circle - hidden when not checked) */
	.checkmark:after {
	  content: "";
	  position: absolute;
	  display: none;
	}
	/* Show the indicator (dot/circle) when checked */
	.container input:checked ~ .checkmark:after {
	  display: block;
	}
	/* Style the indicator (dot/circle) */
	.container .checkmark:after {
	 	top: 6px;
		left: 6px;
		width: 8px;
		height: 8px;
		border-radius: 50%;
		background: white;
	}
</style>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	<%@ include file="template_header.jsp"%>
	<!--마이페이지 공통사이드 템플릿 -->
 	<%@ include file="template_mypage_aside.jsp"%>
<section>
	<h2>교환/반품 신청</h2>
	
	<table class="step1">
		<tr>
	    <th>상품명</th>
	    <td>${product_name}</td>
		</tr>
		<tr>
			<th rowspan='8'>교환/반품 사유<br>(택1)</th>
			<td><label class="container" for="reason1"><input type='radio' checked="checked" name="why" id="reason1">품질 불만<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason3"><input type='radio' name="why" id="reason3">필요 없어짐<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason2"><input type='radio' name="why" id="reason2">구성품이 누락됨<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason4"><input type='radio' name="why" id="reason4">상품이 설명과 다름<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason5"><input type='radio' name="why" id="reason5">상품이 파손됨<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason6"><input type='radio' name="why" id="reason6">오배송<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason7"><input type='radio' name="why" id="reason7">배송 중 분실<span class="checkmark"></span></label></td></tr>
		<tr><td><label class="container" for="reason8"><input type='radio' name="why" id="reason8">그 외 기타<span class="checkmark"></span></label></td></tr>
		
		<tr>
			<th rowspan='2'>교환/반품 선택</th>
			<td><label class="container" for="exchange"><input type='radio' name='choice' value="exchange" id="exchange">교환<span class="checkmark"></span></label></td></tr>
			<tr><td><label class="container" for="refund"><input type='radio' name='choice' value="refund" id="refund">반품<span class="checkmark"></span></label></td>
		</tr>
</table>
<div id="second_depth">
</div>
<p id="a1" style="display:none">${order_total}</p>
<p id="a2" style="display:none">${order_cost}</p>

<!-- 배송지 Modal Box -->
            <div class="modal">
              <div class="modal-content">
                    <span class="close">&times;</span> <!-- 닫기 -->
                     <h3>배송지 목록</h3>
                     <br>
                     <table class="modal-address">
                        <!-- 배송지 목록 -->
                     </table>
              </div>
          </div>
<script>
	$("input[name='choice']").change(function(){
	var exchange ='';
	var refund ='';
		//console.log($("input[name='choice']:checked").val());
		console.log($(this).val());
		console.log("choice 이벤트 잘 들어갔니~")
		
		var choice = $(this).val();
		if(choice=="exchange"){ 
		exchange+= "<table><tr><th>상품 회수 주소</th><td><button onclick='showlist()' id='address_list' class='button'><p>배송지 목록</p></button></td>";
		exchange+="</tr><tr><th>회수 시 요청사항</th><td><textarea></textarea></td></tr>";
		exchange+="<tr><th>회수 예정일</th><td></td></tr></table>";
		
			$("#second_depth").html(exchange);
		} else if(choice=="refund") {
			var a1_val = $("#a1").html();
			var a2_val = $("#a2").html();
		console.log(a1_val);
		console.log(a2_val);
			
			refund+= "<table><tr><th>상품 회수 주소</th><td><button onclick='showlist()' id='address_list' class='button'><p>배송지 목록</p></button></td>";
			refund+="</tr><tr><th>회수 시 요청사항</th><td><textarea></textarea></td></tr>";
			refund+="<tr><th>회수 예정일</th><td></td></tr></table>";
			refund+="<h3>환불 정보</h3><table><tr><th>상품 금액</th><td>"+a1_val+"원</td></tr>";
			refund+="<tr><th>배송비</th><td>"+a2_val+"원</td></tr><tr><th>반품비</th><td>원</td></tr>";
			refund+="<tr><th>환불 예상 금액</th><td>원</td></tr></table>";
			$("#second_depth").html(refund);
			
		}
		
	});
	
	function ajaxA1(){
		$.ajax({
    		type: "post",
    		url: "<%=request.getContextPath()%>/cinsert",
    		data: { //화면에서 쓰일 데이터 = where절에 쓰임. user_id도 서블릿에서 알고 있으니 data 보낼게 없다.
    		},
    		dataType: "json", //전달받을 객체는 json이다.
    		success: function(data){
		var html ="";
    			console.log(data);
    			console.log(data.length);
    			html+= "<button id='submit_address' onclick='submitA1()'>제출</button>";
    		for(var i=0;i<data.length;i++){
    			//TODO 우편번호: 기본주소: 상세주소:
    			html+= "<tr><td>"+data[i].postcode+"</td><td><input type='radio' name='address_choice' value='"+data[i].postcode+"'></td></tr>"
    			html+= "<tr><td>"+data[i].basic_address+"</td></tr>"
    			html+= "<tr><td>"+data[i].detail_address+"</td></tr>"
    		} //TODO: 이 주소들을 어느 테이블에 저장할지? 백건호님께 물어보기.
    		$(".modal-address").html(html);
    		},
    		
    		error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+
    					"\n"+"error:"+error);
    		}
    	});
	};
	function showlist(){
		  $(".modal").show(); 
			console.log("ajax 시작show");
			ajaxA1(); //이벤트함수 호출
	}
   
     $(".close").click(function(){
        $(".modal").hide(); 
     });
     $(window).on("click",function(e){
         console.log(e.target); 
         //방법 1
         //if(e.target == document.getElementById("modal-01")){};
         //방법 2
         if(e.target == $(".modal").get(0)){
             $(".modal").hide();
         }
     });
    function submitA1(){
    	//postcode
    	var postcode = $("input[name='address_choice']:checked").val();
    }
	
</script>

<!-- 3단계 -->
<h3>교환/반품 신청이 접수되었습니다.</h3>
<p>상품 회수 정보: 서울시 성동구 XX동</p>
<h3>회수 요청사항: 부재시 문 앞</h3>
<h3>상품 회수일: 9월 22일(수)</h3>

<div id="btngroup">
<a href="#" class="nextbtn">이전 단계</a>
<!--  <a href="#" class="nextbtn">다음 단계</a> -->
<a href="#" class="nextbtn">신청하기</a>
<!-- 신청완료 페이지 버튼 -->
<a href="#" class="nextbtn">목록</a>
</div>
</section>
</body>
</html>
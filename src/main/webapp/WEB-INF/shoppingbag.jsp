<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_footer.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
  String user_name = (String)request.getAttribute("user_name");
  %>
  <%
    UserTable user = (UserTable)session.getAttribute("loginSS");
  %>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>우리짐 장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
	    /* reset */
	    * {
	        margin: 0;
	        padding: 0;
	    }
	    body{
	    font-family: 'Noto Sans KR', sans-serif;
		}
	    section {
         width: 900px;
         padding: 0 0 30px 0;
         position: relative;
         top: 20px;
         left: 170px;
     }
	    /* 장바구니 테이블*/
	    #bag_table{
	     width: 950px;
          text-align: center;
          margin: 15px 0 15px 0;
          border: 1.5px solid black;
          border-collapse: collapse;
	    }
	    #bag_table th{
      	padding: 10px;
      	}
        #bag_table td {
        padding: 16px;
      	}
	   	 #bag_table img{
          width: 80px;
          height: 80px;
      	}
      	#bag_price{
      	width: 400px;
      	margin: 25px 0 25px 0;
      	}
      	/*버튼*/
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
        border: 2px solid #555555;
        border-radius: 5px;
        }
        .button:hover {
        background-color: #555555;
        color: white;
        }
        /* 옵션변경 버튼 */
        #btnoption {
        margin: 5px 0 2px 0;
        border: 2px solid #DFE0DF;
        background-color: #DFE0DF;
        padding: 2px;
        cursor: pointer;
        }
        #btnoption:hover {
        border: 2px solid #555555;
        background-color: #555555;
        color: white;
        }
        
	</style>
	<!-- 2021.10.19 내용삭세 시작 -->
	<!-- <script>
		/* 2021.10.14 1차 내용수정 시작 */
		function allCheckFunc( obj ) {
				$("[name=subCB]").prop("checked", $(obj).prop("checked") );
		}
	
		/* 체크박스 체크시 전체선택 체크 여부 */
		function oneCheckFunc( obj ) {
			var allObj = $("[name=mainCB]");
			var objName = $(obj).attr("name");
	
			if( $(obj).prop("checked") ) {
				checkBoxLength = $("[name="+ objName +"]").length;
				checkedLength = $("[name="+ objName +"]:checked").length;
	
				if( checkBoxLength == checkedLength ) {
					allObj.prop("checked", true);
				} else {
					allObj.prop("checked", false);
				}
			} else {
				allObj.prop("checked", false);
			}
		}
	
		$(function(){
			$("[name=mainCB]").click(function(){
				allCheckFunc( this );
			});
			$("[name=subCB]").each(function(){
				$(this).click(function(){
					oneCheckFunc( $(this) );
				});
			});
		});
		/* 2021.10.14 1차 내용수정 완료 */
	</script> -->
	<!-- 2021.10.19 내용삭세 완료 -->
</head>
<body>
<!-- 공통헤더 템플릿 -->
<%@ include file="template_header.jsp"%>
<section>
	<div id="" style="display: none"></div>
	<form id="form1" name="form1" method="post">
	<h2>장바구니</h2>
	    <!-- 2021.10.19 1차 내용삭제 시작 -->
	    <div id="sblist"></div>
	    <!-- <table border="1" width="100%" id="test"> -->
	    	<%-- <c:forEach var="cartlist" items="${cartTableVolist}"> --%> <!-- 2021.10.15 1차 내용삭제 -->
	    	<!-- 2021.10.15 2차 내용추가 시작 -->
		        <!-- <tr>
		        	<th style="display: none">장바구니번호</th>
		        	<th width="10%"><input type ="checkbox" name="mainCB" id="mainCB"> 체크박스</th> 2021.10.13 1차 내용수정 id값 추가
		            <th width="50%">상품명/옵션</th>
		            <th width="5%">수량</th>
		            <th width="10%">상품금액</th>
		            <th width="10%">적립금</th>
		            <th width="15%">배송비</th>
		        </tr> -->
		        <!-- <tr id="test"> -->
		        	<!-- <td><input type ="checkbox" name="subCB" id="subCB"></td> --> <!-- 2021.10.13 1차 내용수정 id값 추가 -->
		        	
		        	<!-- <td id="test1" style="display: none"></td>
		        	<td id="test2"></td>
		        	<td id="test3"></td>
		        	<td id="test4"></td>
		        	<td id="test5"></td>
		        	<td id="test6"></td>
		        	<td id="test7"></td> -->
		        	<!-- 2021.10.15 2차 내용추가 완료 -->
		            <!-- 2021.10.15 1차 내용삭제 시작 -->
		            <%-- <td>${cartlist.productName}<br>${cartlist.productOption}</td>
		            <td>${cartlist.cartQuantity}</td>
		            <!-- <fmt:formatNumber value="" pattern="#,###,###"/> -->
		            <td>${cartlist.price}</td>
		            <td>${cartlist.price*0.05}</td>
		            <td>배송비</td> --%>
		            <!-- 2021.10.15 1차 내용삭제 종료 -->
		        <!-- </tr> -->
	        <%-- </c:forEach> --%>  <!-- 2021.10.15 1차 내용삭제 -->
	    <!-- </table> -->
	    <!-- 2021.10.19 1차 내용삭제 완료 -->
	    <%-- <c:if test=${${userId != null}}></c:if> --%>
	    <%-- <script>
	   	console.log("시작 페이지: "+<%=request.getAttribute("startPage") %>);
    	console.log("마지막 페이지"+<%=request.getAttribute("endPage") %>);
    	</script>
	   <c:if test=" ${startPage} > 1 " >
			이전
		</c:if>
		<c:forEach begin="${startPage}"  end="${endPage}" step="1" var="i">
			<a href="./sblist.ajax?pagenum=${i}"> ${i} </a>
			<c:if test="${i } != ${endPage}">
				,
			</c:if>
		</c:forEach>
		<c:if test=" ${endPage} < ${pageCount}" >
			다음
		</c:if> --%>
	    <!-- <table>
	        <tr>
	            <td align="right">
	                장바구니 금액 합계 :
	                <br>
	                배송료 : <br>
	                총합계 : 
	            </td>
	        </tr>
	    </table>   -->              
	    <button type="button" class="button" id="btnSelectBuy">선택구매</button>
	    <button type="button" class="button" id="btnSelectDelete">선택삭제</button>
	    <button type="button" class="button" id="btnAllBuy">전체구매</button>
	    <button type="button" class="button" id="btnAllDelete">전체삭제</button>
	</form>
</section>
<footer>
	<%@ include file="template_footer.jsp"%>
</footer>
	<input type="text" id="cartnolist" style="display: none;">
	<script type="text/javascript">
    	$(document).ready(ajaxf1);
    	function ajaxf1() {
    		
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/sblist.ajax",
				async: false,
				data : {
					//'page' : pagenum
				},
				dataType : "json", // 전달받을 객체는 JSON 이다.
				// 2021.10.15 2차 내용추가 시작
				// 2021.10.19 1차 내용추가 및 수정 시작
				success: function(data){
					// console.log(data);
					resultHtml(data);
					// let str = JSON.stringify(data.cartTableVolist); // <> parse()
					// alert(str);
					// var key = Object.keys(data["cartTableVolist"][0]);
					// alert(key);
					/* $.each(data.cartTableVolist, function(i, cartlist) { // 데이터 = cartlist에 담음
						$("#test1").append(cartlist.cartNo+" ");
						$("#test2").append("<input type ='checkbox' name='subCB' id='subCB'>");
						$("#test3").append(cartlist.productName+"<br>"+cartlist.productOption + " ");
						$("#test4").append(cartlist.cartQuantity+"개");
						$("#test5").append(cartlist.price+"원");
						$("#test6").append(cartlist.price*0.05+"원"); */
						/* $("#test").append("<td style='display: none'>"+cartlist.cartNo+"</td>");
						$("#test").append("<input type ='checkbox' name='subCB' id='subCB'>");
						$("#test").append("<td>"+cartlist.productName+"<br>"+cartlist.productOption+"</td>");
						$("#test").append("<td>"+cartlist.cartQuantity+"개</td>");
						$("#test").append("<td>"+cartlist.price+"원/<td>");
						$("#test").append("<td>"+cartlist.price*0.05+"원</td>"); */
						// console.log(cartlist);
					// });
					// var key = Object.keys(data["orderCost"][0]);
					// alert(key);
					// $.each(data.orderCost, function(i, ordercost) {
						// $("#test7").append(ordercost.ordercost);
						// $("#test").append("<td>"+ordercost.ordercost+"</td>");
						// 2021.10.15 2차 내용추가 완료
					// });
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
				});
			}
    	function resultHtml(data){
			var html="<table border='1' width=100% id='bag_table'>";
			html += "<tr>";
			html += "<th style='display: none'>장바구니번호</th>";
			html += "<th width='10%'><input type ='checkbox' name='mainCB' id='mainCB'> 체크박스</th>";
			// html += "<th style='display: none' width='10%'><input type ='hidden' name='mainCB' id='mainCB_hidden'> 체크박스</th>";
			html += "<th colspan='2' width='50%'>상품명/옵션</th>";
			html += "<th width='8%'>수량</th>";
			html += "<th width='10%'>상품금액</th>";
			html += "<th width='10%'>적립금</th>";
			html += "<th width='15%'>배송비</th>";
			html += "</tr>";
				
			$.each(data.cartTableVolist, function(i, cartlist){
				html += "<tr>";
				html += "<td style='display: none'>" + cartlist.cartNo + "</td>";
				html += "<td><input type ='checkbox' name='subCB' value="+cartlist.cartNo+" class='subCB'></td>";
				// html += "<td style='display: none'><input type ='hidden' name='subCB' value='0' id='subCB_hidden'></td>";
				html += "<td><img src='./images/1번 메인.jpg'></td>"; 
				html += "<td>" + cartlist.productName+"<br>"+cartlist.productOption + "<br></td>";
				html += "<td>" + cartlist.cartQuantity + "개</td>";
				html += "<td>" + cartlist.price*cartlist.cartQuantity + "원</td>";
				html += "<td>" + (cartlist.price*cartlist.cartQuantity)*0.05 + "원</td>";
				html += "<td>" + cartlist.ordercost + "</td>";
				html += "</tr>";
			});
			html += "</table>";
			var costhtml = "<table id='bag_price'>"
			//$.each(data.cartTableVolist, function(i, cartlist){
				costhtml += "<tr align='right'>"
				costhtml += "<tr><td>장바구니 금액 합계 : </td><td name='bprice' id='bprice'>0원</td></tr>"
				costhtml += "<tr><td>배송료 : </td><td name='dprice' id='dprice'>0원</td></tr>"
				costhtml += "<tr><td>총합계 : </td><td name='totalprice' id='totalprice'>0원</td></tr>"
				costhtml += "</tr></table>" 
			//});
	    	$("#sblist").empty(); 
			$("#sblist").append(html);
			$("#sblist").append(costhtml);
	
			$("[class=subCB]").click(oneCheckFunc);
			
			$("[name=mainCB]").click(allCheckFunc);
			
			function allCheckFunc() {
			var bprice = 0;
			var dprice = 0;
				$("[name=subCB]").prop("checked", $(this).prop("checked") );
			    $("[name=subCB]:checked").each(function(){
					// console.log(this);
					// console.log($(this).parent().next().next().next().text());
					var priceText = $(this).parent().next().next().next().next().text();
					priceText = priceText.substring(0,priceText.length-1);
					// console.log(priceText);
					var thisPrice = priceText*1;
					bprice += thisPrice;
					dprice = ((bprice < 100000) ? 2500 : 0);
				});
				$("#bprice").html(bprice+"원");
				$("#dprice").html(dprice+"원");
				$("#totalprice").html(bprice+dprice+"원");
			}
	
			/* 체크박스 체크시 전체선택 체크 여부 */
			function oneCheckFunc( obj ) {
				// console.log("oneCheckFunc");
				// console.log(obj);
				
				//console.log($(this).parents().children().eq(5).html().replace("원",""));
				var allObj = $("[name=mainCB]");
				var objName = $(obj).attr("name");
		
				if( $(obj).prop("checked") ) {
					checkBoxLength = $("[name="+ objName +"]").length;
					checkedLength = $("[name="+ objName +"]:checked").length;
		
					if( checkBoxLength == checkedLength ) {
						allObj.prop("checked", true);
					} else {
						allObj.prop("checked", false);
					}
				} else {
					allObj.prop("checked", false);
				}
				
			//var totalnum = 1 * $("#bprice").append($(this).parents().children().eq(5).html().replace("원","");
   
				// console.log("ssss:"+ $("[name=subCB]:checked"));
				var bprice = 0;
				var dprice = 0;
			    $("[name=subCB]:checked").each(function(){
					// console.log(this);
					// console.log($(this).parent().next().next().next().text());
					var priceText = $(this).parent().next().next().next().next().text();
					priceText = priceText.substring(0,priceText.length-1);
					// console.log(priceText);
					var thisPrice = priceText*1;
					bprice += thisPrice;
					dprice = ((bprice < 100000) ? 2500 : 0);
				});
				$("#bprice").html(bprice+"원");
				$("#dprice").html(dprice+"원");
				$("#totalprice").html(bprice+dprice+"원");
				
			}
		


		}
    </script>
    <!-- 2021.10.24 내용추가 시작 -->
    <!-- 장바구니 선택구매 -->
   	<script>
   	$("#btnSelectBuy").click(sbuy);
	var sBuyList = [];
	function sbuy(){
		// alert($("[name=subCB]:checked").val());
		if($("[name=subCB]:checked").val() == undefined) {
			alert("구매할 품목을 체크해주세요.");
			return;
		}
		selectBuy();
		ajaxsbuy();
	}
	
	function selectBuy() {
		// console.log("장바구니 번호 : "+$("[class=subCB]:checked").val());
		$("[name=subCB]:checked").each(function(){
			// console.log("장바구니번호2 : "+$("[name=subCB]:checked"));
			sBuyList.push($(this).val());
			// console.log(sDeleteList.push($(this).val()));
		});
  		console.log("배열에 담겨진 값1 : "+sBuyList);
  		var newsBuyList = [];
  		newsBuyList = sBuyList.filter(function(item){
       		return item !== "";
       	});
  		
  		$("#cartnolist").val(newsBuyList);
  		console.log(typeof newsBuyList);
	}
	
	
  	function ajaxsbuy(){
 		console.log($("#cartnolist").val());
		console.log("테스트2 : "+$("[name=subCB]:checked").val());
  		// console.log("배열에 담겨진 값5 : "+newsDeleteList);
  		console.log("배열에 담겨진 값2 : "+$("#cartnolist").val());
   		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/sbtopo.ajax",
			data : {
				// cartNo : $("[name=subCB]:checked").val()
				cartNo : $("#cartnolist").val()
			},
			dataType : "json", // 전달받을 객체는 JSON 이다.
			success: function(data){
				alert("선택상품 결제페이지로 이동합니다.");
				window.location.href = "/wooRiGym/order";
			},
			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
			}
		});
		location.reload(); // 페이지 새로고침
   	};
    </script>
    
    <!-- 장바구니 전체구매 -->
   	<script>
   	$("#btnAllBuy").click(ajaxf4);
    	function ajaxf4() {
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/abtopo.ajax",
				async: false,
				data : {
					userId : "<%=user.getUser_id()%>"
				},
				dataType : "json", // 전달받을 객체는 JSON 이다.
				success: function(data){
					alert("전체상품 결제페이지로 이동합니다.");
					window.location.href = "/wooRiGym/order";
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
				}
			});
			location.reload(); // 페이지 새로고침
    	}
    </script>
    <!-- 2021.10.24 내용추가 완료 -->
   	<!-- 장바구니 전체삭제 -->
   	<script>
    	// 2021.10.20 1차 내용수정 시작
	  	$("#btnAllDelete").click(ajaxf2);
    	function ajaxf2() {
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/sbdelete.ajax",
				async: false,
				data : {
					userId : "<%=user.getUser_id()%>"
				},
				dataType : "json", // 전달받을 객체는 JSON 이다.
				success: function(data){
					alert("전체삭제가 완료되었습니다.");
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
				}
			});
			location.reload(); // 페이지 새로고침
    	}
    	// 2021.10.20 1차 내용수정 완료
	// 2021.10.19 1차 내용추가 및 수정 시작
    </script>
   	<!-- 2021.10.21 1차 내용추가 시작 -->
    <!-- 장바구니 선택삭제 -->
   	<script>
   	$("#btnSelectDelete").click(sdelete);
	var sDeleteList = [];
	function sdelete(){
		// alert($("[name=subCB]:checked").val());
		if($("[name=subCB]:checked").val() == undefined) {
			alert("삭제할 품목을 체크해주세요.");
			return;
		}
		selectDelete();
		ajaxsdelete();
	}
	
	function selectDelete() {
		// console.log("장바구니 번호 : "+$("[class=subCB]:checked").val());
		$("[name=subCB]:checked").each(function(){
			// console.log("장바구니번호2 : "+$("[name=subCB]:checked"));
			sDeleteList.push($(this).val());
			// console.log(sDeleteList.push($(this).val()));
		});
  		console.log("배열에 담겨진 값1 : "+sDeleteList);
  		var newsDeleteList = [];
  		newsDeleteList = sDeleteList.filter(function(item){
       		return item !== "";
       	});
  		
  		$("#cartnolist").val(newsDeleteList);
  		console.log(typeof newsDeleteList);
	}
	
	
  	function ajaxsdelete(){
 		console.log($("#cartnolist").val());
		console.log("테스트2 : "+$("[name=subCB]:checked").val());
  		// console.log("배열에 담겨진 값5 : "+newsDeleteList);
  		console.log("배열에 담겨진 값2 : "+$("#cartnolist").val());
   		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/sbsdelete.ajax",
			async: false,
			data : {
				// cartNo : $("[name=subCB]:checked").val()
				cartNo : $("#cartnolist").val()
			},
			dataType : "json", // 전달받을 객체는 JSON 이다.
			success: function(data){
				alert("선택삭제가 완료되었습니다.");
				console.log(data);
			},
			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+
				"\n"+"error:"+error);
			}
		});
		location.reload(); // 페이지 새로고침
   	};
    </script>
   	<!-- 2021.10.21 1차 내용추가 시작 -->
</body>
</html>

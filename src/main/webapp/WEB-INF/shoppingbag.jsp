   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
  String user_name = (String)request.getAttribute("user_name");
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
	    
	       /* 공통헤더에 있던 부분인데 css로 따로 빼면 적용이 안되서 reset에 포함 */
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
	    }
	    /* 로그인 후: OOO님 | 로그아웃 | 마이페이지 | 장바구니 | 최근본상품 */
	    #main_tnb2 li::after {
	        padding-left: 10px;
	        content: "|";
	    }
	    #main_tnb2 li:last-child::after {
	        padding-left: 10px;
	        content: "";
	    }
	     /* 공통헤더~reset에 포함  끝*/
	</style>
	<script>
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
	</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<%@ include file="template_header.jsp"%>

	<div id="" style="display: none"></div>
	<h2>장바구니</h2>
	<form id="form1" name="form1" method="post">
	    <table border="1" width="100%">
	    	<%-- <c:forEach var="cartlist" items="${cartTableVolist}"> --%> <!-- 2021.10.15 1차 내용삭제 -->
	    	<!-- 2021.10.15 2차 내용추가 시작 -->
		        <tr>
		        	<th style="display: none">장바구니번호</th>
		        	<th width="10%"><input type ="checkbox" name="mainCB" id="mainCB"> 체크박스</th> <!-- 2021.10.13 1차 내용수정 id값 추가 -->
		            <th width="50%">상품명/옵션</th>
		            <th width="5%">수량</th>
		            <th width="10%">상품금액</th>
		            <th width="10%">적립금</th>
		            <th width="15%">배송비</th>
		        </tr>
		        <tr id="test">
		        	<!-- <td><input type ="checkbox" name="subCB" id="subCB"></td> --> <!-- 2021.10.13 1차 내용수정 id값 추가 -->
		        	
		        	<td id="test1" style="display: none"></td>
		        	<td id="test2"></td>
		        	<td id="test3"></td>
		        	<td id="test4"></td>
		        	<td id="test5"></td>
		        	<td id="test6"></td>
		        	<td id="test7"></td>
		        	<!-- 2021.10.15 2차 내용추가 완료 -->
		            <!-- 2021.10.15 1차 내용삭제 시작 -->
		            <%-- <td>${cartlist.productName}<br>${cartlist.productOption}</td>
		            <td>${cartlist.cartQuantity}</td>
		            <!-- <fmt:formatNumber value="" pattern="#,###,###"/> -->
		            <td>${cartlist.price}</td>
		            <td>${cartlist.price*0.05}</td>
		            <td>배송비</td> --%>
		            <!-- 2021.10.15 1차 내용삭제 종료 -->
		        </tr>
	        <%-- </c:forEach> --%>  <!-- 2021.10.15 1차 내용삭제 -->
	    </table>
	    <%-- <c:if test=${${userId != null}}></c:if> --%>
	   <%--  <c:if test=" ${startPage} > 1 " >
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
	    <table>
	        <tr>
	            <td align="right">
	                장바구니 금액 합계 :
	                <br>
	                배송료 : <br>
	                총합계 : 
	            </td>
	        </tr>
	    </table>                
	    <button type="button" id="btnSelectDelete">선택구매</button>
	    <button type="button" id="btnSelectDelete">선택삭제</button>
	    <button type="button" id="btnAllDelete">전체구매</button>
	    <button type="button" id="btnAllDelete">전체삭제</button>
	</form>
	<script>
		<%-- $(document).ready(function(){
	        $.ajax({
	            type : "post",
	            url : "<%=request.getContextPath()%>/sblist.ajax",
	            dataType : "text",
	            error : function(){
	                alert('통신실패!!');
	            },
	            success : function(data){
	                alert("통신데이터 값 : " + data) ;
	                $("#dataArea").html(data) ;
	            }
	        });
	    }); --%>
	
	    
    	$(document).ready(ajaxf1);
    	function ajaxf1() {
    		
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/sblist.ajax",
				data : {
					pagenum : 1,
				},
				dataType : "json", // 전달받을 객체는 JSON 이다.
				// 2021.10.15 2차 내용추가 시작
				success: function(data){
					console.log(data);
					// let str = JSON.stringify(data.cartTableVolist); // <> parse()
					// alert(str);
					// var key = Object.keys(data["cartTableVolist"][0]);
					// alert(key);
					$.each(data.cartTableVolist, function(i, cartlist) { // 데이터 = cartlist에 담음
						$("#test1").append(cartlist.cartNo+" ");
						$("#test2").append("<input type ='checkbox' name='subCB' id='subCB'>");
						$("#test3").append(cartlist.productName+"<br>"+cartlist.productOption + " ");
						$("#test4").append(cartlist.cartQuantity+"개");
						$("#test5").append(cartlist.price+"원");
						$("#test6").append(cartlist.price*0.05+"원");
						/* $("#test").append("<td style='display: none'>"+cartlist.cartNo+"</td>");
						$("#test").append("<input type ='checkbox' name='subCB' id='subCB'>");
						$("#test").append("<td>"+cartlist.productName+"<br>"+cartlist.productOption+"</td>");
						$("#test").append("<td>"+cartlist.cartQuantity+"개</td>");
						$("#test").append("<td>"+cartlist.price+"원/<td>");
						$("#test").append("<td>"+cartlist.price*0.05+"원</td>"); */
						// console.log(cartlist);
					});
					// var key = Object.keys(data["orderCost"][0]);
					// alert(key);
					$.each(data.orderCost, function(i, ordercost) {
						$("#test7").append(ordercost.ordercost);
						// $("#test").append("<td>"+ordercost.ordercost+"</td>");
						// 2021.10.15 2차 내용추가 완료
					});
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+
					"\n"+"error:"+error);
					}
			});
		}
    	
    </script>
</body>
</html>
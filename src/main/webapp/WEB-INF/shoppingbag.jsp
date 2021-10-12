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
		$(function(){
		
		    $("#btnList").click(function(){
		    	/* TODO */
		        /* location.href="${path}/shop/product/list.do"; */
		    });
		
		     // 아래쪽에서 btnlist를 호출해서 실행되는 function() 함수 구문.
		     // list로 가는 링크를 만든다.
		
		    $("#btnDelete").click(function(){
		        if(confirm("장바구니를 비우시겠습니까?")){
			    	/* TODO */
		            /* location.href="${path}/shop/cart/deleteAll.do"; */
		        }
		    });
		});
	</script>
</head>
<body>
<!-- 공통헤더 템플릿 -->
<%@ include file="template_header.jsp"%>

<h2>장바구니</h2>
<c:choose>
    <c:when test="${map.count == 0 }">
    <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
    <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
    <!-- map에 자료가 아무것도 없다면 -->
        장바구니가 비었습니다.
    </c:when>
    
    <c:otherwise>
        <form id="form1" name="form1" method="post">
            <table border="1" width="400px">
                <tr>
                	<th><input type ="checkbox" name="mainCB"> 체크박스</th>
                    <th>상품명/옵션</th>
                    <th>수량</th>
                    <th>상품금액</th>
                    <th>적립금</th>
                    <th>배송비</th>
                </tr>
                <tr align="center">
                	<td><input type ="checkbox" name="subCB"> 체크박스</td>
                    <td>상품명/옵션</td>
                    <td>수량</td>
                    <!-- <fmt:formatNumber value="" pattern="#,###,###"/> -->
                    <td>상품금액</td>
                    <td>적립금</td>
                    <td>배송비</td>
                </tr>
            </table>
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
    </c:otherwise>
</c:choose>
</body>
</html>
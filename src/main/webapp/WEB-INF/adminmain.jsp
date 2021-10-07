<%@page import = "woorigym.product.model.vo.ProductTable" %>
<%@page import = "java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ProductTable> volist = (ArrayList<ProductTable>)request.getAttribute("productvolist");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
</head>
<body>
<table border = "1">
		<tr>
			<td>상품번호</td>
		<tr>
<%
		if(volist != null){
			for(ProductTable vo : volist){
			//tr이 volist 갯수 만큼 생기게 됨.
%>
			<tr>
				<%=vo.getProductName()%>
			<tr>
<%
			}
		}
%>
	</table>
</body>
</html>
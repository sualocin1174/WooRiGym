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
<style>
	#table1 td {
		width:1000px;
		height:1000px;
	}
</style>
</head>
<body>
<table border = "1" id="table1">
		<tr>
			<td>상품번호</td>
		</tr>
<%
		if(volist != null){
			for(ProductTable vo : volist){
%>			
			<tr>
			<td><%=vo.getProductNo()%></td>
			<td><%=vo.getProductName()%></td>
			<td><%=vo.getParentCategory()%></td>
			<td><%=vo.getChildCategory()%></td>
			<td><%=vo.getQuantity()%></td>
			<td><%=vo.getPrice()%></td>
			<td><%=vo.getProductInfoUrl()%></td>
			<td><%=vo.getProductOption()%></td>
			</tr>
<%
			}
		}
%>
	</table>
</body>
</html>
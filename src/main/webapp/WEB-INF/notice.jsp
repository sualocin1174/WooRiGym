<%@page import = "woorigym.admin.model.vo.NoticeTable" %>
<%@page import = "java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<NoticeTable> volist = (ArrayList<NoticeTable>)request.getAttribute("noticevolist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "1" id="table1">
		<tr>
			<td>공지사항</td>
		</tr>
<%
		if(volist != null){
			for(NoticeTable vo : volist){
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
</body>
</html>
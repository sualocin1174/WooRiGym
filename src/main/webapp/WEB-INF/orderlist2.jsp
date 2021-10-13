   <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="woorigym.user.model.vo.OrderList"%>
<%@ page import = "java.util.ArrayList"%>
<%--
//    UserTable o = (UserTable)session.getAttribute("loginSS");   // ${user_id}
//    ArrayList<OrderList> volist = (ArrayList<OrderList>)session.getAttribute("orderList");  // ${orderList} 
--%>
<!-- 10/10 추가 - 참고용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문배송조회 Get방식</title>
</head>
<body>
	<c:if test="${orderList != null}">
		<c:forEach var="vo" items="${orderList}">
			${vo.order_no} <br>
		</c:forEach>
	</c:if>
	
</body>
</html>
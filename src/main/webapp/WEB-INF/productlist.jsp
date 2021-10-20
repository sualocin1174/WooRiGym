 <!-- 헤더 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template_header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
</head>
<body>
<!-- 공통헤더 템플릿 -->
 	 <%@ include file="template_header.jsp"%>
    ${productvolist[0].imagesFilePath[0]}
   <c:forEach items="${productvolist}" var="vo">
      <p>${vo.productName }<p>
      <c:forEach items="${vo.imagesFilePath }" var="imgfile">
         <img src="${imgfile }" width="200" height="200">
      </c:forEach>
      <hr>
   </c:forEach>
</body>
</html>
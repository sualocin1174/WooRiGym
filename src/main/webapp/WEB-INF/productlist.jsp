<!-- 웹폰트: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
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
<style>
/* reset */
 * {
            margin: 0;
            padding: 0;
}
 body{
    font-family: 'Noto Sans KR', sans-serif;
}
</style>
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
<script>
/*
	var cloudinary = require('cloudinary');

	cloudinary.config({
	 cloud_name: "chsh9410@gmail.com", // add your cloud_name
	 api_key: "248355888283262", // add your api_key
	 api_secret: "6MzXp7Z0dJL-DLzN1Y5JAXKtnwg", // add your api_secret
	 secure: true
	});
	var folder1 = "${productvolist[0].productInfoUrl}";
	cloudinary.v2.search.expression(
	  'folder:woorigym/CARDIO-RN-0001/*' // add your folder
	  ).sort_by('public_id','desc').max_results(30).execute().then(result=>console.log(result));
	*/
	</script>
</body>
</html>